-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
-- Original RP writing inspired by musical themes; no song lyrics are reproduced.
local _, addon = ...

-- Song titles and artists are reference metadata, never shown in public chat.
addon.musicRP = { deDE = {}, enUS = {}, frFR = {} }
addon.musicRPReferences = {}
addon.musicRPReferences.LIFE_TAP = { artist = "Pink Floyd", song = "Time", theme = "MORTALITY" }
addon.musicRP.deDE.LIFE_TAP = { gruppe = { "Die Zeit fordert ihren Preis. Ich bezahle in Blut.", "*lauscht dem eigenen Puls wie einer ablaufenden Uhr.*" } }
addon.musicRP.enUS.LIFE_TAP = { gruppe = { "Time always collects its due. I pay in blood.", "*listens to a heartbeat like a clock running down.*" } }
addon.musicRP.frFR.LIFE_TAP = { gruppe = { "Le temps réclame toujours son dû. Je paie en sang.", "*écoute son pouls comme une horloge qui s'épuise.*" } }
addon.musicRPReferences.SOULSTONE = { artist = "Alphaville", song = "Forever Young", theme = "MORTALITY" }
addon.musicRP.deDE.SOULSTONE = { gruppe = { "Die Ewigkeit passt nicht in einen Stein. Ein zweiter Versuch vielleicht.", "*schließt ein flüchtiges Lebenslicht in einen Kristall ein.*" }, ziel = { "%s, dieser Stein gibt Euch vielleicht noch einen weiteren Morgen.", "*legt %s einen Kristall mit sanft pulsierendem Licht in die Hand.*" } }
addon.musicRP.enUS.SOULSTONE = { gruppe = { "Eternity will not fit inside a stone. Perhaps on the second try.", "*seals a fleeting light of life inside a crystal.*" }, ziel = { "%s, this stone may grant you one more morning.", "*places a softly pulsing crystal into the hand of %s.*" } }
addon.musicRP.frFR.SOULSTONE = { gruppe = { "L'éternité ne tient pas dans une pierre. Essayons encore.", "*enferme une lueur de vie fugace dans un cristal.*" }, ziel = { "%s, cette pierre vous offrira peut-être un autre matin.", "*dépose dans la main de %s un cristal à la douce pulsation.*" } }
addon.musicRPReferences.SOUL_LINK = { artist = "Eurythmics", song = "Sweet Dreams (Are Made of This)", theme = "CONTROL" }
addon.musicRP.deDE.SOUL_LINK = { gruppe = { "Mein Dämon träumt von Freiheit. Ich träume von Kooperation.", "*betrachtet den Seelenfaden mit einem nachdenklichen Lächeln.*" } }
addon.musicRP.enUS.SOUL_LINK = { gruppe = { "My demon dreams of freedom. I dream of cooperation.", "*studies the soul-thread with a thoughtful smile.*" } }
addon.musicRP.frFR.SOUL_LINK = { gruppe = { "Mon démon rêve de liberté. Moi, de coopération.", "*examine le fil des âmes avec un sourire songeur.*" } }
addon.musicRPReferences.SUMMON_IMP = { artist = "Knorkator", song = "Ich bin der Boss", theme = "ABSURD", race = "Gnome" }
addon.musicRP.deDE.SUMMON_IMP = { gruppe = { "Organigramm aktualisiert: Ich bin oben. Der Wichtel unten.", "*prüft einen winzigen Arbeitsvertrag mit glimmendem Siegel.*" } }
addon.musicRP.enUS.SUMMON_IMP = { gruppe = { "Updated hierarchy: I am in charge. The imp is not.", "*inspects a tiny employment contract with a glowing seal.*" } }
addon.musicRP.frFR.SUMMON_IMP = { gruppe = { "Nouvel organigramme : je commande. Le diablotin obéit.", "*examine un minuscule contrat scellé d'une rune brûlante.*" } }
addon.musicRPReferences.SUMMON_INFERNAL = { artist = "Metallica", song = "Fuel", theme = "FIRE" }
addon.musicRP.deDE.SUMMON_INFERNAL = { gruppe = { "Mehr Glut! Mehr Macht! Etwas mehr Sicherheitsabstand!", "*öffnet einen glühenden Riss und geht vorsichtshalber zurück.*" } }
addon.musicRP.enUS.SUMMON_INFERNAL = { gruppe = { "More fire! More power! A little more distance!", "*opens a burning rift and wisely takes a step back.*" } }
addon.musicRP.frFR.SUMMON_INFERNAL = { gruppe = { "Plus de feu ! Plus de puissance ! Un peu de recul !", "*ouvre une faille brûlante puis recule prudemment.*" } }
addon.musicRPReferences.IMMOLATE = { artist = "Rammstein", song = "Sonne", theme = "FIRE" }
addon.musicRP.deDE.IMMOLATE = { gruppe = { "Ein kleines Licht. Mit ausgesprochen großem Appetit.", "*hebt eine grüne Flamme hoch wie eine winzige Sonne.*" }, ziel = { "%s, heute geht Euch ein sehr unfreundliches Licht auf.", "*schickt eine blendende Glut in Richtung von %s.*" } }
addon.musicRP.enUS.IMMOLATE = { gruppe = { "A little light with a remarkably large appetite.", "*raises a green flame like a tiny sun.*" }, ziel = { "%s, a rather unfriendly light is coming your way.", "*sends a blinding ember toward %s.*" } }
addon.musicRP.frFR.IMMOLATE = { gruppe = { "Une petite lumière à l'appétit démesuré.", "*soulève une flamme verte telle un minuscule soleil.*" }, ziel = { "%s, voici une lumière qui ne vous veut aucun bien.", "*projette une braise aveuglante vers %s.*" } }
addon.musicRPReferences.FEAR = { artist = "Black Sabbath", song = "Paranoid", theme = "DREAD" }
addon.musicRP.deDE.FEAR = { gruppe = { "Die schlimmste Angst braucht keinen sichtbaren Feind.", "*öffnet die Hand und lässt einen stillen Schatten entweichen.*" }, ziel = { "%s, Euer Verstand liefert die Schreckensbilder ganz allein.", "*lässt einen kalten Schatten über %s fallen.*" } }
addon.musicRP.enUS.FEAR = { gruppe = { "The worst fears need no visible enemy.", "*opens a hand and releases a silent shadow.*" }, ziel = { "%s, your mind provides the nightmares all by itself.", "*lets a cold shadow settle over %s.*" } }
addon.musicRP.frFR.FEAR = { gruppe = { "Les pires peurs n'ont pas besoin d'ennemi visible.", "*ouvre la main et libère une ombre silencieuse.*" }, ziel = { "%s, votre esprit invente seul ses cauchemars.", "*laisse une ombre glacée envelopper %s.*" } }
addon.musicRPReferences.DRAIN_SOUL = { artist = "Guns N' Roses", song = "Coma", theme = "LIMINAL" }
addon.musicRP.deDE.DRAIN_SOUL = { gruppe = { "Zwischen Atemzug und Stille liegt ein Augenblick für mich.", "*fängt ein schwaches Licht im Schatten der Hand auf.*" }, ziel = { "%s, ich höre das Zögern Eurer Seele.", "*zieht einen dünnen Lichtfaden aus %s in einen Kristall.*" } }
addon.musicRP.enUS.DRAIN_SOUL = { gruppe = { "Between breath and silence lies a moment for me.", "*catches a faint light in the shadow of a palm.*" }, ziel = { "%s, I can hear your soul hesitate.", "*draws a thin thread of light from %s into a crystal.*" } }
addon.musicRP.frFR.DRAIN_SOUL = { gruppe = { "Entre le souffle et le silence, un instant m'appartient.", "*recueille une faible lueur dans le creux de sa main.*" }, ziel = { "%s, j'entends votre âme hésiter.", "*attire un mince fil de lumière de %s vers un cristal.*" } }
addon.musicRPReferences.DARK_PACT = { artist = "Pantera", song = "Domination", theme = "CONTROL" }
addon.musicRP.deDE.DARK_PACT = { gruppe = { "Mein Dämon nennt es Ausbeutung. Ich nenne es Zusammenarbeit.", "*zieht einen dünnen Funken Macht aus einer dunklen Rune.*" } }
addon.musicRP.enUS.DARK_PACT = { gruppe = { "My demon calls it exploitation. I call it teamwork.", "*draws a thin spark of power out of a dark rune.*" } }
addon.musicRP.frFR.DARK_PACT = { gruppe = { "Mon démon parle d'exploitation. Moi, de coopération.", "*tire une étincelle de puissance d'une rune sombre.*" } }
addon.musicRPReferences.UNENDING_BREATH = { artist = "Pink Floyd", song = "Breathe", theme = "BREATH" }
addon.musicRP.deDE.UNENDING_BREATH = { gruppe = { "Ein Atemzug kann eine Ewigkeit dauern, wenn Magie mithilft.", "*fängt eine schimmernde Luftblase zwischen den Fingern ein.*" } }
addon.musicRP.enUS.UNENDING_BREATH = { gruppe = { "A single breath can last forever with a little magic.", "*catches a shimmering bubble of air between two fingers.*" } }
addon.musicRP.frFR.UNENDING_BREATH = { gruppe = { "Un souffle peut durer une éternité avec un peu de magie.", "*retient une bulle d'air scintillante entre deux doigts.*" } }
addon.musicRPReferences.DETECT_INVISIBILITY = { artist = "Pink Floyd", song = "Another Brick in the Wall", theme = "REVELATION" }
addon.musicRP.deDE.DETECT_INVISIBILITY = { gruppe = { "Auch hinter hohen Mauern bleiben Spuren sichtbar.", "*zeichnet eine Rune vor die Augen, die Verborgenes aufspürt.*" } }
addon.musicRP.enUS.DETECT_INVISIBILITY = { gruppe = { "Even high walls cannot hide every trace.", "*draws a rune before the eyes to reveal hidden traces.*" } }
addon.musicRP.frFR.DETECT_INVISIBILITY = { gruppe = { "Même les hauts murs ne cachent pas toutes les traces.", "*trace devant les yeux une rune révélant les traces cachées.*" } }
addon.musicRPReferences.SUMMON_VOIDWALKER = { artist = "Guns N' Roses", song = "November Rain", theme = "MELANCHOLY" }
addon.musicRP.deDE.SUMMON_VOIDWALKER = { gruppe = { "Selbst Schatten suchen manchmal Schutz vor dem Regen.", "*öffnet einen Kreis, aus dem ein stiller, kalter Nebel steigt.*" } }
addon.musicRP.enUS.SUMMON_VOIDWALKER = { gruppe = { "Even shadows sometimes seek shelter from the rain.", "*opens a circle that releases a quiet, cold mist.*" } }
addon.musicRP.frFR.SUMMON_VOIDWALKER = { gruppe = { "Même les ombres cherchent parfois un abri contre la pluie.", "*ouvre un cercle d'où monte une brume froide et silencieuse.*" } }

-- Called only after personal texts. Does not bypass normal chance, cooldown or chat checks.
function addon.ChooseMusicText(key, targetName, demonName, race)
    if not addon.db or not addon.db.musicEnabled then return nil end
    local chance = addon.db.musicChance or 0
    if chance <= 0 or math.random(100) > chance then return nil end
    local ref = addon.musicRPReferences[key]
    if not ref or (ref.race and ref.race ~= race) then return nil end
    local lang = addon.GetOutputLanguage()
    local localPool = addon.musicRP[lang] and addon.musicRP[lang][key]
    local text = addon.ChooseText(localPool, targetName, demonName)
    if text then return text end
    if lang ~= "deDE" then
        return addon.ChooseText(addon.musicRP.deDE[key], targetName, demonName)
    end
    return nil
end
