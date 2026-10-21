-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

-- Dynamic text-key listing, including keys added through RP Text Studio.
-- "list": usable for this character; "list racial": racial keys for this race;
-- "list all": all races/classes, with source labels.
local function ShowDynamicList(mode, kind)
    if mode ~= "" and mode ~= "racial" and mode ~= "all" then
        addon.Notify("Benutzung: /" .. kind .. " list [racial|all]")
        return
    end
    local race = addon.GetPlayerRaceToken and addon.GetPlayerRaceToken() or select(2, UnitRace("player"))
    local _, class = UnitClass("player")
    local found = {}
    local function Add(key, source)
        if type(key) ~= "string" then return end
        if not found[key] then found[key] = {} end
        found[key][source] = true
    end
    local function Flat(pool, source)
        if type(pool) ~= "table" then return end
        for key, val in pairs(pool) do
            if type(val) == "table" then Add(key, source) end
        end
    end
    local function Racial(pool, source)
        if type(pool) ~= "table" then return end
        if mode == "all" then
            for raceKey, values in pairs(pool) do Flat(values, source .. ":" .. raceKey) end
        else
            Flat(pool[race], source .. ":" .. tostring(race))
        end
    end
    local function Class(pool, source)
        if type(pool) ~= "table" then return end
        if mode == "all" then
            for classKey, values in pairs(pool) do Flat(values, source .. ":" .. classKey) end
        else
            Flat(pool[class], source .. ":" .. tostring(class))
        end
    end
    local function RaceClass(pool)
        if type(pool) ~= "table" then return end
        if mode == "all" then
            for raceKey, classes in pairs(pool) do
                for classKey, values in pairs(classes) do
                    Flat(values, "Rasse+Klasse:" .. raceKey .. "/" .. classKey)
                end
            end
        else
            local classes = pool[race]
            if type(classes) == "table" then Flat(classes[class], "Rasse+Klasse:" .. tostring(race) .. "/" .. tostring(class)) end
        end
    end
    local lang = addon.GetOutputLanguage and addon.GetOutputLanguage() or "deDE"
    for _, locale in ipairs({lang, "deDE"}) do
        local data = addon.localeData and addon.localeData[locale]
        if type(data) == "table" then
            if mode ~= "racial" then
                if kind == "prp" then
                    for _, tableName in ipairs({"Blessings", "Auras", "Seals", "Abilities"}) do Flat(data[tableName], tableName) end
                    if type(data.GreaterBlessings) == "table" then
                        for key, val in pairs(data.GreaterBlessings) do
                            if type(val) == "table" then Add("GREATER_" .. key, "GreaterBlessings") end
                        end
                    end
                elseif kind == "rc" then
                    Flat(data.generalTexts, "Allgemein")
                    Class(data.classTexts, "Klasse")
                    RaceClass(data.raceClassTexts)
                else
                    Flat(data.texts, "Allgemein")
                end
            end
            if kind == "prp" then Racial(data.Racial, "Rasse")
            elseif kind == "rc" then Racial(data.raceTexts, "Rasse")
            else Racial(data.racial, "Rasse") end
        end
    end
    if mode ~= "racial" and type(addon.db) == "table" then Flat(addon.db.personalTexts, "Persoenlich") end
    local keys = {}
    for key in pairs(found) do keys[#keys + 1] = key end
    table.sort(keys)
    addon.Notify("Textschluessel (" .. (mode == "" and "aktuell" or mode) .. "): " .. #keys)
    if #keys == 0 then addon.Notify("Keine passenden Textschluessel gefunden.") end
    for _, key in ipairs(keys) do
        if mode == "all" then
            local sources = {}
            for source in pairs(found[key]) do sources[#sources + 1] = source end
            table.sort(sources)
            addon.Notify(key .. " [" .. table.concat(sources, ", ") .. "]")
        else
            addon.Notify(key)
        end
    end
end

local function ShowHelp()
    addon.Notify("HexerRP Befehle:")
    addon.Notify("/wrp help | /wrp list [racial|all] | /wrp status")
    addon.Notify("/wrp <schluessel>")
    addon.Notify("/wrp language deDE|enUS|frFR")
    addon.Notify("/wrp channel AUTO|SAY|YELL|EMOTE|PARTY|RAID|INSTANCE_CHAT")
    addon.Notify("/wrp chance 0-100 | /wrp cooldown 0-3600")
    addon.Notify("/wrp ambient on|off")
    addon.Notify("/wrp ambient test murmur|disturbed|outburst|demonic")
    addon.Notify("/wrp ambient chance 0-100")
    addon.Notify("/wrp ambient interval MIN MAX")
    addon.Notify("/wrp ambient combat on|off")
    addon.Notify("Ambient-Timer merkt Texte vor; Ausgabe bei der naechsten /wrp Aktion.")
end

local function SetLanguage(argument)
    local aliases = {
        de = "deDE",
        dede = "deDE",
        en = "enUS",
        enus = "enUS",
        fr = "frFR",
        frfr = "frFR",
    }
    local language = aliases[(argument or ""):lower()] or argument
    if not addon.outputLanguages[language] then
        addon.Notify("Sprachen: deDE, enUS, frFR")
        return
    end

    local ok = addon.SetOutputLanguage(language)
    if ok then
        addon.Notify("Ausgabesprache: " .. language)
    else
        addon.Notify("Sprachdateien nicht geladen: " .. tostring(language))
    end
end

local function SetAmbientChance(argument)
    local value = tonumber(argument)
    if addon.ValidNumber(value, 100, 0) then
        addon.db.ambientChance = value
        addon.Notify("Ambient-Chance: " .. value .. "%")
    end
end

local function SetAmbientInterval(argument)
    local minimum, maximum = argument:match("^(%d+)%s+(%d+)$")
    minimum, maximum = tonumber(minimum), tonumber(maximum)
    if minimum and maximum and minimum >= 30 and maximum >= minimum and maximum <= 7200 then
        addon.db.ambientMinInterval = minimum
        addon.db.ambientMaxInterval = maximum
        addon.ResetAmbientTimer()
        addon.Notify("Ambient-Intervall: " .. minimum .. "-" .. maximum .. "s")
        return
    end
    addon.Notify("Benutzung: /wrp ambient interval 30 7200")
end

local function SetAmbientCombat(argument)
    local value = argument:lower()
    if value == "on" then
        addon.db.ambientInCombat = true
    elseif value == "off" then
        addon.db.ambientInCombat = false
    else
        addon.Notify("/wrp ambient combat on|off")
        return
    end
    addon.Notify("Ambient im Kampf: " .. (addon.db.ambientInCombat and "an" or "aus"))
end

local function ShowAmbientStatus()
    addon.Notify(string.format(
        "Ambient: %s | Chance %d%% | Intervall %d-%ds | Kampf %s | Vorgemerkt %s",
        addon.db.ambientEnabled and "an" or "aus",
        addon.db.ambientChance,
        addon.db.ambientMinInterval,
        addon.db.ambientMaxInterval,
        addon.db.ambientInCombat and "an" or "aus",
        (addon.HasPendingAmbient and addon.HasPendingAmbient()) and "ja" or "nein"
    ))
end

local function TestAmbient(argument)
    local category = argument ~= "" and argument:upper() or nil
    if category and category ~= "MURMUR" and category ~= "DISTURBED"
        and category ~= "OUTBURST" and category ~= "DEMONIC"
        and category ~= "DEMONIC_SAY" and category ~= "DEMONIC_YELL"
        and category ~= "DEMONIC_WHISPER" then
        addon.Notify("Test: murmur, disturbed, outburst, demonic, demonic_say, demonic_yell, demonic_whisper")
        return
    end
    addon.TryAmbient(category, true)
end

local function AmbientCommand(argument)
    local command, value = (argument or ""):match("^%s*(%S*)%s*(.-)%s*$")
    command = (command or ""):lower()
    value = value or ""

    if command == "on" then
        addon.db.ambientEnabled = true
        addon.ResetAmbientTimer()
        addon.Notify("Ambient-RP: an")
    elseif command == "off" then
        addon.db.ambientEnabled = false
        addon.Notify("Ambient-RP: aus")
    elseif command == "test" then
        TestAmbient(value)
    elseif command == "chance" then
        SetAmbientChance(value)
    elseif command == "interval" then
        SetAmbientInterval(value)
    elseif command == "combat" then
        SetAmbientCombat(value)
    else
        ShowAmbientStatus()
    end
end

local function ShowTextList()
    local keys = {}
    for key in pairs(addon.texts) do
        keys[#keys + 1] = key
    end
    table.sort(keys)
    for _, key in ipairs(keys) do
        addon.Notify(key .. " - " .. tostring(addon.texts[key].name or key))
    end
end

local function SetNumber(command, argument)
    local maximum = command == "chance" and 100 or 3600
    local value = tonumber(argument)
    if addon.ValidNumber(value, maximum, 0) then
        local key = command == "chance" and "textChance" or "cooldown"
        addon.db[key] = value
        addon.Notify(command .. ": " .. value)
    end
end

local function SetChannel(argument)
    local channel = argument:upper()
    if addon.channels[channel] then
        addon.db.chatChannel = channel
        addon.Notify("Chatkanal: " .. channel)
    else
        addon.Notify("Kanaele: AUTO, SAY, YELL, EMOTE, PARTY, RAID, INSTANCE_CHAT")
    end
end

local function HandleCommand(message)
    if not addon.ready then
        addon.Notify("Noch nicht geladen.")
        return
    end

    local command, argument = (message or ""):match("^%s*(%S+)%s*(.-)%s*$")
    command = command and command:lower() or "help"
    argument = argument or ""

    if command == "help" or command == "?" then
        ShowHelp()
    elseif command == "list" then
        ShowDynamicList(argument:lower(), "wrp")
    elseif command == "status" then
        addon.Notify(string.format(
            "Chance %d%% | Cooldown %ds | Kanal %s | Sprache %s",
            addon.db.textChance,
            addon.db.cooldown,
            addon.db.chatChannel,
            addon.GetOutputLanguage()
        ))
        AmbientCommand("")
    elseif command == "language" or command == "lang" then
        SetLanguage(argument)
    elseif command == "ambient" then
        AmbientCommand(argument)
    elseif command == "chance" or command == "cooldown" then
        SetNumber(command, argument)
    elseif command == "channel" then
        SetChannel(argument)
    elseif argument ~= "" then
        addon.Notify("Unbekannter Befehl: " .. tostring(command))
        ShowHelp()
    else
        addon.TryText(command)
    end
end

SLASH_HEXERRP1 = "/wrp"
SLASH_HEXERRP2 = "/hexerrp"
SlashCmdList.HEXERRP = HandleCommand
