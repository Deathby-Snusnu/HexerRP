-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Supplemental role-playing dialogue, emote, ambient, and translation text.
-- Licensed under Creative Commons Attribution-ShareAlike 4.0 International.

local _, addon = ...

-- Individually authored additions for the core warlock actions. Other actions
-- retain the legacy expansion until they receive their own editorial pass.
local specific = {
    SHADOW_BOLT = { gruppe = { "Schatten folgen keinen geraden Wegen. Mein Blitz schon.", "*verdichtet schwarzen Rauch zu einer zuckenden Kugel.*" }, ziel = { "%s, ich habe ein kleines Stück Nacht für Euch aufgehoben.", "*entlässt einen dunklen Blitz, der auf %s zuschnellt.*" } },
    IMMOLATE = { gruppe = { "Ein Funke genügt. Das Brennen erledigt den Rest.", "*reibt Daumen und Zeigefinger aneinander, bis grüne Glut entsteht.*" }, ziel = { "%s, ich hoffe, Ihr mögt es warm.", "*schleudert eine grüne Glut in Richtung von %s.*" } },
    CORRUPTION = { gruppe = { "Verderbnis klopft nicht an. Sie zieht einfach ein.", "*lässt eine dunkle Rune langsam in die Handfläche einsinken.*" }, ziel = { "%s, dieser Fluch hat einen langen Atem.", "*zeichnet eine kriechende Rune vor %s in die Luft.*" } },
    CURSE_WEAKNESS = { gruppe = { "Ein wenig weniger Kraft macht selbst Helden bescheidener.", "*dreht die Faust, als wringe sie die Kraft aus einem unsichtbaren Seil.*" }, ziel = { "%s, Ihr werdet Eure Muskeln gleich vermissen.", "*zieht eine matte Rune wie eine Schlinge um %s.*" } },
    FEAR = { gruppe = { "Die schrecklichsten Bilder trägt der Geist schon in sich.", "*öffnet eine Hand, als entließe sie einen unsichtbaren Albtraum.*" }, ziel = { "%s, Euer Verstand kennt den Ausgang. Lauft!", "*lässt einen kalten Schatten vor %s aufsteigen.*" } },
    LIFE_TAP = { gruppe = { "Eine kleine Schuld an mein eigenes Blut. Zinsen zahle ich später.", "*drückt zwei Finger an den Puls und sammelt einen dunklen Funken.*" } },
    DRAIN_LIFE = { gruppe = { "Lebenskraft fließt immer irgendwohin. Heute zu mir.", "*zieht einen dünnen roten Faden durch die offene Hand.*" }, ziel = { "%s, Euer Herzschlag arbeitet gerade für mich.", "*zieht einen roten Energiestrom von %s zur eigenen Hand.*" } },
    SUMMON_IMP = { gruppe = { "Ein kleiner Dämon. Ein erstaunlich großes Mundwerk.", "*ritzt einen winzigen Kreis in den Boden, aus dem Rauch aufsteigt.*" } },
}

local groupSpeech = "Der Nether hoert zu. Das genuegt mir."
local groupEmote = "*laesst dunkle Energie fuer einen Augenblick zwischen den Fingern kreisen.*"
local targetSpeech = "Der Nether hat Euch bemerkt, %s."
local targetEmote = "*zeichnet mit zwei Fingern ein dunkles Zeichen in Richtung von %s.*"

local function appendUnique(list, value)
    if type(list) ~= "table" then return end
    for _, old in ipairs(list) do
        if old == value then return end
    end
    list[#list + 1] = value
end

for key, node in pairs(addon.localeData.deDE.texts) do
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
            appendUnique(node.gruppe, "*formt " .. node.name .. " mit konzentrierter, dunkler Energie.*")
        end
        if type(node.ziel) == "table" then
            appendUnique(node.ziel, targetSpeech)
            appendUnique(node.ziel, targetEmote)
            appendUnique(node.ziel, "*richtet " .. node.name .. " mit einem knappen Zeichen auf %s.*")
        end
    end
end

-- Additional ambient reserve.
local ambient = addon.localeData.deDE.ambient
if type(ambient) == "table" then
    if type(ambient.MURMUR) == "table" then ambient.MURMUR[#ambient.MURMUR+1] = "Nicht jede Stimme braucht einen Mund."; ambient.MURMUR[#ambient.MURMUR+1] = "*haelt mitten in der Bewegung inne und lauscht einen Augenblick in die Leere.*" end
    if type(ambient.DISTURBED) == "table" then ambient.DISTURBED[#ambient.DISTURBED+1] = "Das war nicht fuer Eure Ohren bestimmt."; ambient.DISTURBED[#ambient.DISTURBED+1] = "*reibt sich die Schlaefe und murmelt etwas, das im letzten Wort in ein fremdes Zischen kippt.*" end
end
