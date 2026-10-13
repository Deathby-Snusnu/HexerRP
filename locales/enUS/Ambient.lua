-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.enUS.ambient = {
    MURMUR = {
        "No... that was not the agreement.",
        "Quiet. I heard you.",
        "Not here. Not in front of them.",
        "Later. We will speak later.",
        "That was not my voice.",
        "I closed the circle. I know I did.",
        "Three names. I remember three. Why four?",
        "Not every thought in here is mine. That is... fine.",
        "*murmurs several syllables from no recognizable language.*",
        "*draws a tiny rune in the air and wipes it away at once.*",
        "*tilts their head and listens to the silence.*",
        "*smiles suddenly at something no one else seems to have heard.*",
        "*whispers something to %p and waits seriously for an answer.*",
        "%p, stop staring. Yes, you.",
        "No, %p. We are not eating that.",
    },
    DISTURBED = {
        "I heard you.",
        "Who said that?",
        "No. Stay there.",
        "The shadows are moving wrong.",
        "*looks sharply over one shoulder although nothing is there.*",
        "*flinches as if someone whispered directly into one ear.*",
        "*presses two fingers to the temple and mutters under the breath.*",
        "*stares suspiciously into an empty corner.*",
        "*checks whether an invisible circle around their feet is still intact.*",
        "*casts %p a questioning look, as if the demon noticed it too.*",
    },
    OUTBURST = {
        "NO!",
        "Stop!",
        "Not again!",
        "Back!",
        "GET OUT OF MY HEAD!",
        "*jerks violently and lets out a short startled cry.*",
        "*snatches one hand back as though something unseen reached for it.*",
        "*spins around with both hands raised defensively.*",
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
        "*whispers softly: \"Akrzzt ra ffhg... zha vel neth...\"*",
        "*whispers in a rough voice: \"Reth kal... mor zhul... vekh.\"*",
        "*drops to a barely audible whisper: \"Sha nar... vel kath...\"*",
        "*murmurs in alien sounds: \"Khar azh... neth varr...\"*",
        "*whispers guttural syllables that sound unlike any tongue of Azeroth: \"Zhek... thul... arai...\"*",
        "*barely moves the lips and whispers: \"Vel shan... kor eth...\"*",
        "*whispers hurriedly: \"Na var... na var... reth akh.\"*",
        "*breathes into the silence: \"Mor zul... vekh nar...\"*",
    },

}
