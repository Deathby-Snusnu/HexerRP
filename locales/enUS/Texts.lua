-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.enUS.texts = {
    SHADOW_BOLT = {
        name = "Shadow Bolt",
        ziel = {
            "The shadows find you, %s.",
            "Run if you like, %s. Darkness is faster.",
            "A little darkness for you, %s.",
            "You should not have stood in the light so long, %s.",
            "The Nether sends its regards, %s.",
            "Try not to blink, %s. You may miss the unpleasant part.",
            "*gathers darkness between both hands and hurls it at %s.*",
            "*points at %s as a bolt of shadow snaps across the air.*",
            "*draws a knot of darkness into one hand and sends it tearing toward %s.*",
        },
        gruppe = {
            "The shadows answer.",
            "Darkness travels remarkably well.",
            "One bolt of shadow, freshly delivered.",
            "*forms a flickering sphere of darkness between both hands.*",
            "*pulls shadow into one palm until it crackles with cold energy.*",
        },
    },
    IMMOLATE = {
        name = "Immolate",
        ziel = {
            "Burn, %s. It simplifies things.",
            "Fel fire suits you, %s.",
            "*traces a sharp sigil and sets %s alight with fel flame.*",
        },
        gruppe = {
            "Burning is simply another form of revelation.",
            "Fel fire always finds something willing to burn.",
            "*traces a sharp sigil as green flame flares into being.*",
            "*lets a spark of fel fire dance between two fingers.*",
        },
    },
    CORRUPTION = {
        name = "Corruption",
        ziel = {
            "A little darkness for the road, %s.",
            "It gets worse gradually, %s.",
            "*murmurs a compact curse over %s.*",
        },
        gruppe = {
            "Corruption does not need a face. Only a victim.",
            "Darkness does its finest work slowly.",
            "*murmurs a compact curse as shadow gathers around one hand.*",
            "*draws a dark rune in the air and watches it fade.*",
        },
    },
    CURSE_WEAKNESS = {
        name = "Curse of Weakness",
        ziel = {
            "Your strength is leaving you, %s.",
            "That should make you somewhat less impressive, %s.",
            "Feel that, %s? Your strength is already draining away.",
            "Keep fighting, %s. Just with less force behind it.",
            "A small curse for a large problem, %s.",
            "*draws a dull rune in the air; dark energy settles over %s.*",
            "*slowly closes one hand as strength seems to drain from %s.*",
            "*murmurs a short curse and points two fingers at %s.*",
        },
        gruppe = {
            "Strength is surprisingly negotiable.",
            "A little less power on the other side never hurts.",
            "*draws a dull rune in the air and lets it crumble into dark smoke.*",
            "*murmurs a strength-sapping curse and slowly closes one hand.*",
        },
    },
    OMEN_AGONY = {
        name = "Omen of Agony",
        ziel = {
            "The pain begins quietly, %s. It will grow.",
            "You still have time to get used to the pain, %s. Not much.",
            "Agony is taking its time with you, %s.",
            "Every moment will be a little worse, %s.",
            "I promise you nothing except increasing certainty, %s.",
            "*draws a dark spiral toward %s with two fingers.*",
            "*speaks a quiet omen; a dark veil settles around %s.*",
            "*watches %s with calm curiosity as the torment slowly gathers strength.*",
        },
        gruppe = {
            "The agony begins. It is in no hurry.",
            "An omen needs time to reveal its full meaning.",
            "*lets a dark rune slowly fade in the air.*",
        },
    },
    CURSE_AGONY = {
        name = "Curse of Agony",
        gruppe = {
            "Agony for everyone. I am feeling generous today.",
            "Let them learn together how patient pain can be.",
            "One curse, many screams. Efficient.",
            "The darkness does not have to choose a single victim today.",
            "*spreads both hands; dark energy rolls through the enemy ranks in waves.*",
            "*murmurs a curse as shadows spread through the area like cold smoke.*",
            "*traces a wide circle in the air; dark runes flare all around.*",
            "*smiles faintly as several enemies recoil in pain at once.*",
        },
    },
    FEAR = {
        name = "Fear",
        ziel = {
            "Run, %s. Your instincts are finally correct.",
            "Do not look too closely, %s.",
            "There are things behind you, %s. Probably.",
            "Your courage was always temporary, %s.",
            "Go on, %s. Panic suits you.",
            "*opens a hand toward %s as a crawling shadow spreads across the ground.*",
            "*leans toward %s and whispers a word that turns the air suddenly cold.*",
            "*fixes %s with an unsettling stare as the shadows seem to move on their own.*",
        },
        gruppe = {
            "Fear is such an efficient form of crowd control.",
            "Courage is fragile. Let us test it.",
            "Some lessons are best learned while running away.",
            "*lets a thin wave of shadow creep outward across the ground.*",
            "*smiles faintly as the surrounding air turns cold and oppressive.*",
        },
    },
    LIFE_TAP = {
        name = "Life Tap",
        gruppe = {
            "A little life for a little power. Fair trade.",
            "Blood is mana with worse marketing.",
            "*draws power directly from their own pulse and winces once.*",
        },
    },
    DRAIN_LIFE = {
        name = "Drain Life",
        ziel = {
            "You have more strength than you need, %s.",
            "Hold still, %s. It helps the transfer.",
            "*draws a dark stream of life from %s.*",
        },
    },
    DRAIN_SOUL = {
        name = "Drain Soul",
        ziel = {
            "Stay a moment, %s. I am not finished.",
            "Your soul has an interesting resonance, %s.",
            "Only a fragment, %s. You will hardly miss it.",
            "Do not struggle, %s. It only makes the extraction untidy.",
            "There is something in you I would like to keep, %s.",
            "*pulls a thin unnatural glow away from %s.*",
            "*hooks two fingers toward %s as a pale thread of essence begins to stretch free.*",
            "*murmurs intently while something unseen is drawn out of %s.*",
        },
        gruppe = {
            "Souls leave such interesting traces.",
            "Waste not, want not. Especially where souls are concerned.",
            "There is always something left to collect.",
            "*closes one hand around a faint, unnatural glimmer.*",
            "*draws a pale thread of essence through the air and lets it coil around the fingers.*",
        },
    },
    SOUL_FIRE = {
        name = "Soul Fire",
        ziel = {
            "This one will be loud, %s.",
            "You wanted to know how hot the Nether burns, %s.",
            "*hurls a screaming mass of soul-fire at %s.*",
        },
    },
    HEALTHSTONE = {
        name = "Healthstone",
        ziel = {
            "Take it, %s. Do not ask what is inside.",
            "For emergencies, %s.",
            "*presses a warm, faintly pulsing stone into %s's hand.*",
        },
    },
    SOULSTONE = {
        name = "Soulstone",
        ziel = {
            "If fate takes you, %s, I have filed an objection.",
            "Dying is no excuse for poor preparation, %s.",
            "*binds a soulstone to %s with a whispered formula.*",
        },
    },
    DEMON_ARMOR = {
        name = "Demon Armor",
        gruppe = {
            "Mortal skin is overrated.",
            "*dark runes crawl over the skin and sink out of sight.*",
        },
    },
    FEL_ARMOR = {
        name = "Fel Armor",
        gruppe = {
            "Fel is dangerous. That is why it works.",
            "*fel sparks crawl across the clothing and vanish into the fabric.*",
        },
    },
    SOUL_LINK = {
        name = "Soul Link",
        gruppe = {
            "Shared pain is more efficient.",
            "%p and I have an arrangement.",
            "*a dark thread briefly links the warlock to %p.*",
        },
    },
    DARK_PACT = {
        name = "Dark Pact",
        gruppe = {
            "%p owes me anyway.",
            "Just a small transfer of power.",
            "*draws a dark spark from %p with an open hand.*",
        },
    },
    SUMMON_IMP = {
        name = "Summon Imp",
        gruppe = {
            "Come out. Touch nothing.",
            "*opens a small flickering tear into the Nether and waits impatiently.*",
        },
    },
    SUMMON_VOIDWALKER = {
        name = "Summon Voidwalker",
        gruppe = {
            "From the void, to me.",
            "*speaks a deep name as the air turns unnaturally still.*",
        },
    },
    SUMMON_SUCCUBUS = {
        name = "Summon Succubus",
        gruppe = {
            "We have work. Behave. At first, at least.",
            "*opens a violet rift with a smooth gesture.*",
        },
    },
    SUMMON_FELHUNTER = {
        name = "Summon Felhunter",
        gruppe = {
            "Search. Do not eat anything important.",
            "*tears open a green rift as hungry growling answers.*",
        },
    },
    SUMMON_INFERNAL = {
        name = "Summon Infernal",
        gruppe = {
            "Subtlety ends here.",
            "*raises both arms as fel fire seems to mark the sky.*",
        },
    },
    RITUAL_SUMMONING = {
        name = "Ritual of Summoning",
        gruppe = {
            "Stand on the marks. Do not step into the circle.",
            "*checks every rune of the summoning circle twice.*",
        },
    },
    UNENDING_BREATH = {
        name = "Unending Breath",
        gruppe = {
            "Breathing is surprisingly optional.",
            "*touches the throat as a cold shadow settles over the breath.*",
        },
    },
    DETECT_INVISIBILITY = {
        name = "Detect Invisibility",
        gruppe = {
            "Hiding only works when no one knows what to seek.",
            "*a dark sheen passes across the eyes.*",
        },
    },
}
