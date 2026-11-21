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
        inCombat = false, target = options.target, pet = options.pet,
        player = options.player or "Testcharakter",
        secretNames = options.secretNames or {},
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
            random = options.random or function(minimum, maximum)
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
    environment.UnitRace = function()
        return "Draenei", options.race or "Draenei"
    end
    environment.UnitExists = function(unit)
        if unit == "target" then return state.target ~= nil end
        if unit == "pet" then return state.pet ~= nil end
    end
    environment.UnitName = function(unit)
        if unit == "player" then return state.player end
        if unit == "target" then return state.target end
        if unit == "pet" then return state.pet end
    end
    if options.hasSecretValue then
        environment.issecretvalue = function(value)
            return state.secretNames[value] == true
        end
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
        if not (options.textsOnly and file:match("Expansion%.lua$")) then
            local chunk
            if setfenv then
                chunk = assert(loadfile(file))
                setfenv(chunk, environment)
            else
                chunk = assert(loadfile(file, "t", environment))
            end
            chunk("HexerRP", addon)
        end
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
local placeholders = {
    deDE = {target="das Ziel", player="Ihr", pet="Euer Begleiter"},
    enUS = {target="the target", player="you", pet="your companion"},
    frFR = {target="la cible", player="vous", pet="votre compagnon"},
}
for lang, names in pairs(placeholders) do
    local secret = newClient({
        target="TARGET_SECRET", pet="PET_SECRET", hostile=true,
        secretNames={TARGET_SECRET=true, PLAYER_SECRET=true, PET_SECRET=true},
        hasSecretValue=true,
        random=function(minimum, maximum) return maximum or minimum end,
        db={personalTexts={
            SHADOW_BOLT={"target=%s"},
            HEALTHSTONE={"player=%s"},
        }},
    })
    secret.command("language " .. lang)
    secret.player = "PLAYER_SECRET"
    secret.addon.localeData[lang].ambient.MURMUR = {"pet=%p"}
    check(secret.addon.BuildText("SHADOW_BOLT") == "target=" .. names.target,
        lang .. " secret target uses a localized placeholder")
    check(secret.addon.BuildText("HEALTHSTONE") == "player=" .. names.player,
        lang .. " secret player uses a localized placeholder")
    check(secret.addon.BuildAmbient("MURMUR") == "pet=" .. names.pet,
        lang .. " secret pet uses a localized placeholder in ambient text")
end
local ordinaryNames = newClient({
    target="ORDINARY_TARGET", pet="ORDINARY_PET", player="ORDINARY_PLAYER",
    hostile=true, hasSecretValue=true,
    random=function(minimum, maximum) return maximum or minimum end,
    db={personalTexts={
        SHADOW_BOLT={"target=%s"},
        HEALTHSTONE={"player=%s"},
    }},
})
ordinaryNames.addon.localeData.deDE.ambient.MURMUR = {"pet=%p"}
check(ordinaryNames.addon.BuildText("SHADOW_BOLT") == "target=ORDINARY_TARGET",
    "ordinary target names are preserved")
check(ordinaryNames.addon.BuildText("HEALTHSTONE") == "player=ORDINARY_PLAYER",
    "ordinary player names are preserved")
check(ordinaryNames.addon.BuildAmbient("MURMUR") == "pet=ORDINARY_PET",
    "ordinary pet names are preserved in ambient text")
local legacyNames = newClient({
    target="LEGACY_TARGET", pet="LEGACY_PET", player="LEGACY_PLAYER",
    hostile=true,
    random=function(minimum, maximum) return maximum or minimum end,
    db={personalTexts={
        SHADOW_BOLT={"target=%s"},
        HEALTHSTONE={"player=%s"},
    }},
})
legacyNames.addon.localeData.deDE.ambient.MURMUR = {"pet=%p"}
check(legacyNames.addon.BuildText("SHADOW_BOLT") == "target=LEGACY_TARGET",
    "target names are preserved without issecretvalue")
check(legacyNames.addon.BuildText("HEALTHSTONE") == "player=LEGACY_PLAYER",
    "player names are preserved without issecretvalue")
check(legacyNames.addon.BuildAmbient("MURMUR") == "pet=LEGACY_PET",
    "pet names are preserved in ambient text without issecretvalue")
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
local racialRolls = 0
local racialOnly = newClient({
    race="Human",
    db={racialTextChance=40},
    random=function(minimum, maximum)
        if minimum == 100 and maximum == nil then
            racialRolls = racialRolls + 1
            return racialRolls == 1 and 100 or 1
        end
        return minimum
    end,
})
racialOnly.addon.localeData.deDE.texts.SHADOW_BOLT = nil
racialOnly.addon.localeData.deDE.racial.Human.SHADOW_BOLT = {"Rassentext."}
check(racialOnly.addon.BuildText("SHADOW_BOLT") == nil and racialRolls == 1,
    "racial text chance is rolled once across repeated fallback stages")


-- All 27 core ability expansions are now authored rather than templated.
-- Test both targeted-only and group-only spells without changing their shapes.
local coreExpansionKeys = {
    "SHADOW_BOLT", "IMMOLATE", "CORRUPTION", "CURSE_WEAKNESS",
    "FEAR", "LIFE_TAP", "DRAIN_LIFE", "SUMMON_IMP",
    "CURSE_RECKLESSNESS", "OMEN_AGONY", "CURSE_AGONY", "DRAIN_SOUL",
    "LIFE_FUNNEL", "DEMON_ARMOR", "FEL_ARMOR", "SOUL_LINK",
    "SOUL_FIRE", "HEALTHSTONE", "SOULSTONE", "DARK_PACT",
    "SUMMON_VOIDWALKER", "SUMMON_SUCCUBUS", "SUMMON_FELHUNTER",
    "SUMMON_INFERNAL", "RITUAL_SUMMONING", "UNENDING_BREATH",
    "DETECT_INVISIBILITY",
}
local targetOnly = { SOUL_FIRE=true, SOULSTONE=true }
local groupOnly = {
    LIFE_TAP=true, SUMMON_IMP=true, CURSE_AGONY=true, LIFE_FUNNEL=true,
    DEMON_ARMOR=true, FEL_ARMOR=true, SOUL_LINK=true, DARK_PACT=true,
    SUMMON_VOIDWALKER=true, SUMMON_SUCCUBUS=true, SUMMON_FELHUNTER=true,
    SUMMON_INFERNAL=true, RITUAL_SUMMONING=true, UNENDING_BREATH=true,
    DETECT_INVISIBILITY=true,
}
local obsoleteExpansion = {
    deDE = { "Der Nether hoert zu. Das genuegt mir.", "Der Nether hat Euch bemerkt, %s." },
    enUS = { "The Nether is listening. That is enough for me.", "The Nether has noticed you, %s." },
    frFR = { "Le Neant distordu ecoute. Cela me suffit.", "Le Neant distordu vous a remarque, %s." },
}
local textBaseline = newClient({textsOnly = true}).addon.localeData
local function addedVariants(pool, baseline)
    local baselineCounts = {}
    for _, line in ipairs(baseline) do
        baselineCounts[line] = (baselineCounts[line] or 0) + 1
    end
    local added = {}
    for _, line in ipairs(pool) do
        if baselineCounts[line] and baselineCounts[line] > 0 then
            baselineCounts[line] = baselineCounts[line] - 1
        else
            added[#added + 1] = line
        end
    end
    return added
end
for lang, legacy in pairs(obsoleteExpansion) do
    local texts = addon.localeData[lang].texts
    local present = 0
    for _, key in ipairs(coreExpansionKeys) do
        local pool = texts[key]
        local baselinePool = textBaseline[lang].texts[key]
        check(type(pool) == "table", lang .. " has spell " .. key)
        check(type(baselinePool) == "table", lang .. " baseline has spell " .. key)
        present = present + 1
        local hasGroup = type(pool.gruppe) == "table"
        local hasTarget = type(pool.ziel) == "table"
        local expectedGroup = not targetOnly[key]
        if key == "HEALTHSTONE" then expectedGroup = lang == "deDE" end
        check(hasGroup == expectedGroup, lang .. " group shape for " .. key)
        check(hasTarget == not groupOnly[key], lang .. " target shape for " .. key)
        if hasGroup then
            check(#pool.gruppe >= 2, lang .. " group variants for " .. key)
            local sawSpeech, sawEmote = false, false
            for _, line in ipairs(pool.gruppe) do
                check(line ~= legacy[1], lang .. " no shared group speech for " .. key)
                check(not line:find("%s", 1, true), lang .. " group has no target token for " .. key)
                if line:sub(1, 1) == "*" then sawEmote = true else sawSpeech = true end
            end
            check(sawSpeech and sawEmote, lang .. " group includes speech and emote " .. key)
            local added = addedVariants(pool.gruppe, baselinePool.gruppe)
            check(#added == 2, lang .. " adds two group variants for " .. key)
            local addedSpeech, addedEmote = false, false
            for _, line in ipairs(added) do
                check(not line:find("%s", 1, true), lang .. " added group variant has no target token for " .. key)
                if line:sub(1, 1) == "*" then addedEmote = true else addedSpeech = true end
            end
            check(addedSpeech and addedEmote, lang .. " added group speech and emote for " .. key)
        end
        if hasTarget then
            check(#pool.ziel >= 2, lang .. " targeted variants for " .. key)
            local named, emote = 0, false
            for _, line in ipairs(pool.ziel) do
                check(line ~= legacy[2], lang .. " no shared target speech for " .. key)
                if line:find("%s", 1, true) then named = named + 1 end
                if line:sub(1, 1) == "*" then emote = true end
            end
            check(named >= 1 and emote, lang .. " named target speech/emote for " .. key)
            local added = addedVariants(pool.ziel, baselinePool.ziel)
            check(#added == 2, lang .. " adds two target variants for " .. key)
            local addedSpeech, addedEmote = false, false
            for _, line in ipairs(added) do
                check(line:find("%s", 1, true), lang .. " added target variant names its target for " .. key)
                if line:sub(1, 1) == "*" then addedEmote = true else addedSpeech = true end
            end
            check(addedSpeech and addedEmote, lang .. " added target speech and emote for " .. key)
        end
    end
    check(present == 27, lang .. " all core spells inspected")
end

-- MusicRP is opt-in and must preserve the ordinary spell and chat pipeline.
local musicClient = newClient({target="Training Dummy", hostile=true})
local music = musicClient.addon
check(not music.db.musicEnabled and music.db.musicChance == 15, "MusicRP disabled by default")
check(type(music.musicRPReferences) == "table", "music references are loaded")
local musicCount = 0
for key in pairs(music.musicRPReferences) do musicCount = musicCount + 1 end
check(musicCount == 12, "12 original music-inspired references")
for _, lang in ipairs({"deDE","enUS","frFR"}) do
    check(music.SetOutputLanguage(lang), "music language " .. lang .. " available")
    for key, ref in pairs(music.musicRPReferences) do
        local node = music.musicRP[lang][key]
        check(type(ref.song) == "string" and type(ref.artist) == "string", "reference metadata " .. key)
        check(type(node) == "table" and type(node.gruppe) == "table", lang .. " music pool " .. key)
        for _, kind in ipairs({"gruppe", "ziel"}) do
            if type(node[kind]) == "table" then
                check(#node[kind] == 2, lang .. " speech and emote " .. key .. kind)
                check(node[kind][1]:sub(1,1) ~= "*", lang .. " music speech " .. key)
                check(node[kind][2]:sub(1,1) == "*" and node[kind][2]:sub(-1) == "*",
                    lang .. " music emote " .. key)
                for _, line in ipairs(node[kind]) do
                    check(#line <= 255 and not line:find("|", 1, true), lang .. " chat-safe music line " .. key)
                    if kind == "gruppe" then
                        check(not line:find("%s", 1, true), lang .. " group line has no target token " .. key)
                    else
                        check(line:find("%s", 1, true), lang .. " targeted line includes name " .. key)
                    end
                end
            end
        end
    end
end
music.SetOutputLanguage("deDE")
check(music.ChooseMusicText("LIFE_TAP", nil, nil, "Human") == nil,
    "music output unavailable while switched off")
musicClient.command("music on")
check(music.db.musicEnabled, "music enabled via slash command")
musicClient.command("music chance 100")
check(music.db.musicChance == 100, "music chance command applies")
check(music.ChooseMusicText("LIFE_TAP", nil, nil, "Human") ==
    music.musicRP.deDE.LIFE_TAP.gruppe[1], "enabled music selects original theme")
check(music.ChooseMusicText("SUMMON_IMP", nil, nil, "Human") == nil,
    "gnome-only humorous music text is race guarded")
check(music.ChooseMusicText("SUMMON_IMP", nil, nil, "Gnome") ~= nil,
    "gnome music text is available to gnomes")
local targetMusic = music.ChooseMusicText("IMMOLATE", "Training Dummy", nil, "Human")
check(targetMusic:find("Training Dummy", 1, true), "music target interpolated safely")
musicClient.command("music chance 0")
check(music.ChooseMusicText("LIFE_TAP", nil, nil, "Human") == nil,
    "zero chance prevents music output")
musicClient.command("music chance 101")
check(music.db.musicChance == 0, "out of range music chance rejected")
musicClient.command("music off")
check(not music.db.musicEnabled, "music switch disables output")
local musicPersonal = newClient({db = {musicEnabled=true, musicChance=100,
    personalTexts={LIFE_TAP={"A personal blood pact."}}}})
check(musicPersonal.addon.BuildText("LIFE_TAP") == "A personal blood pact.",
    "personal texts outrank MusicRP")
local musicRepair = newClient({db={musicEnabled="yes",musicChance=999}})
check(not musicRepair.addon.db.musicEnabled and musicRepair.addon.db.musicChance == 15,
    "invalid persisted music settings restored")
local musicSend = newClient({db={musicEnabled=true,musicChance=100,textChance=100,cooldown=0}})
check(musicSend.addon.TryText("LIFE_TAP"), "music uses normal TryText dispatch")
check(musicSend.messages[#musicSend.messages].channel == "SAY", "music speech uses SAY channel")
check(musicSend.addon.SendText(musicSend.addon.musicRP.deDE.LIFE_TAP.gruppe[2]),
    "music emote can be sent")
check(musicSend.messages[#musicSend.messages].channel == "EMOTE", "music emote uses EMOTE channel")

-- Second-wave song motifs extend the opt-in catalogue without copying lyrics.
local bonusClient = newClient({db={musicEnabled=true,musicChance=100,textChance=100,cooldown=0}})
local bonus = bonusClient.addon
local bonusCount = 0
for id, reference in pairs(bonus.musicRPBonusReferences) do
    bonusCount = bonusCount + 1
    check(type(id)=="string" and type(reference.key)=="string" and
        type(reference.artist)=="string" and type(reference.song)=="string",
        "valid internal second-wave music reference")
end
check(bonusCount == 20, "twenty additional music motifs")
for _, lang in ipairs({"deDE","enUS","frFR"}) do
    bonus.SetOutputLanguage(lang)
    local expectedCounts = {}
    for _, reference in pairs(bonus.musicRPBonusReferences) do
        expectedCounts[reference.key] = (expectedCounts[reference.key] or 0) + 1
    end
    for key, expectedCount in pairs(expectedCounts) do
        local choices = bonus.musicRPBonus[lang][key]
        check(type(choices)=="table" and #choices==expectedCount,
            lang.." has all bonus motifs for "..key)
    end
    for key, choices in pairs(bonus.musicRPBonus[lang]) do
        check(type(choices)=="table" and #choices>=1, lang.." has bonus choices "..key)
        for _, lines in ipairs(choices) do
            check(#lines == 2 and lines[1]:sub(1,1)~="*" and
                lines[2]:sub(1,1)=="*" and lines[2]:sub(-1)=="*",
                lang.." bonus speech and emote for "..key)
            for _, line in ipairs(lines) do
                check(#line<=255 and not line:find("|",1,true) and
                    not line:find("%s",1,true),lang.." safe non-target bonus for "..key)
            end
        end
    end
    local newOnly = bonus.ChooseMusicText("CORRUPTION",nil,nil,"Human")
    check(type(newOnly)=="string",lang.." new bonus-only spell is selectable")
end
local laterBonus = newClient({
    db={musicEnabled=true,musicChance=100,textChance=100,cooldown=0},
    random=function(minimum, maximum)
        if maximum then return maximum end
        return minimum
    end,
})
laterBonus.addon.SetOutputLanguage("deDE")
local laterSoulstone = laterBonus.addon.ChooseMusicText("SOULSTONE",nil,nil,"Human")
check(laterSoulstone == laterBonus.addon.musicRPBonus.deDE.SOULSTONE[2][2],
    "deterministic RNG selects a later bonus on a shared action key")

local fallbackBonus = newClient({
    db={musicEnabled=true,musicChance=100,textChance=100,cooldown=0},
    random=function(minimum, maximum)
        if maximum==100 then return 100 end
        if maximum==3 then return 2 end
        if maximum==2 then return 2 end
        return minimum
    end,
})
fallbackBonus.addon.SetOutputLanguage("enUS")
fallbackBonus.addon.musicRPBonus.enUS.IMMOLATE[1] = {
    "This pool needs %s.",
    "*This emote needs %p.*",
}
local fallbackText = fallbackBonus.addon.ChooseMusicText("IMMOLATE",nil,nil,"Human")
check(fallbackText == fallbackBonus.addon.musicRPBonus.enUS.IMMOLATE[2][2],
    "deterministic RNG falls back from an unusable pool")
bonusClient.command("music off")
check(bonus.ChooseMusicText("CORRUPTION",nil,nil,"Human")==nil,
    "bonus motifs respect music off")

print("PASS: " .. checks .. " checks")
