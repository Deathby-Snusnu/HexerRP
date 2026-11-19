-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

-- Individually authored additions for the core warlock actions. Other actions
-- retain the legacy expansion until they receive their own editorial pass.
local specific = {
    SHADOW_BOLT = { gruppe = { "Les ombres ignorent les chemins droits. Pas mon trait.", "*comprime une fumée noire en une sphère frémissante.*" }, ziel = { "%s, j'ai gardé un morceau de nuit pour vous.", "*libère un trait obscur qui file vers %s.*" } },
    IMMOLATE = { gruppe = { "Une étincelle suffit. Les flammes feront le reste.", "*frotte le pouce et l'index jusqu'à faire naître une braise verte.*" }, ziel = { "%s, j'espère que vous aimez la chaleur.", "*projette une braise verte vers %s.*" } },
    CORRUPTION = { gruppe = { "La corruption ne frappe pas. Elle s'installe.", "*laisse une rune sombre s'enfoncer lentement dans sa paume.*" }, ziel = { "%s, cette malédiction sait se faire attendre.", "*trace une rune rampante devant %s.*" } },
    CURSE_WEAKNESS = { gruppe = { "Un peu moins de force rend même les héros modestes.", "*tord le poing comme pour essorer une corde invisible.*" }, ziel = { "%s, vos muscles vont bientôt vous manquer.", "*dessine une rune terne en boucle autour de %s.*" } },
    FEAR = { gruppe = { "Les pires horreurs se cachent déjà dans l'esprit.", "*ouvre la main comme pour libérer un cauchemar invisible.*" }, ziel = { "%s, votre esprit connaît la sortie. Fuyez !", "*fait surgir une ombre glacée devant %s.*" } },
    LIFE_TAP = { gruppe = { "Une petite dette envers mon propre sang. Les intérêts attendront.", "*pose deux doigts sur son pouls et recueille une étincelle sombre.*" } },
    DRAIN_LIFE = { gruppe = { "La vie coule toujours quelque part. Aujourd'hui, vers moi.", "*tire un mince fil rouge à travers sa paume ouverte.*" }, ziel = { "%s, votre cœur travaille désormais pour moi.", "*attire un flux rouge de %s dans sa main.*" } },
    SUMMON_IMP = { gruppe = { "Un petit démon. Une bouche étonnamment grande.", "*grave un minuscule cercle au sol, d'où monte une fumée sombre.*" } },
}

local groupSpeech = "Le Neant distordu ecoute. Cela me suffit."
local groupEmote = "*laisse une energie sombre s enrouler un instant entre deux doigts.*"
local targetSpeech = "Le Neant distordu vous a remarque, %s."
local targetEmote = "*trace de deux doigts un signe sombre en direction de %s.*"

local function appendUnique(list, value)
    if type(list) ~= "table" then return end
    for _, old in ipairs(list) do
        if old == value then return end
    end
    list[#list + 1] = value
end

for key, node in pairs(addon.localeData.frFR.texts) do
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
            appendUnique(node.gruppe, "*shapes " .. node.name .. " avec une energie sombre et concentree.*")
        end
        if type(node.ziel) == "table" then
            appendUnique(node.ziel, targetSpeech)
            appendUnique(node.ziel, targetEmote)
            appendUnique(node.ziel, "*directs " .. node.name .. " vers %s d un geste bref.*")
        end
    end
end

-- Additional ambient reserve.
local ambient = addon.localeData.frFR.ambient
if type(ambient) == "table" then
    if type(ambient.MURMUR) == "table" then ambient.MURMUR[#ambient.MURMUR+1] = "Toutes les voix n ont pas besoin d une bouche."; ambient.MURMUR[#ambient.MURMUR+1] = "*s immobilise en plein mouvement et ecoute un instant le vide.*" end
    if type(ambient.DISTURBED) == "table" then ambient.DISTURBED[#ambient.DISTURBED+1] = "Cela n etait pas destine a vos oreilles."; ambient.DISTURBED[#ambient.DISTURBED+1] = "*se frotte la tempe et marmonne quelques mots dont le dernier devient un sifflement etranger.*" end
end
