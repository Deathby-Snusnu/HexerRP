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
    CURSE_RECKLESSNESS = { gruppe = { "Wagemut ist billig. Die Folgen sind es selten.", "*lässt eine schwarze Rune wie eine zerbrochene Waage taumeln.*" }, ziel = { "%s, Vernunft steht Euch heute offenbar nicht mehr zur Verfügung.", "*verdreht ein Fluchzeichen, bis es sich um %s schließt.*" } },
    OMEN_AGONY = { gruppe = { "Ich verspreche keine schnelle Pein. Geduld ist meine Spezialität.", "*zeichnet mit dem Nagel eine Spirale, die langsam dunkler wird.*" }, ziel = { "%s, das Schlimmste liegt noch vor Euch. Wie bedauerlich.", "*lässt eine schmale Spirale aus Schatten auf %s zuschleichen.*" } },
    CURSE_AGONY = { gruppe = { "Schmerz kann ein Chor sein. Ich übernehme die Leitung.", "*schlägt mit zwei Fingern einen Takt, den niemand hören möchte.*" } },
    DRAIN_SOUL = { gruppe = { "Eine Seele ist kein Kleingeld. Ich sammle trotzdem.", "*hält einen leeren Splitter ins matte Schattenlicht.*" }, ziel = { "%s, ein winziger Teil von Euch wird mir in Erinnerung bleiben.", "*zieht einen dünnen Seelenfaden aus %s in einen Splitter.*" } },
    LIFE_FUNNEL = { gruppe = { "Mein Dämon trägt die Wunden. Ich zahle die Rechnung.", "*presst die Hand an die Brust und führt einen roten Lichtstrom nach außen.*" } },
    DEMON_ARMOR = { gruppe = { "Man sagt, ich hätte eine harte Schale. Nun ist sie verzaubert.", "*legt schuppige Schatten wie eine zweite Haut über die Schultern.*" } },
    FEL_ARMOR = { gruppe = { "Diese Rüstung glänzt nicht. Sie grinst zurück.", "*zieht grün glühende Zeichen über die eigene Robe.*" } },
    SOUL_LINK = { gruppe = { "Was meinen Dämon trifft, bleibt nicht länger nur seine Sorge.", "*zieht einen dunklen Faden zwischen Herz und Begleiter straff.*" } },
    SOUL_FIRE = { gruppe = { "Eine Seele brennt nicht leicht. Ich bin geduldig.", "*presst eine pulsierende Flamme zwischen beide Hände.*" }, ziel = { "%s, diese Flamme stammt aus den tiefsten Schatten.", "*schleudert eine grelle Seelenflamme auf %s.*" } },
    HEALTHSTONE = { gruppe = { "Ein bisschen Leben, sorgsam in Stein verpackt.", "*wärmt einen grün schimmernden Stein in den Händen.*" }, ziel = { "%s, nehmt diesen Stein. Die Rechnung folgt.", "*reicht %s einen warm glimmenden Gesundheitsstein.*" } },
    SOULSTONE = { gruppe = { "Für den Fall, dass der Tod nicht verhandeln will.", "*schließt ein schwaches Seelenlicht in einen Kristall.*" }, ziel = { "%s, bewahrt ihn gut auf. Er kennt den Rückweg.", "*legt %s einen pulsierenden Seelenstein in die Hand.*" } },
    DARK_PACT = { gruppe = { "Mein Dämon ist großzügig. Ich habe es beschlossen.", "*zieht einen schmalen Strom dämonischer Macht heran.*" } },
    SUMMON_VOIDWALKER = { gruppe = { "Ein Schatten, der sogar Türen einschüchtert.", "*zeichnet einen schweren Kreis, aus dem kalter Rauch quillt.*" } },
    SUMMON_SUCCUBUS = { gruppe = { "Charme, Klauen und schlechte Ratschläge. Wunderbar.", "*zeichnet ein elegantes Siegel aus violettem Feuer.*" } },
    SUMMON_FELHUNTER = { gruppe = { "Endlich einer, der Magie noch unhöflicher behandelt.", "*lockt mit einer pfeifenden Rune eine schnüffelnde Gestalt hervor.*" } },
    SUMMON_INFERNAL = { gruppe = { "Wenn der Himmel fällt, habe ich ihn selbst gerufen.", "*reißt die Arme hoch, während glühende Runen aufsteigen.*" } },
    RITUAL_SUMMONING = { gruppe = { "Drei Hände, ein Kreis. Hoffentlich alle Gliedmaßen am Ziel.", "*prüft jeden Strich des Beschwörungskreises zweimal.*" } },
    UNENDING_BREATH = { gruppe = { "Atmen ist Gewohnheit. Ich habe bessere Zauber.", "*haucht eine Blase in ein blass schimmerndes Siegel.*" } },
    DETECT_INVISIBILITY = { gruppe = { "Unsichtbar heißt nicht unbeobachtet.", "*streicht zwei Finger vor die violett leuchtenden Augen.*" } },
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
