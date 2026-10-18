-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
-- Racial warlock RP text variants; other spells use general Texts.lua pools.

local _, addon = ...

addon.localeData.frFR.racial = {
    Gnome = {
        SHADOW_BOLT = {
            ziel = { "Appareil calibre, %s. Lancement du trait de l'ombre.", "*ajuste une petite rune et projette un trait de l'ombre sur %s.*" },
            gruppe = { "*recalibre les runes pour la prochaine experience.*" },
        },
        CORRUPTION = {
            ziel = { "Votre courbe de decomposition promet beaucoup, %s.", "*memorise une formule tout en corrompant %s.*" },
            gruppe = { "*recalibre les runes pour la prochaine experience.*" },
        },
        IMMOLATE = {
            ziel = { "Reaction thermique en cours, %s.", "*projette une etincelle verdatre vers %s.*" },
            gruppe = { "*recalibre les runes pour la prochaine experience.*" },
        },
        FEAR = {
            ziel = { "Petite demonstration de panique irrationnelle, %s !", "*tapote un instrument grave de runes et designe %s.*" },
            gruppe = { "*recalibre les runes pour la prochaine experience.*" },
        },
        DRAIN_LIFE = {
            ziel = { "Transfert de vie de %s vers moi. Excellent !", "*observe l'energie sombre qui passe de %s a sa main.*" },
            gruppe = { "*recalibre les runes pour la prochaine experience.*" },
        },
        CURSE_RECKLESSNESS = {
            ziel = { "Le courage est utile, %s. La temerite est plus instructive.", "*trace un minuscule symbole de malediction vers %s.*" },
            gruppe = { "*recalibre les runes pour la prochaine experience.*" },
        },
    },
    Human = {
        SHADOW_BOLT = {
            ziel = { "Les ombres vous jugeront, %s.", "*designe %s et invoque les tenebres.*" },
            gruppe = { "*recite une formule sombre d'une voix ferme.*" },
        },
        CORRUPTION = {
            ziel = { "Votre force se fletrira, %s.", "*lance a voix basse une ancienne malediction sur %s.*" },
            gruppe = { "*recite une formule sombre d'une voix ferme.*" },
        },
    },
    Orc = {
        SHADOW_BOLT = {
            ziel = { "Puissance du Neant ! Ecrase %s !", "*projette une ombre sur %s dans un cri de guerre.*" },
            gruppe = { "*serre le poing et appelle les ombres.*" },
        },
        CORRUPTION = {
            ziel = { "Deperissez, %s. Lentement.", "*serre le poing et maudit %s.*" },
            gruppe = { "*serre le poing et appelle les ombres.*" },
        },
    },
    Scourge = {
        SHADOW_BOLT = {
            ziel = { "Je connais deja la mort, %s. Voici les ombres.", "*leve une main osseuse et projette les tenebres sur %s.*" },
            gruppe = { "*tend une main osseuse vers les tenebres.*" },
        },
        CORRUPTION = {
            ziel = { "Votre chair se decomposera aussi, %s.", "*trace une marque maudite devant %s.*" },
            gruppe = { "*tend une main osseuse vers les tenebres.*" },
        },
    },
    BloodElf = {
        SHADOW_BOLT = {
            ziel = { "Meme les tenebres peuvent etre elegantes, %s.", "*forme une rune d'ombre parfaite et la dirige vers %s.*" },
            gruppe = { "*trace une rune parfaite dans les airs.*" },
        },
        CORRUPTION = {
            ziel = { "Votre force sert maintenant un art plus raffine, %s.", "*dessine une rune de corruption devant %s.*" },
            gruppe = { "*trace une rune parfaite dans les airs.*" },
        },
    },
    Troll = {
        SHADOW_BOLT = {
            ziel = { "Les ombres ont faim de vous, %s.", "*fait un geste vif et menacant vers %s.*" },
            gruppe = { "*rit d'une voix rauque et prononce une malediction.*" },
        },
        CORRUPTION = {
            ziel = { "Une longue et vilaine malediction pour vous, %s.", "*sourit et trace un signe maudit devant %s.*" },
            gruppe = { "*rit d'une voix rauque et prononce une malediction.*" },
        },
    },
}
