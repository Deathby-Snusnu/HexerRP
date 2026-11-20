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


-- Independent second-wave music motifs: metadata remains internal.
addon.musicRPBonus = { deDE = {}, enUS = {}, frFR = {} }
addon.musicRPBonusReferences = {}
addon.musicRPBonusReferences.M01 = { key = "DRAIN_SOUL", artist = "Guns N' Roses", song = "Coma" }
addon.musicRPBonus.deDE.DRAIN_SOUL = addon.musicRPBonus.deDE.DRAIN_SOUL or {}
addon.musicRPBonus.deDE.DRAIN_SOUL[#addon.musicRPBonus.deDE.DRAIN_SOUL+1] = { "Zwischen Atemzug und Stille verbergen sich ganze Leben.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.DRAIN_SOUL = addon.musicRPBonus.enUS.DRAIN_SOUL or {}
addon.musicRPBonus.enUS.DRAIN_SOUL[#addon.musicRPBonus.enUS.DRAIN_SOUL+1] = { "Between breath and silence, whole lives lie hidden.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.DRAIN_SOUL = addon.musicRPBonus.frFR.DRAIN_SOUL or {}
addon.musicRPBonus.frFR.DRAIN_SOUL[#addon.musicRPBonus.frFR.DRAIN_SOUL+1] = { "Entre souffle et silence, des vies entières se cachent.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M02 = { key = "SUMMON_VOIDWALKER", artist = "Guns N' Roses", song = "November Rain" }
addon.musicRPBonus.deDE.SUMMON_VOIDWALKER = addon.musicRPBonus.deDE.SUMMON_VOIDWALKER or {}
addon.musicRPBonus.deDE.SUMMON_VOIDWALKER[#addon.musicRPBonus.deDE.SUMMON_VOIDWALKER+1] = { "Auch Schatten brauchen manchmal Schutz vor dem Regen.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.SUMMON_VOIDWALKER = addon.musicRPBonus.enUS.SUMMON_VOIDWALKER or {}
addon.musicRPBonus.enUS.SUMMON_VOIDWALKER[#addon.musicRPBonus.enUS.SUMMON_VOIDWALKER+1] = { "Even shadows sometimes need shelter from the rain.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.SUMMON_VOIDWALKER = addon.musicRPBonus.frFR.SUMMON_VOIDWALKER or {}
addon.musicRPBonus.frFR.SUMMON_VOIDWALKER[#addon.musicRPBonus.frFR.SUMMON_VOIDWALKER+1] = { "Même les ombres ont parfois besoin d'un abri contre la pluie.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M03 = { key = "LIFE_TAP", artist = "Pink Floyd", song = "Time" }
addon.musicRPBonus.deDE.LIFE_TAP = addon.musicRPBonus.deDE.LIFE_TAP or {}
addon.musicRPBonus.deDE.LIFE_TAP[#addon.musicRPBonus.deDE.LIFE_TAP+1] = { "Die Zeit fordert einen Preis. Heute zahle ich in Blut.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.LIFE_TAP = addon.musicRPBonus.enUS.LIFE_TAP or {}
addon.musicRPBonus.enUS.LIFE_TAP[#addon.musicRPBonus.enUS.LIFE_TAP+1] = { "Time demands a price. Today I pay in blood.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.LIFE_TAP = addon.musicRPBonus.frFR.LIFE_TAP or {}
addon.musicRPBonus.frFR.LIFE_TAP[#addon.musicRPBonus.frFR.LIFE_TAP+1] = { "Le temps a un prix. Aujourd'hui je paie en sang.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M04 = { key = "SOULSTONE", artist = "Alphaville", song = "Forever Young" }
addon.musicRPBonus.deDE.SOULSTONE = addon.musicRPBonus.deDE.SOULSTONE or {}
addon.musicRPBonus.deDE.SOULSTONE[#addon.musicRPBonus.deDE.SOULSTONE+1] = { "Für immer jung? Ich wäre mit einem weiteren Morgen zufrieden.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.SOULSTONE = addon.musicRPBonus.enUS.SOULSTONE or {}
addon.musicRPBonus.enUS.SOULSTONE[#addon.musicRPBonus.enUS.SOULSTONE+1] = { "Forever young? One more morning would be enough.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.SOULSTONE = addon.musicRPBonus.frFR.SOULSTONE or {}
addon.musicRPBonus.frFR.SOULSTONE[#addon.musicRPBonus.frFR.SOULSTONE+1] = { "Jeune à jamais ? Un matin de plus me suffirait.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M05 = { key = "SOUL_LINK", artist = "Eurythmics", song = "Sweet Dreams (Are Made of This)" }
addon.musicRPBonus.deDE.SOUL_LINK = addon.musicRPBonus.deDE.SOUL_LINK or {}
addon.musicRPBonus.deDE.SOUL_LINK[#addon.musicRPBonus.deDE.SOUL_LINK+1] = { "Jeder sucht nach etwas. Mein Dämon nach dem Ausgang.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.SOUL_LINK = addon.musicRPBonus.enUS.SOUL_LINK or {}
addon.musicRPBonus.enUS.SOUL_LINK[#addon.musicRPBonus.enUS.SOUL_LINK+1] = { "Everyone seeks something. My demon seeks the exit.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.SOUL_LINK = addon.musicRPBonus.frFR.SOUL_LINK or {}
addon.musicRPBonus.frFR.SOUL_LINK[#addon.musicRPBonus.frFR.SOUL_LINK+1] = { "Chacun cherche quelque chose. Mon démon cherche la sortie.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M06 = { key = "IMMOLATE", artist = "Metallica", song = "Fuel" }
addon.musicRPBonus.deDE.IMMOLATE = addon.musicRPBonus.deDE.IMMOLATE or {}
addon.musicRPBonus.deDE.IMMOLATE[#addon.musicRPBonus.deDE.IMMOLATE+1] = { "Mehr Feuer! Mehr Macht! Und deutlich mehr Sicherheitsabstand!", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.IMMOLATE = addon.musicRPBonus.enUS.IMMOLATE or {}
addon.musicRPBonus.enUS.IMMOLATE[#addon.musicRPBonus.enUS.IMMOLATE+1] = { "More fire! More power! And considerably more distance!", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.IMMOLATE = addon.musicRPBonus.frFR.IMMOLATE or {}
addon.musicRPBonus.frFR.IMMOLATE[#addon.musicRPBonus.frFR.IMMOLATE+1] = { "Plus de feu ! Plus de puissance ! Et surtout plus de recul !", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M07 = { key = "FEAR", artist = "Black Sabbath", song = "Paranoid" }
addon.musicRPBonus.deDE.FEAR = addon.musicRPBonus.deDE.FEAR or {}
addon.musicRPBonus.deDE.FEAR[#addon.musicRPBonus.deDE.FEAR+1] = { "Der schlimmste Schrecken entsteht manchmal im eigenen Kopf.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.FEAR = addon.musicRPBonus.enUS.FEAR or {}
addon.musicRPBonus.enUS.FEAR[#addon.musicRPBonus.enUS.FEAR+1] = { "Sometimes the worst terror begins inside your own head.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.FEAR = addon.musicRPBonus.frFR.FEAR or {}
addon.musicRPBonus.frFR.FEAR[#addon.musicRPBonus.frFR.FEAR+1] = { "Parfois, la pire terreur naît dans notre propre tête.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M08 = { key = "SUMMON_INFERNAL", artist = "Black Sabbath", song = "Iron Man" }
addon.musicRPBonus.deDE.SUMMON_INFERNAL = addon.musicRPBonus.deDE.SUMMON_INFERNAL or {}
addon.musicRPBonus.deDE.SUMMON_INFERNAL[#addon.musicRPBonus.deDE.SUMMON_INFERNAL+1] = { "Der Himmel fällt nicht von allein. Ich helfe nur etwas nach.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.SUMMON_INFERNAL = addon.musicRPBonus.enUS.SUMMON_INFERNAL or {}
addon.musicRPBonus.enUS.SUMMON_INFERNAL[#addon.musicRPBonus.enUS.SUMMON_INFERNAL+1] = { "The sky will not fall by itself. I give it a little help.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.SUMMON_INFERNAL = addon.musicRPBonus.frFR.SUMMON_INFERNAL or {}
addon.musicRPBonus.frFR.SUMMON_INFERNAL[#addon.musicRPBonus.frFR.SUMMON_INFERNAL+1] = { "Le ciel ne tombe pas tout seul. Je lui donne un coup de main.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M09 = { key = "SOUL_FIRE", artist = "Slayer", song = "Raining Blood" }
addon.musicRPBonus.deDE.SOUL_FIRE = addon.musicRPBonus.deDE.SOUL_FIRE or {}
addon.musicRPBonus.deDE.SOUL_FIRE[#addon.musicRPBonus.deDE.SOUL_FIRE+1] = { "Der Himmel färbt sich rot. Das ist selten eine gute Nachricht.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.SOUL_FIRE = addon.musicRPBonus.enUS.SOUL_FIRE or {}
addon.musicRPBonus.enUS.SOUL_FIRE[#addon.musicRPBonus.enUS.SOUL_FIRE+1] = { "The sky turns red. That is seldom good news.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.SOUL_FIRE = addon.musicRPBonus.frFR.SOUL_FIRE or {}
addon.musicRPBonus.frFR.SOUL_FIRE[#addon.musicRPBonus.frFR.SOUL_FIRE+1] = { "Le ciel devient rouge. C'est rarement bon signe.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M10 = { key = "DARK_PACT", artist = "Pantera", song = "Domination" }
addon.musicRPBonus.deDE.DARK_PACT = addon.musicRPBonus.deDE.DARK_PACT or {}
addon.musicRPBonus.deDE.DARK_PACT[#addon.musicRPBonus.deDE.DARK_PACT+1] = { "Mein Dämon nennt es Unterdrückung. Ich nenne es Arbeitsteilung.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.DARK_PACT = addon.musicRPBonus.enUS.DARK_PACT or {}
addon.musicRPBonus.enUS.DARK_PACT[#addon.musicRPBonus.enUS.DARK_PACT+1] = { "My demon calls it oppression. I call it division of labor.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.DARK_PACT = addon.musicRPBonus.frFR.DARK_PACT or {}
addon.musicRPBonus.frFR.DARK_PACT[#addon.musicRPBonus.frFR.DARK_PACT+1] = { "Mon démon parle d'oppression. Moi, de partage des tâches.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M11 = { key = "SUMMON_IMP", artist = "Die Ärzte", song = "Junge" }
addon.musicRPBonus.deDE.SUMMON_IMP = addon.musicRPBonus.deDE.SUMMON_IMP or {}
addon.musicRPBonus.deDE.SUMMON_IMP[#addon.musicRPBonus.deDE.SUMMON_IMP+1] = { "Was soll aus dir werden? fragte ich den Wichtel. Er lachte.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.SUMMON_IMP = addon.musicRPBonus.enUS.SUMMON_IMP or {}
addon.musicRPBonus.enUS.SUMMON_IMP[#addon.musicRPBonus.enUS.SUMMON_IMP+1] = { "What will become of you? I asked the imp. It laughed.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.SUMMON_IMP = addon.musicRPBonus.frFR.SUMMON_IMP or {}
addon.musicRPBonus.frFR.SUMMON_IMP[#addon.musicRPBonus.frFR.SUMMON_IMP+1] = { "Que vas-tu devenir ? ai-je demandé au diablotin. Il a ri.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M12 = { key = "SUMMON_SUCCUBUS", artist = "Knorkator", song = "Wir werden alle sterben" }
addon.musicRPBonus.deDE.SUMMON_SUCCUBUS = addon.musicRPBonus.deDE.SUMMON_SUCCUBUS or {}
addon.musicRPBonus.deDE.SUMMON_SUCCUBUS[#addon.musicRPBonus.deDE.SUMMON_SUCCUBUS+1] = { "Irgendwann endet alles. Diese Besprechung hoffentlich zuerst.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.SUMMON_SUCCUBUS = addon.musicRPBonus.enUS.SUMMON_SUCCUBUS or {}
addon.musicRPBonus.enUS.SUMMON_SUCCUBUS[#addon.musicRPBonus.enUS.SUMMON_SUCCUBUS+1] = { "Everything ends. Hopefully this meeting goes first.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.SUMMON_SUCCUBUS = addon.musicRPBonus.frFR.SUMMON_SUCCUBUS or {}
addon.musicRPBonus.frFR.SUMMON_SUCCUBUS[#addon.musicRPBonus.frFR.SUMMON_SUCCUBUS+1] = { "Tout finit un jour. Espérons que cette réunion finisse d'abord.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M13 = { key = "CORRUPTION", artist = "Metallica", song = "Until It Sleeps" }
addon.musicRPBonus.deDE.CORRUPTION = addon.musicRPBonus.deDE.CORRUPTION or {}
addon.musicRPBonus.deDE.CORRUPTION[#addon.musicRPBonus.deDE.CORRUPTION+1] = { "Manche Schatten schlafen nur, bis jemand sie weckt.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.CORRUPTION = addon.musicRPBonus.enUS.CORRUPTION or {}
addon.musicRPBonus.enUS.CORRUPTION[#addon.musicRPBonus.enUS.CORRUPTION+1] = { "Some shadows sleep only until someone wakes them.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.CORRUPTION = addon.musicRPBonus.frFR.CORRUPTION or {}
addon.musicRPBonus.frFR.CORRUPTION[#addon.musicRPBonus.frFR.CORRUPTION+1] = { "Certaines ombres dorment jusqu'à ce qu'on les réveille.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M14 = { key = "DRAIN_LIFE", artist = "Pink Floyd", song = "Comfortably Numb" }
addon.musicRPBonus.deDE.DRAIN_LIFE = addon.musicRPBonus.deDE.DRAIN_LIFE or {}
addon.musicRPBonus.deDE.DRAIN_LIFE[#addon.musicRPBonus.deDE.DRAIN_LIFE+1] = { "Der Schmerz verstummt. Das macht den Verlust nicht kleiner.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.DRAIN_LIFE = addon.musicRPBonus.enUS.DRAIN_LIFE or {}
addon.musicRPBonus.enUS.DRAIN_LIFE[#addon.musicRPBonus.enUS.DRAIN_LIFE+1] = { "The pain grows quiet. It does not make the loss smaller.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.DRAIN_LIFE = addon.musicRPBonus.frFR.DRAIN_LIFE or {}
addon.musicRPBonus.frFR.DRAIN_LIFE[#addon.musicRPBonus.frFR.DRAIN_LIFE+1] = { "La douleur se tait. Cela ne réduit pas la perte.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M15 = { key = "HEALTHSTONE", artist = "Erasure", song = "A Little Respect" }
addon.musicRPBonus.deDE.HEALTHSTONE = addon.musicRPBonus.deDE.HEALTHSTONE or {}
addon.musicRPBonus.deDE.HEALTHSTONE[#addon.musicRPBonus.deDE.HEALTHSTONE+1] = { "Ein wenig Rücksicht heilt manchmal mehr als große Worte.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.HEALTHSTONE = addon.musicRPBonus.enUS.HEALTHSTONE or {}
addon.musicRPBonus.enUS.HEALTHSTONE[#addon.musicRPBonus.enUS.HEALTHSTONE+1] = { "A little kindness heals more than grand speeches.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.HEALTHSTONE = addon.musicRPBonus.frFR.HEALTHSTONE or {}
addon.musicRPBonus.frFR.HEALTHSTONE[#addon.musicRPBonus.frFR.HEALTHSTONE+1] = { "Un peu d'égards soigne mieux que de grands discours.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M16 = { key = "UNENDING_BREATH", artist = "U2", song = "One" }
addon.musicRPBonus.deDE.UNENDING_BREATH = addon.musicRPBonus.deDE.UNENDING_BREATH or {}
addon.musicRPBonus.deDE.UNENDING_BREATH[#addon.musicRPBonus.deDE.UNENDING_BREATH+1] = { "Ein Atemzug für alle. Auch für die, die ihn nicht schätzen.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.UNENDING_BREATH = addon.musicRPBonus.enUS.UNENDING_BREATH or {}
addon.musicRPBonus.enUS.UNENDING_BREATH[#addon.musicRPBonus.enUS.UNENDING_BREATH+1] = { "One breath for all. Even those who fail to value it.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.UNENDING_BREATH = addon.musicRPBonus.frFR.UNENDING_BREATH or {}
addon.musicRPBonus.frFR.UNENDING_BREATH[#addon.musicRPBonus.frFR.UNENDING_BREATH+1] = { "Un souffle pour tous, même ceux qui ne l'apprécient pas.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M17 = { key = "SOULSTONE", artist = "Annie Lennox", song = "Why" }
addon.musicRPBonus.deDE.SOULSTONE = addon.musicRPBonus.deDE.SOULSTONE or {}
addon.musicRPBonus.deDE.SOULSTONE[#addon.musicRPBonus.deDE.SOULSTONE+1] = { "Manche Fragen bleiben auch nach dem Tod offen.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.SOULSTONE = addon.musicRPBonus.enUS.SOULSTONE or {}
addon.musicRPBonus.enUS.SOULSTONE[#addon.musicRPBonus.enUS.SOULSTONE+1] = { "Some questions remain unanswered even after death.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.SOULSTONE = addon.musicRPBonus.frFR.SOULSTONE or {}
addon.musicRPBonus.frFR.SOULSTONE[#addon.musicRPBonus.frFR.SOULSTONE+1] = { "Certaines questions restent ouvertes après la mort.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M18 = { key = "SUMMON_FELHUNTER", artist = "Amon Amarth", song = "The Pursuit of Vikings" }
addon.musicRPBonus.deDE.SUMMON_FELHUNTER = addon.musicRPBonus.deDE.SUMMON_FELHUNTER or {}
addon.musicRPBonus.deDE.SUMMON_FELHUNTER[#addon.musicRPBonus.deDE.SUMMON_FELHUNTER+1] = { "Die Jagd endet nicht, nur weil die Spur ungewöhnlich riecht.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.SUMMON_FELHUNTER = addon.musicRPBonus.enUS.SUMMON_FELHUNTER or {}
addon.musicRPBonus.enUS.SUMMON_FELHUNTER[#addon.musicRPBonus.enUS.SUMMON_FELHUNTER+1] = { "The hunt does not end because the trail smells strange.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.SUMMON_FELHUNTER = addon.musicRPBonus.frFR.SUMMON_FELHUNTER or {}
addon.musicRPBonus.frFR.SUMMON_FELHUNTER[#addon.musicRPBonus.frFR.SUMMON_FELHUNTER+1] = { "La chasse ne cesse pas parce que la piste sent bizarre.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M19 = { key = "FEL_ARMOR", artist = "Sepultura", song = "Refuse/Resist" }
addon.musicRPBonus.deDE.FEL_ARMOR = addon.musicRPBonus.deDE.FEL_ARMOR or {}
addon.musicRPBonus.deDE.FEL_ARMOR[#addon.musicRPBonus.deDE.FEL_ARMOR+1] = { "Meine Rüstung ist kein Schmuck. Sie ist ein Widerspruch.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.FEL_ARMOR = addon.musicRPBonus.enUS.FEL_ARMOR or {}
addon.musicRPBonus.enUS.FEL_ARMOR[#addon.musicRPBonus.enUS.FEL_ARMOR+1] = { "My armor is no ornament. It is an act of defiance.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.FEL_ARMOR = addon.musicRPBonus.frFR.FEL_ARMOR or {}
addon.musicRPBonus.frFR.FEL_ARMOR[#addon.musicRPBonus.frFR.FEL_ARMOR+1] = { "Mon armure n'est pas un bijou. C'est un acte de défi.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }
addon.musicRPBonusReferences.M20 = { key = "IMMOLATE", artist = "Rammstein", song = "Feuer frei!" }
addon.musicRPBonus.deDE.IMMOLATE = addon.musicRPBonus.deDE.IMMOLATE or {}
addon.musicRPBonus.deDE.IMMOLATE[#addon.musicRPBonus.deDE.IMMOLATE+1] = { "Ein kleiner Funke. Ein zunehmend großes Problem.", "*zeichnet ein flüchtiges Zeichen in die Luft und lauscht dem Nachhall.*" }
addon.musicRPBonus.enUS.IMMOLATE = addon.musicRPBonus.enUS.IMMOLATE or {}
addon.musicRPBonus.enUS.IMMOLATE[#addon.musicRPBonus.enUS.IMMOLATE+1] = { "A small spark. An increasingly large problem.", "*draws a fleeting sign in the air and listens to its echo.*" }
addon.musicRPBonus.frFR.IMMOLATE = addon.musicRPBonus.frFR.IMMOLATE or {}
addon.musicRPBonus.frFR.IMMOLATE[#addon.musicRPBonus.frFR.IMMOLATE+1] = { "Une petite étincelle. Un problème de plus en plus grand.", "*trace un signe fugace dans l'air et en écoute l'écho.*" }

-- Called only after personal texts. Does not bypass normal chance, cooldown or chat checks.
function addon.ChooseMusicText(key, targetName, demonName, race)
    if not addon.db or not addon.db.musicEnabled then return nil end
    local chance = addon.db.musicChance or 0
    if chance <= 0 or math.random(100) > chance then return nil end
    local ref = addon.musicRPReferences[key]
    if not ref or (ref.race and ref.race ~= race) then return nil end
    local lang = addon.GetOutputLanguage()
    local pools = {}
    local function addPools(language)
        local base = addon.musicRP[language] and addon.musicRP[language][key]
        if base then pools[#pools+1] = base end
        local extras = addon.musicRPBonus[language] and addon.musicRPBonus[language][key]
        if extras then
            for _, lines in ipairs(extras) do pools[#pools+1] = { gruppe = lines } end
        end
    end
    addPools(lang)
    if #pools == 0 and lang ~= "deDE" then addPools("deDE") end
    if #pools == 0 then return nil end
    local start = math.random(#pools)
    for offset = 0, #pools-1 do
        local pool = pools[((start+offset-1)%#pools)+1]
        local text = addon.ChooseText(pool, targetName, demonName)
        if text then return text end
    end
    return nil
end
