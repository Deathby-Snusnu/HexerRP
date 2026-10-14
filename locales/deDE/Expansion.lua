-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

local groupSpeech = 'Der Nether hoert zu. Das genuegt mir.'
local groupEmote = '*laesst dunkle Energie fuer einen Augenblick zwischen den Fingern kreisen.*'
local targetSpeech = 'Der Nether hat Euch bemerkt, %s.'
local targetEmote = '*zeichnet mit zwei Fingern ein dunkles Zeichen in Richtung von %s.*'

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
        if type(node.gruppe) == "table" then appendUnique(node.gruppe, "*formt " .. node.name .. " mit konzentrierter, dunkler Energie.*") end
        if type(node.ziel) == "table" then appendUnique(node.ziel, "*richtet " .. node.name .. " mit einem knappen Zeichen auf %s.*") end
    end
    for key, value in pairs(node) do
        if key ~= "ziel" and key ~= "gruppe" and type(value) == "table" then
            expand(value, seen)
        end
    end
end

for _, container in ipairs({addon.localeData.deDE.texts}) do
    expand(container, {})
end

-- Additional ambient reserve.
local ambient = addon.localeData.deDE.ambient
if type(ambient) == "table" then
    if type(ambient.MURMUR) == "table" then ambient.MURMUR[#ambient.MURMUR+1] = "Nicht jede Stimme braucht einen Mund."; ambient.MURMUR[#ambient.MURMUR+1] = "*haelt mitten in der Bewegung inne und lauscht einen Augenblick in die Leere.*" end
    if type(ambient.DISTURBED) == "table" then ambient.DISTURBED[#ambient.DISTURBED+1] = "Das war nicht fuer Eure Ohren bestimmt."; ambient.DISTURBED[#ambient.DISTURBED+1] = "*reibt sich die Schlaefe und murmelt etwas, das im letzten Wort in ein fremdes Zischen kippt.*" end
end
