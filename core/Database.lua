-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

function addon.Notify(message)
    print("|cff8b5cf6Hexer RP:|r " .. message)
end

function addon.ValidNumber(value, maximum, minimum)
    minimum = minimum or 0
    return type(value) == "number" and value == value and value >= minimum and value <= maximum and value % 1 == 0
end

function addon.InitializeDatabase()
    if HexerRP_CharacterDB ~= nil and type(HexerRP_CharacterDB) ~= "table" then
        addon.Notify("Ungueltige gespeicherte Einstellungen; Standardwerte werden geladen.")
        HexerRP_CharacterDB = nil
    end
    HexerRP_CharacterDB = HexerRP_CharacterDB or {}
    local db = HexerRP_CharacterDB
    local numeric = {
        textChance = {0,100}, cooldown = {0,3600}, ambientChance = {0,100},
        ambientMinInterval = {30,3600}, ambientMaxInterval = {30,7200},
    }
    for key, limits in pairs(numeric) do
        if db[key] ~= nil and not addon.ValidNumber(db[key], limits[2], limits[1]) then db[key] = nil end
        if db[key] == nil then db[key] = addon.defaults[key] end
    end
    if db.ambientMaxInterval < db.ambientMinInterval then
        db.ambientMaxInterval = db.ambientMinInterval
    end
    if db.chatChannel ~= nil and not addon.channels[db.chatChannel] then db.chatChannel = nil end
    db.chatChannel = db.chatChannel or addon.defaults.chatChannel
    if db.outputLanguage ~= nil and not addon.outputLanguages[db.outputLanguage] then db.outputLanguage = nil end
    db.outputLanguage = db.outputLanguage or addon.defaults.outputLanguage
    if type(db.ambientEnabled) ~= "boolean" then db.ambientEnabled = addon.defaults.ambientEnabled end
    if type(db.ambientInCombat) ~= "boolean" then db.ambientInCombat = addon.defaults.ambientInCombat end
    db.personalTexts = type(db.personalTexts) == "table" and db.personalTexts or {}
    addon.runtimeOutputLanguage = db.outputLanguage
    addon.db = db
end
