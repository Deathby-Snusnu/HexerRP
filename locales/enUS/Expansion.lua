-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

-- Individually authored additions for the core warlock actions. Other actions
-- retain the legacy expansion until they receive their own editorial pass.
local specific = {
    SHADOW_BOLT = { gruppe = { "Shadows need no straight paths. My bolt does.", "*compresses black smoke into a twitching sphere.*" }, ziel = { "%s, I saved a small piece of night just for you.", "*releases a dark bolt that races toward %s.*" } },
    IMMOLATE = { gruppe = { "One spark will do. The burning handles the rest.", "*rubs thumb and forefinger until green embers appear.*" }, ziel = { "%s, I hope you enjoy the heat.", "*flicks a green ember toward %s.*" } },
    CORRUPTION = { gruppe = { "Corruption does not knock. It simply moves in.", "*lets a dark rune sink slowly into the palm.*" }, ziel = { "%s, this curse has remarkable staying power.", "*draws a creeping rune in the air before %s.*" } },
    CURSE_WEAKNESS = { gruppe = { "A little less strength makes even heroes modest.", "*twists a fist as if wringing power from an unseen rope.*" }, ziel = { "%s, you may miss those muscles in a moment.", "*draws a dull rune like a noose around %s.*" } },
    FEAR = { gruppe = { "The worst horrors are already hiding in the mind.", "*opens one hand as though releasing an unseen nightmare.*" }, ziel = { "%s, your mind knows the exit. Run!", "*raises a chill shadow before %s.*" } },
    LIFE_TAP = { gruppe = { "A small debt against my own blood. Interest can wait.", "*presses two fingers to the pulse and gathers a dark spark.*" } },
    DRAIN_LIFE = { gruppe = { "Life always flows somewhere. Today it flows to me.", "*draws a thin red thread through the open hand.*" }, ziel = { "%s, your heartbeat is working for me now.", "*draws a red stream of energy from %s into one hand.*" } },
    SUMMON_IMP = { gruppe = { "A small demon. An astonishingly large mouth.", "*scratches a tiny circle on the ground as smoke rises from it.*" } },
    CURSE_RECKLESSNESS = { gruppe = { "Bravery comes cheap. Consequences seldom do.", "*lets a black rune wobble like a broken scale.*" }, ziel = { "%s, good judgment appears to be unavailable today.", "*twists a curse sigil until it coils around %s.*" } },
    OMEN_AGONY = { gruppe = { "I promise no swift torment. Patience is my specialty.", "*draws a spiral with one nail, watching it slowly darken.*" }, ziel = { "%s, the worst is yet to come. How unfortunate.", "*sends a thin spiral of shadow creeping toward %s.*" } },
    CURSE_AGONY = { gruppe = { "Pain can be a choir. I shall conduct it.", "*beats time with two fingers to a rhythm no one wishes to hear.*" } },
    DRAIN_SOUL = { gruppe = { "A soul is hardly loose change. I collect anyway.", "*holds an empty shard into the dim shadowlight.*" }, ziel = { "%s, a little piece of you shall remain with me.", "*draws a thin soul-thread from %s into a shard.*" } },
    LIFE_FUNNEL = { gruppe = { "My demon bears the wounds. I pay the bill.", "*presses a hand to the chest and guides a red current outward.*" } },
    DEMON_ARMOR = { gruppe = { "They say I have a thick skin. Now it is enchanted.", "*wraps scaled shadows over the shoulders like a second skin.*" } },
    FEL_ARMOR = { gruppe = { "This armour does not shine. It grins back.", "*draws green-burning sigils across the robe.*" } },
    SOUL_LINK = { gruppe = { "What strikes my demon is no longer its burden alone.", "*pulls a dark thread taut between heart and companion.*" } },
}

local groupSpeech = "The Nether is listening. That is enough for me."
local groupEmote = "*lets dark energy coil between two fingers for a moment.*"
local targetSpeech = "The Nether has noticed you, %s."
local targetEmote = "*traces a dark sign toward %s with two fingers.*"

local function appendUnique(list, value)
    if type(list) ~= "table" then return end
    for _, old in ipairs(list) do
        if old == value then return end
    end
    list[#list + 1] = value
end

for key, node in pairs(addon.localeData.enUS.texts) do
    local authored = specific[key]
    if authored then
        for _, kind in ipairs({"gruppe", "ziel"}) do
            if type(node[kind]) == "table" and type(authored[kind]) == "table" then
                for _, value in ipairs(authored[kind]) do appendUnique(node[kind], value) end
            end
        end
    else
        -- Legacy, still deduplicated additions for actions not yet rewritten.
        if type(node.gruppe) == "table" then
            appendUnique(node.gruppe, groupSpeech)
            appendUnique(node.gruppe, groupEmote)
            appendUnique(node.gruppe, "*shapes " .. node.name .. " with focused dark energy.*")
        end
        if type(node.ziel) == "table" then
            appendUnique(node.ziel, targetSpeech)
            appendUnique(node.ziel, targetEmote)
            appendUnique(node.ziel, "*directs " .. node.name .. " at %s with a curt gesture.*")
        end
    end
end

-- Additional ambient reserve.
local ambient = addon.localeData.enUS.ambient
if type(ambient) == "table" then
    if type(ambient.MURMUR) == "table" then ambient.MURMUR[#ambient.MURMUR+1] = "Not every voice needs a mouth."; ambient.MURMUR[#ambient.MURMUR+1] = "*stops mid-motion and listens to empty air for a moment.*" end
    if type(ambient.DISTURBED) == "table" then ambient.DISTURBED[#ambient.DISTURBED+1] = "That was not meant for your ears."; ambient.DISTURBED[#ambient.DISTURBED+1] = "*rubs one temple and mutters something whose final word slips into an alien hiss.*" end
end
