local pathSeparator = package.config:sub(1, 1)
local files = {}

for line in io.lines("HexerRP.toc") do
    local file = line:match("^%s*(.-)%s*$")
    if file ~= "" and not file:find("^#") then
        files[#files + 1] = file:gsub("[/\\]", pathSeparator)
    end
end

local checks = 0

local function check(condition, message)
    assert(condition, message)
    checks = checks + 1
end

local function newClient(options)
    options = options or {}
    local state = {
        now = 0,
        class = options.class or "WARLOCK",
        inCombat = false, target = options.target,
        hostile = options.hostile == true,
        messages = {},
        notices = {},
    }
    local environment = setmetatable({
        SlashCmdList = {},
        LE_PARTY_CATEGORY_INSTANCE = 2,
        HexerRP_CharacterDB = options.db,
        RPChatMod = options.rpChatMod,
        math = setmetatable({
            random = function(minimum, maximum)
                return maximum and minimum or 1
            end,
        }, { __index = math }),
    }, { __index = _G })
    environment._G = environment
    environment.print = function(message)
        state.notices[#state.notices + 1] = message
    end
    environment.GetTime = function()
        return state.now
    end
    environment.UnitClass = function()
        return "class", state.class
    end
    environment.UnitExists = function(unit)
        return unit == "target" and state.target ~= nil
    end
    environment.UnitName = function(unit)
        if unit == "player" then return "Testcharakter" end
        if unit == "target" then return state.target end
    end
    environment.UnitCanAttack = function()
        return state.target ~= nil and state.hostile
    end
    environment.UnitCanAssist = function()
        return state.target ~= nil and not state.hostile
    end
    environment.UnitAffectingCombat = function()
        return state.inCombat
    end
    environment.IsInGroup = function()
        return false
    end
    environment.IsInRaid = function()
        return false
    end
    environment.C_ChatInfo = {
        SendChatMessage = function(text, channel, language)
            state.messages[#state.messages + 1] = {
                text = text,
                channel = channel,
                language = language,
            }
        end,
    }
    environment.CreateFrame = function()
        return {
            RegisterEvent = function(_, event)
                check(event == "PLAYER_LOGIN", "only login event is registered")
            end,
            SetScript = function(_, script, handler)
                if script == "OnEvent" then
                    state.login = handler
                elseif script == "OnUpdate" then
                    state.update = handler
                end
            end,
        }
    end

    local addon = {}
    for _, file in ipairs(files) do
        local chunk
        if setfenv then
            chunk = assert(loadfile(file))
            setfenv(chunk, environment)
        else
            chunk = assert(loadfile(file, "t", environment))
        end
        chunk("HexerRP", addon)
    end

    state.addon = addon
    state.environment = environment
    state.command = environment.SlashCmdList.HEXERRP
    state.login()
    return state
end

local client = newClient()
local addon = client.addon
check(addon.ready and addon.isWarlock, "login enables warlock addon")
check(type(client.update) == "function", "ambient ticker is installed")
check(addon.db.textChance == 35 and addon.db.cooldown == 18, "default text settings")
check(addon.db.ambientEnabled and addon.db.ambientChance == 70, "default ambient settings")
check(addon.TryText("SHADOW_BOLT"), "warlock text sends")
check(client.messages[#client.messages].channel == "SAY", "normal text uses configured channel")

local languageClient = newClient({
    rpChatMod = {
        GetChatLanguageID = function(channel)
            return channel == "SAY" and 17 or 23
        end,
    },
})
languageClient.addon.SendText("normal speech")
check(languageClient.messages[#languageClient.messages].language == 17,
    "normal SAY uses the RPChatMod language")
languageClient.addon.SendText("forced speech", "SAY")
check(languageClient.messages[#languageClient.messages].language == nil,
    "forced SAY keeps the client-default language")
languageClient.addon.db.chatChannel = "YELL"
languageClient.addon.SendText("normal yell")
check(languageClient.messages[#languageClient.messages].language == 23,
    "normal YELL uses the RPChatMod language")
languageClient.addon.SendText("forced yell", "YELL")
check(languageClient.messages[#languageClient.messages].language == nil,
    "forced YELL keeps the client-default language")

client.now = 180
client.update(nil, 1)
check(addon.HasPendingAmbient(), "timer queues ambient text at scheduled time")
local messageCount = #client.messages
check(addon.TryText("SHADOW_BOLT"), "player action flushes pending ambient line")
check(#client.messages == messageCount + 1, "pending ambient replaces the requested line")
check(not addon.HasPendingAmbient(), "successful ambient flush clears pending line")
check(client.messages[#client.messages].channel == "SAY", "ordinary ambient uses configured channel")

client.inCombat = true
check(not addon.QueueAmbient("MURMUR"), "combat blocks ambient by default")
client.command("ambient combat on")
check(addon.QueueAmbient("MURMUR"), "combat option allows ambient queue")
check(addon.FlushPendingAmbient(), "combat-enabled ambient can be flushed")
client.inCombat = false

client.command("ambient chance 0")
check(addon.db.ambientChance == 0 and not addon.QueueAmbient("MURMUR"),
    "zero ambient chance blocks queue")
client.command("ambient chance 100")
check(addon.db.ambientChance == 100, "maximum ambient chance accepted")
client.command("ambient interval 30 7200")
check(addon.db.ambientMinInterval == 30 and addon.db.ambientMaxInterval == 7200,
    "ambient interval boundaries accepted")
client.command("ambient interval 7201 7201")
check(addon.db.ambientMinInterval == 30 and addon.db.ambientMaxInterval == 7200,
    "out-of-range ambient interval rejected")
client.command("ambient off")
check(not addon.db.ambientEnabled, "ambient can be disabled")
client.command("ambient on")
check(addon.db.ambientEnabled, "ambient can be enabled")

messageCount = #client.messages
client.command("ambient test demonic_yell")
check(#client.messages == messageCount + 1, "forced demonic ambient test sends")
check(client.messages[#client.messages].channel == "YELL", "demonic yell uses YELL channel")
check(not addon.HasPendingAmbient(), "forced ambient test does not queue a line")

client.command("chance 100")
client.command("cooldown 0")
check(addon.db.textChance == 100 and addon.db.cooldown == 0, "text settings accept boundaries")
client.command("chance 101")
check(addon.db.textChance == 100, "out-of-range chance leaves setting unchanged")
client.command("cooldown -1")
check(addon.db.cooldown == 0, "negative cooldown leaves setting unchanged")

local nonWarlock = newClient({ class = "MAGE" })
check(not nonWarlock.addon.TryAmbient("MURMUR", true), "non-warlock cannot send ambient text")
check(not nonWarlock.addon.TryText("SHADOW_BOLT"), "non-warlock cannot send spell text")
check(#nonWarlock.messages == 0, "non-warlock sends no messages")

local repaired = newClient({
    db = {
        textChance = 101,
        cooldown = -1,
        ambientChance = "invalid",
        ambientMinInterval = 10,
        ambientMaxInterval = 9000,
        ambientEnabled = "yes",
        ambientInCombat = 1,
    },
})
check(repaired.addon.db.textChance == 35 and repaired.addon.db.cooldown == 18,
    "invalid core settings are restored")
check(repaired.addon.db.ambientChance == 70 and repaired.addon.db.ambientMinInterval == 180
    and repaired.addon.db.ambientMaxInterval == 420, "invalid ambient limits are restored")
check(repaired.addon.db.ambientEnabled and not repaired.addon.db.ambientInCombat,
    "invalid ambient switches use defaults")

local added = {"SEARING_PAIN","RAIN_OF_FIRE","HELLFIRE","CONFLAGRATE","SHADOWBURN","DEATH_COIL","HOWL_OF_TERROR","BANISH","ENSLAVE_DEMON","EYE_OF_KILROGG","SENSE_DEMONS","DRAIN_MANA","SIPHON_LIFE","CURSE_TONGUES","CURSE_ELEMENTS","CURSE_SHADOW","CURSE_DOOM","CURSE_EXHAUSTION","RITUAL_DOOM","DEMONIC_SACRIFICE","SHADOW_WARD","CREATE_FIRESTONE","CREATE_SPELLSTONE","BANE_OF_HAVOC","INCINERATE","WRACK","PORTAL_SUMMONING","SPELL_LOCK","FEL_DOMINATION"}
check(#added == 29, "29 warlock expansions")
for _, lang in ipairs({"deDE", "enUS", "frFR"}) do
    local one = newClient()
    one.command("language " .. lang)
    for _, key in ipairs(added) do
        local pool = one.addon.localeData[lang].texts[key]
        check(type(pool) == "table" and type(pool.gruppe) == "table"
            and #pool.gruppe >= 4, lang .. " distinct text lines for " .. key)
        local line = one.addon.BuildText(key)
        check(type(line) == "string" and #line > 3 and #line <= 255,
            lang .. " safe targetless text " .. key)
    end
end
local friendly = newClient({target="FRIENDLY_SENTINEL_204", hostile=false})
check(not friendly.addon.BuildText("INCINERATE"):find("FRIENDLY_SENTINEL_204",1,true),
    "incinerate does not name a friendly target")
local hostile = newClient({target="HOSTILE_SENTINEL_580", hostile=true})
check(hostile.addon.BuildText("INCINERATE"):find("HOSTILE_SENTINEL_580",1,true),
    "incinerate can address hostile target")
check(not hostile.addon.BuildText("RAIN_OF_FIRE"):find("HOSTILE_SENTINEL_580",1,true),
    "area spell never names arbitrary target")
local preserved = newClient({db={personalTexts={WRACK={"Mein eigener Hexerfluch."}}}})
check(preserved.addon.BuildText("WRACK") == "Mein eigener Hexerfluch.",
    "warlock personal texts take priority")

print("PASS: " .. checks .. " checks")
