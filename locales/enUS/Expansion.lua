-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

local groupSpeech = 'The Nether is listening. That is enough for me.'
local groupEmote = '*lets dark energy coil between two fingers for a moment.*'
local targetSpeech = 'The Nether has noticed you, %s.'
local targetEmote = '*traces a dark sign toward %s with two fingers.*'

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
        if type(node.gruppe) == "table" then appendUnique(node.gruppe, "*shapes " .. node.name .. " with focused dark energy.*") end
        if type(node.ziel) == "table" then appendUnique(node.ziel, "*directs " .. node.name .. " at %s with a curt gesture.*") end
    end
    for key, value in pairs(node) do
        if key ~= "ziel" and key ~= "gruppe" and type(value) == "table" then
            expand(value, seen)
        end
    end
end

for _, container in ipairs({addon.localeData.enUS.texts}) do
    expand(container, {})
end

-- Additional ambient reserve.
local ambient = addon.localeData.enUS.ambient
if type(ambient) == "table" then
    if type(ambient.MURMUR) == "table" then ambient.MURMUR[#ambient.MURMUR+1] = "Not every voice needs a mouth."; ambient.MURMUR[#ambient.MURMUR+1] = "*stops mid-motion and listens to empty air for a moment.*" end
    if type(ambient.DISTURBED) == "table" then ambient.DISTURBED[#ambient.DISTURBED+1] = "That was not meant for your ears."; ambient.DISTURBED[#ambient.DISTURBED+1] = "*rubs one temple and mutters something whose final word slips into an alien hiss.*" end
end
