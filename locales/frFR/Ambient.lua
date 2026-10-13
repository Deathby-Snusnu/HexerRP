-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.frFR.ambient = {
    MURMUR = {
        "Non... ce n’etait pas l’accord.",
        "Silence. Je vous ai entendu.",
        "Pas ici. Pas devant eux.",
        "Plus tard. Nous parlerons plus tard.",
        "Ce n’etait pas ma voix.",
        "J’ai ferme le cercle. J’en suis certain.",
        "Trois noms. J’en retiens trois. Pourquoi quatre?",
        "Toutes les pensees ici ne sont pas les miennes. C’est... normal.",
        "*murmure quelques syllabes qui ne ressemblent a aucune langue connue.*",
        "*trace une minuscule rune dans l’air puis l’efface aussitot.*",
        "*penche la tete et ecoute le silence.*",
        "*sourit soudain a quelque chose que personne d’autre ne semble avoir entendu.*",
        "*murmure quelque chose a %p et attend serieusement une reponse.*",
        "%p, cesse de fixer. Oui, toi.",
        "Non, %p. On ne mange pas ca.",
    },
    DISTURBED = {
        "Je vous ai entendu.",
        "Qui a dit ca?",
        "Non. Restez la-bas.",
        "Les ombres bougent mal.",
        "*regarde brusquement par-dessus son epaule alors qu’il n’y a rien.*",
        "*tressaille comme si quelqu’un venait de murmurer a son oreille.*",
        "*pose deux doigts sur sa tempe et marmonne a voix basse.*",
        "*fixe avec mefiance un coin parfaitement vide.*",
        "*verifie nerveusement qu’un cercle invisible autour de ses pieds est toujours ferme.*",
        "*lance a %p un regard interrogateur, comme si le demon avait remarque la meme chose.*",
    },
    OUTBURST = {
        "NON!",
        "Arretez!",
        "Pas encore!",
        "Reculez!",
        "SORTEZ DE MA TETE!",
        "*sursaute violemment et laisse echapper un cri bref.*",
        "*retire brusquement sa main comme si quelque chose d’invisible l’avait saisie.*",
        "*se retourne d’un coup, les deux mains levees pour se defendre.*",
    },    DEMONIC_SAY = {
        "Zha'korr vel'nath... sha reth.",
        "Akrazh tor'vel. Neth ka'rai.",
        "Vhar'zul... vekh nar ash.",
        "Khar azreth, mor'kath vel.",
        "Sha'kar en varr... thul akresh.",
        "Neth'ra khol. Vesh tal'mor.",
        "Arkh zhal vekh... nar'keth.",
        "Reth akh mor'zul... vel shan.",
        "Karesh thul na'var. Zhek.",
        "Vaal kor'eth... nahr zhul.",
    },
    DEMONIC_YELL = {
        "ZHA'KORR VEL SHAN'ETH!",
        "AKRAZH! NAR VEKH'TOR!",
        "RETH'KAL MOR'ZHUL!",
        "KHAR'VETH! SHA NAR AKH!",
        "VEL'NATH KORR AZH'RA!",
        "THUL'KAR NETH VARR!",
    },
    DEMONIC_WHISPER = {
        "*chuchote doucement : \"Akrzzt ra ffhg... zha vel neth...\"*",
        "*chuchote d’une voix rauque : \"Reth kal... mor zhul... vekh.\"*",
        "*baisse la voix jusqu’a un murmure presque inaudible : \"Sha nar... vel kath...\"*",
        "*murmure des sons etrangers : \"Khar azh... neth varr...\"*",
        "*chuchote des syllabes gutturales qui ne ressemblent a aucune langue d’Azeroth : \"Zhek... thul... arai...\"*",
        "*bouge a peine les levres et murmure : \"Vel shan... kor eth...\"*",
        "*chuchote precipitamment : \"Na var... na var... reth akh.\"*",
        "*souffle dans le silence : \"Mor zul... vekh nar...\"*",
    },

}
