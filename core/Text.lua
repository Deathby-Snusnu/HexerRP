-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

local SELF_ONLY = {
    LIFE_TAP=true, DARK_PACT=true, DEMON_ARMOR=true, FEL_ARMOR=true,
    SOUL_LINK=true, UNENDING_BREATH=true, DETECT_INVISIBILITY=true,
    SUMMON_IMP=true, SUMMON_VOIDWALKER=true, SUMMON_SUCCUBUS=true,
    SUMMON_FELHUNTER=true, SUMMON_INFERNAL=true, RITUAL_SUMMONING=true,
}
local FRIENDLY_OR_SELF = { HEALTHSTONE=true, SOULSTONE=true }
local DEMON_ONLY = { LIFE_FUNNEL=true }

local function ResolveTargetName(key)
    if SELF_ONLY[key] or DEMON_ONLY[key] then return nil end
    if FRIENDLY_OR_SELF[key] then
        if UnitExists("target") and UnitCanAssist("player", "target") then return UnitName("target") end
        return UnitName("player")
    end
    if UnitExists("target") then return UnitName("target") end
end

function addon.GetDemonName()
    return UnitExists("pet") and UnitName("pet") or nil
end

local function ChooseArray(pool, targetName, demonName)
    if type(pool) ~= "table" or #pool == 0 then return nil end
    local usable = {}
    for _, text in ipairs(pool) do
        if type(text) == "string" and text ~= "" then
            local needsTarget = text:find("%s",1,true) ~= nil
            local needsPet = text:find("%p",1,true) ~= nil
            if (not needsTarget or targetName) and (not needsPet or demonName) then
                usable[#usable+1] = text
            end
        end
    end
    if #usable == 0 then return nil end
    local text = usable[math.random(#usable)]
    if targetName then text = text:gsub("%%s", function() return targetName end) end
    if demonName then text = text:gsub("%%p", function() return demonName end) end
    return text
end

function addon.ChooseText(pool, targetName, demonName)
    if type(pool) ~= "table" then return nil end
    if #pool > 0 then return ChooseArray(pool, targetName, demonName) end
    if targetName then
        local text = ChooseArray(pool.ziel, targetName, demonName)
        if text then return text end
    end
    local text = ChooseArray(pool.gruppe, targetName, demonName)
    if text then return text end
    return ChooseArray(pool.ziel, targetName, demonName)
end

function addon.BuildText(key)
    local targetName = ResolveTargetName(key)
    local demonName = addon.GetDemonName()
    if DEMON_ONLY[key] and not demonName then return nil end
    local personal = addon.db.personalTexts[key]
    if personal then
        local text = addon.ChooseText(personal, targetName, demonName)
        if text then return text end
    end
    local race = addon.GetPlayerRaceToken and addon.GetPlayerRaceToken() or select(2, UnitRace("player"))
    -- UnitRace returns Scourge for Forsaken/Undead on classic clients.
    -- Racial texts override only their defined spells; every missing or
    -- currently unusable pool falls back to the general warlock texts.
    local lang = addon.GetOutputLanguage()
    for _, selection in ipairs({
        {lang, "racial", race},
        {lang, "texts", nil},
        {"deDE", "racial", race},
        {"deDE", "texts", nil},
    }) do
        local pool
        if selection[2] == "racial" then
            pool = addon.GetLocalePoolExact(selection[1], selection[2], selection[3], key)
        else
            pool = addon.GetLocalePoolExact(selection[1], selection[2], key)
        end
        local text = addon.ChooseText(pool, targetName, demonName)
        if text then return text end
    end
    return nil
end
