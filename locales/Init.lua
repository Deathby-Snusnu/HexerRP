-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

addon.localeData = addon.localeData or {}
for _, lang in ipairs({"deDE", "enUS", "frFR"}) do
    addon.localeData[lang] = addon.localeData[lang] or {}
end

addon.outputLanguages = { deDE = true, enUS = true, frFR = true }
addon.outputLanguageNames = { deDE = "Deutsch", enUS = "English", frFR = "Francais" }

function addon.IsLocaleLoaded(lang)
    local root = addon.localeData and addon.localeData[lang]
    return type(root) == "table" and next(root) ~= nil
end

function addon.GetOutputLanguage()
    local lang = addon.runtimeOutputLanguage or (addon.db and addon.db.outputLanguage) or "deDE"
    if addon.outputLanguages[lang] and addon.IsLocaleLoaded(lang) then return lang end
    return "deDE"
end

function addon.SetOutputLanguage(lang)
    if not addon.outputLanguages[lang] then return false, "unknown" end
    if not addon.IsLocaleLoaded(lang) then return false, "not_loaded" end
    addon.runtimeOutputLanguage = lang
    if addon.db then addon.db.outputLanguage = lang end
    return true
end

function addon.GetLocalePoolExact(lang, kind, ...)
    local node = addon.localeData and addon.localeData[lang] and addon.localeData[lang][kind]
    if type(node) ~= "table" then return nil end
    for i = 1, select("#", ...) do
        node = node[select(i, ...)]
        if type(node) ~= "table" then return nil end
    end
    return node
end
