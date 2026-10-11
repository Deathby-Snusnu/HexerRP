local _, addon = ...

local SELF_ONLY = {
    LIFE_TAP=true, DARK_PACT=true, DEMON_ARMOR=true, FEL_ARMOR=true,
    SOUL_LINK=true, UNENDING_BREATH=true, DETECT_INVISIBILITY=true,
    SUMMON_IMP=true, SUMMON_VOIDWALKER=true, SUMMON_SUCCUBUS=true,
    SUMMON_FELHUNTER=true, SUMMON_INFERNAL=true, RITUAL_SUMMONING=true,
}
local FRIENDLY_OR_SELF = { HEALTHSTONE=true, SOULSTONE=true }

local function ResolveTargetName(key)
    if SELF_ONLY[key] then return nil end
    if FRIENDLY_OR_SELF[key] then
        if UnitExists("target") and UnitCanAssist("player", "target") then return UnitName("target") end
        return UnitName("player")
    end
    if UnitExists("target") then return UnitName("target") end
    return nil
end

function addon.GetDemonName()
    if UnitExists("pet") then return UnitName("pet") end
    return nil
end

function addon.ChooseText(pool, targetName, demonName)
    if type(pool) ~= "table" then return nil end
    local choices = pool
    if #pool == 0 then
        choices = targetName and pool.ziel or pool.gruppe
        if type(choices) ~= "table" or #choices == 0 then choices = pool.gruppe end
    end
    if type(choices) ~= "table" or #choices == 0 then return nil end
    local usable = {}
    for _, text in ipairs(choices) do
        if type(text) == "string" and text ~= "" then
            local needsTarget = text:find("%s",1,true) ~= nil
            local needsPet = text:find("%p",1,true) ~= nil
            if (not needsTarget or targetName) and (not needsPet or demonName) then usable[#usable+1]=text end
        end
    end
    if #usable == 0 then return nil end
    local text = usable[math.random(#usable)]
    if targetName then text = text:gsub("%%s", function() return targetName end) end
    if demonName then text = text:gsub("%%p", function() return demonName end) end
    return text
end

function addon.BuildText(key)
    local targetName = ResolveTargetName(key)
    local demonName = addon.GetDemonName()
    local personal = addon.db.personalTexts[key]
    if personal then return addon.ChooseText(personal, targetName, demonName) end
    local lang = addon.GetOutputLanguage()
    local pool = addon.GetLocalePoolExact(lang, "texts", key)
        or addon.GetLocalePoolExact("deDE", "texts", key)
    return addon.ChooseText(pool, targetName, demonName)
end
