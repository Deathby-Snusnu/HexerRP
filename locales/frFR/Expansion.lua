-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

local groupSpeech = 'Le Neant distordu ecoute. Cela me suffit.'
local groupEmote = '*laisse une energie sombre s enrouler un instant entre deux doigts.*'
local targetSpeech = 'Le Neant distordu vous a remarque, %s.'
local targetEmote = '*trace de deux doigts un signe sombre en direction de %s.*'

local function appendUnique(list, text)
    if type(list) ~= "table" then return end
    for _, value in ipairs(list) do
        if value == text then return end
    end
    list[#list + 1] = text
end

local function expand(node, seen)
    if type(node) ~= "table" or seen[node] then return end
    seen[node] = true
    if type(node.ziel) == "table" then
        appendUnique(node.ziel, targetSpeech)
        appendUnique(node.ziel, targetEmote)
    end
    if type(node.gruppe) == "table" then
        appendUnique(node.gruppe, groupSpeech)
        appendUnique(node.gruppe, groupEmote)
    end
    if type(node.name) == "string" and node.name ~= "" then
        if type(node.gruppe) == "table" then appendUnique(node.gruppe, "*faconne " .. node.name .. " avec une energie sombre et concentree.*") end
        if type(node.ziel) == "table" then appendUnique(node.ziel, "*dirige " .. node.name .. " vers %s d un geste bref.*") end
    end
    for key, value in pairs(node) do
        if key ~= "ziel" and key ~= "gruppe" and type(value) == "table" then
            expand(value, seen)
        end
    end
end

for _, container in ipairs({addon.localeData.frFR.texts}) do
    expand(container, {})
end

-- Additional ambient reserve.
local ambient = addon.localeData.frFR.ambient
if type(ambient) == "table" then
    if type(ambient.MURMUR) == "table" then ambient.MURMUR[#ambient.MURMUR+1] = "Toutes les voix n ont pas besoin d une bouche."; ambient.MURMUR[#ambient.MURMUR+1] = "*s immobilise en plein mouvement et ecoute un instant le vide.*" end
    if type(ambient.DISTURBED) == "table" then ambient.DISTURBED[#ambient.DISTURBED+1] = "Cela n etait pas destine a vos oreilles."; ambient.DISTURBED[#ambient.DISTURBED+1] = "*se frotte la tempe et marmonne quelques mots dont le dernier devient un sifflement etranger.*" end
end
