-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
-- Racial warlock RP text variants; other spells use general Texts.lua pools.

local _, addon = ...

addon.localeData.deDE.racial = {
    Gnome = {
        SHADOW_BOLT = {
            ziel = { "Der Versuchsaufbau ist abgeschlossen, %s. Nun folgt der Schattenblitz.", "*justiert eine winzige Rune und schleudert einen Schattenblitz auf %s.*" },
            gruppe = { "*ordnet die Runen fuer den naechsten Versuch neu.*" },
        },
        CORRUPTION = {
            ziel = { "Die Zerfallsrate duerfte erfreulich sein, %s.", "*notiert gedanklich eine Formel und belegt %s mit Verderbnis.*" },
            gruppe = { "*ordnet die Runen fuer den naechsten Versuch neu.*" },
        },
        IMMOLATE = {
            ziel = { "Die thermische Reaktion beginnt jetzt, %s.", "*schnippt einen gruenlichen Funken in Richtung %s.*" },
            gruppe = { "*ordnet die Runen fuer den naechsten Versuch neu.*" },
        },
        FEAR = {
            ziel = { "Eine kleine Demonstration irrationaler Panik, %s!", "*klopft auf ein runenbeschriebenes Instrument und deutet auf %s.*" },
            gruppe = { "*ordnet die Runen fuer den naechsten Versuch neu.*" },
        },
        DRAIN_LIFE = {
            ziel = { "Lebenskrafttransfer von %s zu mir. Ausgezeichnet!", "*prueft aufmerksam, wie dunkle Energie aus %s in die eigene Hand stroemt.*" },
            gruppe = { "*ordnet die Runen fuer den naechsten Versuch neu.*" },
        },
        CURSE_RECKLESSNESS = {
            ziel = { "Mut ist gut, %s. Fehlende Vorsicht ist experimentell interessanter.", "*zeichnet ein winziges Fluchsymbol in Richtung %s.*" },
            gruppe = { "*ordnet die Runen fuer den naechsten Versuch neu.*" },
        },
    },
    Human = {
        SHADOW_BOLT = {
            ziel = { "Die Schatten richten ueber Euch, %s.", "*weist mit fester Hand auf %s und ruft die Finsternis.*" },
            gruppe = { "*spricht eine dunkle Formel mit fester Stimme.*" },
        },
        CORRUPTION = {
            ziel = { "Eure Kraft zerfaellt, %s.", "*spricht leise einen alten Verderbnisfluch gegen %s.*" },
            gruppe = { "*spricht eine dunkle Formel mit fester Stimme.*" },
        },
    },
    Orc = {
        SHADOW_BOLT = {
            ziel = { "Nethermacht! Zerschmettert %s!", "*schleudert mit einem knappen Kriegsschrei Schatten gegen %s.*" },
            gruppe = { "*ballt die Faust und ruft die Schatten.*" },
        },
        CORRUPTION = {
            ziel = { "Vergeht, %s. Langsam.", "*presst die Faust zusammen und verflucht %s.*" },
            gruppe = { "*ballt die Faust und ruft die Schatten.*" },
        },
    },
    Scourge = {
        SHADOW_BOLT = {
            ziel = { "Den Tod kenne ich bereits, %s. Nun lernt Ihr den Schatten kennen.", "*hebt eine knochige Hand und schleudert Finsternis auf %s.*" },
            gruppe = { "*streckt eine knochige Hand in die Finsternis.*" },
        },
        CORRUPTION = {
            ziel = { "Auch Euer Fleisch wird vergehen, %s.", "*zieht ein kaltes Fluchzeichen vor %s in die Luft.*" },
            gruppe = { "*streckt eine knochige Hand in die Finsternis.*" },
        },
    },
    BloodElf = {
        SHADOW_BOLT = {
            ziel = { "Selbst die Finsternis kann elegant sein, %s.", "*formt eine makellose Schattenrune und richtet sie auf %s.*" },
            gruppe = { "*zeichnet eine makellose Rune in die Luft.*" },
        },
        CORRUPTION = {
            ziel = { "Eure Kraft gehorcht nun einer feineren Kunst, %s.", "*zeichnet mit anmutiger Hand eine Verderbnisrune vor %s.*" },
            gruppe = { "*zeichnet eine makellose Rune in die Luft.*" },
        },
    },
    Troll = {
        SHADOW_BOLT = {
            ziel = { "Die Schatten haben Hunger auf Euch, %s.", "*wirft eine schnelle, drohende Geste in Richtung %s.*" },
            gruppe = { "*lacht rau und spricht einen Fluch.*" },
        },
        CORRUPTION = {
            ziel = { "Ein langer, boeser Fluch fuer Euch, %s.", "*grinst und zeichnet ein Fluchzeichen vor %s.*" },
            gruppe = { "*lacht rau und spricht einen Fluch.*" },
        },
    },
}
