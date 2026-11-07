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
    CURSE_RECKLESSNESS = {
        name = "Curse of Recklessness",
        ziel = {
            "Go on, %s. Forget all caution.",
            "Courage is charming, %s. Recklessness is more useful.",
            "Charge straight into ruin, %s. I insist.",
            "Caution is overrated, %s. At least for you.",
            "You wanted to be brave, %s. I am merely helping.",
            "Armor, judgment, self-preservation... all surprisingly negotiable, %s.",
            "*draws a dark sign toward %s with two fingers.*",
            "*smiles thinly as unnatural bravado takes hold of %s.*",
            "*utters a clipped curse and gestures invitingly toward %s.*",
        },
        gruppe = {
            "A little less good judgment should help.",
            "Courage is useful. Recklessness is easier to predict.",
            "Some curses weaken the body. This one works on judgment.",
            "*traces a small dark rune in the air and slowly closes one hand.*",
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
        gruppe = {
            "A little borrowed vitality will do nicely.",
            "What fades over there becomes remarkably useful over here.",
            "Life force is just another resource with a pulse.",
            "*extends one hand and draws a dark stream of vitality inward.*",
            "*breathes in slowly as stolen life energy flows into the body.*",
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
    LIFE_FUNNEL = {
        name = "Health Funnel",
        gruppe = {
            "Take it, %p. Do not waste a drop.",
            "My strength is keeping you upright, %p. Do not get used to it.",
            "Hold still, %p. I am repairing you with my own life.",
            "You owe me after this, %p. Considerably.",
            "Blood for obedience, %p. A remarkably simple contract.",
            "If you fall over now, %p, I will take it personally.",
            "*reaches toward %p as dark life energy begins to flow between them.*",
            "*grimaces briefly as some of their own vitality passes into %p.*",
            "*grits their teeth and feeds %p with a thin stream of dark vitality.*",
            "*presses two fingers to their pulse and redirects part of that life force into %p.*",
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
    -- Individually written Warlock spell and ritual lines
    SEARING_PAIN = { name = "Searing Pain", gruppe = { "A single spark can replace a lengthy conversation.", "I call it emphasis. The flame calls it work.", "*flicks a painfully bright ember from the fingertips.*", "*traces a burning rune across the back of one hand.*" }, ziel = { "%s, that burn was merely a greeting." }, },
    RAIN_OF_FIRE = { name = "Rain of Fire", gruppe = { "The sky sends its gifts blazing hot today.", "Keep your hoods up. Fire is on the way.", "*stretches both arms while sparks fall across a distant circle.*", "*marks glowing points against the night sky.*" }, },
    HELLFIRE = { name = "Hellfire", gruppe = { "A small circle of flame for my closest acquaintances.", "Sometimes darkness needs to be lit from within.", "*throws the arms wide as fel flames rise on every side.*", "*stands at the heart of a burning whirl and smiles thinly.*" }, },
    CONFLAGRATE = { name = "Conflagrate", gruppe = { "An ember is simply fire waiting for an invitation.", "What smolders can answer very suddenly.", "*clenches a fist and makes the embers flare.*", "*draws a final burning line with one finger.*" }, ziel = { "%s, an ember has become a verdict." }, },
    SHADOWBURN = { name = "Shadowburn", gruppe = { "Ash casts a surprisingly long shadow.", "This spell burns cold and finishes hot.", "*presses two dark sparks between the palms.*", "*opens a fist as black flame rushes out.*" }, ziel = { "%s, you will miss your shadows." }, },
    DEATH_COIL = { name = "Death Coil", gruppe = { "The end has many voices. This one is especially unkind.", "Sometimes a whisper from the other side is enough.", "*sends a shrieking spiral of dark energy forward.*", "*draws a narrow crescent of violet light.*" }, ziel = { "Do you hear the last bell, %s?" }, },
    HOWL_OF_TERROR = { name = "Howl of Terror", gruppe = { "Fear makes the fastest legs more honest.", "That exquisite silence just before panic.", "*releases a cry deeper than any mortal throat should manage.*", "*raises both arms as the air itself begins to scream.*" }, },
    BANISH = { name = "Banish", gruppe = { "Back to the spaces from which you crawled.", "Some guests must leave without a farewell.", "*draws a pale circle of sigils around one hand.*", "*closes the fingers as an unseen door locks shut.*" }, ziel = { "Your visit ends here, %s." }, },
    ENSLAVE_DEMON = { name = "Enslave Demon", gruppe = { "A bargain without negotiation. The bill comes later.", "Even a demon can learn the meaning of an order.", "*draws a chain of glowing runes through the air.*", "*meets a summoned creature's eyes without blinking.*" }, ziel = { "For one moment, %s, your will belongs to me." }, },
    EYE_OF_KILROGG = { name = "Eye of Kilrogg", gruppe = { "Anyone seeking to see everything need not go everywhere.", "A floating eye saves a remarkable number of boots.", "*opens a hand and releases a restless floating eye.*", "*closes the eyelids as sight wanders elsewhere.*" }, },
    SENSE_DEMONS = { name = "Sense Demons", gruppe = { "Sulfur and arrogance. An unmistakable trail.", "I know the smell of bad decisions.", "*tests the air as if tasting cold ash.*", "*passes a finger over a faintly glowing black seal.*" }, },
    DRAIN_MANA = { name = "Drain Mana", gruppe = { "Your magic has discovered a new purpose.", "Waste is a sin, and I am terribly conscientious.", "*closes the fingers around an invisible magical thread.*", "*pulls a violet stream toward the chest.*" }, ziel = { "%s, let us share your power. I shall take the larger part." }, },
    SIPHON_LIFE = { name = "Siphon Life", gruppe = { "A little of your life is due as rent.", "Darkness has an extraordinarily patient appetite.", "*runs a red thread of life between two fingers.*", "*makes a tiny heartbeat flare like a distant light.*" }, ziel = { "Your weariness feeds me, %s." }, },
    CURSE_TONGUES = { name = "Curse of Tongues", gruppe = { "Words are dangerous. Confusion is worse.", "Even a powerful incantation can trip over its syllables.", "*ties three whispering runes into a knot.*", "*puts one finger to the lips and smiles mockingly.*" }, ziel = { "Do try again, %s. Very slowly." }, },
    CURSE_ELEMENTS = { name = "Curse of the Elements", gruppe = { "Fire and frost are easier to persuade than people.", "The elements signed a different agreement today.", "*arranges four glowing sigils like cards in one hand.*", "*runs fingers over a shattering elemental seal.*" }, ziel = { "Even the elements turn against you, %s." }, },
    CURSE_SHADOW = { name = "Curse of Shadow", gruppe = { "Where the light ends, my jurisdiction begins.", "Shadows make very patient allies.", "*brushes a dark crescent across the air.*", "*lets black threads crawl along the earth.*" }, ziel = { "Your shadow knew my name already, %s." }, },
    CURSE_DOOM = { name = "Curse of Doom", gruppe = { "A deadline is merely a polite word for fate.", "The hourglass is not on your side.", "*turns an invisible hourglass between two fingers.*", "*places a dark seal that begins to pulse slowly.*" }, ziel = { "%s, I have reserved an ending for you." }, },
    CURSE_EXHAUSTION = { name = "Curse of Exhaustion", gruppe = { "Run from me and soon the whole world weighs on your shoulders.", "One heavy step is the beginning of honest thought.", "*lowers a hand as though weighing down the air.*", "*draws an invisible leaden thread across a trail.*" }, ziel = { "Not so fast, %s. We have time." }, },
    RITUAL_DOOM = { name = "Ritual of Doom", gruppe = { "The circle is closed. Rarely a good omen.", "I suggest everyone count their fingers.", "*checks every notch in a summoned ritual circle.*", "*places a black offering mark on the ground.*" }, },
    DEMONIC_SACRIFICE = { name = "Demonic Sacrifice", gruppe = { "Every pact demands payment. This one is personal.", "A demon is a tool that remembers its owner.", "*draws a dreadful sign between caster and companion.*", "*lowers the gaze as demonic energy flows back.*" }, },
    SHADOW_WARD = { name = "Shadow Ward", gruppe = { "Fight shadows with shadows. Economical, really.", "Even warlocks occasionally appreciate a little protection.", "*wraps both hands in a thin veil of darkness.*", "*closes a violet warding rune over the armor.*" }, },
    CREATE_FIRESTONE = { name = "Create Firestone", gruppe = { "A little portable fire, no furnace required.", "Those who work with flame should keep some in reserve.", "*compresses a fiery spark into a solid stone.*", "*rolls a glowing pebble across the open palm.*" }, },
    CREATE_SPELLSTONE = { name = "Create Spellstone", gruppe = { "Magic can be disciplined. To a degree.", "A stone full of objections. Delightful.", "*draws a shimmering shell around a small stone.*", "*seals a whispering rune inside crystal shards.*" }, },
    BANE_OF_HAVOC = { name = "Bane of Havoc", gruppe = { "One enemy is a worry. Two are an opportunity.", "Chaos has a talent for splitting the bill.", "*draws a burning bond between two shadows.*", "*traces a split sigil above the left palm.*" }, ziel = { "%s, your suffering has found company." }, },
    INCINERATE = { name = "Incinerate", gruppe = { "Fire has an answer. A short one.", "You need no philosophy to understand a flame.", "*hurls a concentrated shaft of fire from one hand.*", "*snaps the fingers apart and kindles a blinding ember.*" }, ziel = { "%s, you stood in precisely the wrong place." }, },
    WRACK = { name = "Wrack", gruppe = { "A fortress can be broken slowly. So can a will.", "The finest curses know how to wait.", "*closes a fist slowly as if twisting an invisible cord.*", "*lets a narrow dark sign dissolve into empty air.*" }, ziel = { "Every second belongs to me now, %s." }, },
    PORTAL_SUMMONING = { name = "Portal of Summoning", gruppe = { "A portal is merely a door with worse neighbors.", "Please do not step on the runes. The door is sensitive.", "*draws a wide ring of fel runes in the air.*", "*touches the edge of a wavering passage with two fingertips.*" }, },
    SPELL_LOCK = { name = "Spell Lock", gruppe = { "Your words will find no exit today.", "Even the strongest incantation needs an open mouth.", "*snaps a blue rune out with a flick of the fingers.*", "*sets a narrow ward around a whispered syllable.*" }, ziel = { "That next syllable stays in your throat, %s." }, },
    FEL_DOMINATION = { name = "Fel Domination", gruppe = { "A demon ought to know who writes the rules here.", "The legions of hell seem poorly managed.", "*tears open a demonic seal with a sharp gesture.*", "*strikes a flickering mark upon the ground.*" }, },
}