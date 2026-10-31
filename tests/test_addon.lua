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
        inCombat = false,
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
    environment.UnitExists = function()
        return false
    end
    environment.UnitName = function(unit)
        return unit == "player" and "Testcharakter" or nil
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

print("PASS: " .. checks .. " checks")
