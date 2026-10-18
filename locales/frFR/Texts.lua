-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- Role-playing dialogue, emote, ambient, and translation text in this
-- file is licensed under the Creative Commons Attribution-ShareAlike
-- 4.0 International License.

local _, addon = ...

addon.localeData.frFR.texts = {
    SHADOW_BOLT = {
        name = "Trait de l'ombre",
        ziel = {
            "Les ombres vous trouvent, %s.",
            "Courez si vous voulez, %s. Les tenebres sont plus rapides.",
            "Un peu d'obscurite pour vous, %s.",
            "Vous etes reste trop longtemps dans la lumiere, %s.",
            "Le Neant distordu vous salue, %s.",
            "*rassemble les tenebres entre ses mains et les projette sur %s.*",
            "*pointe %s du doigt tandis qu'un trait d'ombre fend l'air.*",
            "*condense une masse d'ombre dans une main avant de l'envoyer vers %s.*",
        },
        gruppe = {
            "Les ombres repondent.",
            "Les tenebres voyagent remarquablement bien.",
            "Un trait d'ombre, fraichement livre.",
            "*forme une sphere d'obscurite vacillante entre ses mains.*",
            "*attire l'ombre dans une paume jusqu'a ce qu'une energie froide y crepite.*",
        },
    },
    IMMOLATE = {
        name = "Immolation",
        ziel = {
            "Brulez, %s. Cela simplifie les choses.",
            "Le feu gangrene vous va presque bien, %s.",
            "*trace un signe sec et embrase %s de flammes gangrenees.*",
        },
        gruppe = {
            "Bruler n'est qu'une autre forme de revelation.",
            "Le feu gangrene trouve toujours quelque chose a consumer.",
            "*trace un signe sec tandis que des flammes vertes jaillissent.*",
            "*fait danser une etincelle gangrenee entre deux doigts.*",
        },
    },
    CORRUPTION = {
        name = "Corruption",
        ziel = {
            "Un peu de corruption pour la route, %s.",
            "Cela ne fera qu’empirer, %s.",
            "*murmure une formule et pose une malediction lente sur %s.*",
        },
        gruppe = {
            "La corruption n'a pas besoin d'un visage. Seulement d'une victime.",
            "Les tenebres travaillent mieux lorsqu'elles prennent leur temps.",
            "*murmure une courte formule tandis que l'ombre se rassemble.*",
            "*trace une rune sombre dans l'air et la regarde s'effacer.*",
        },
    },
    CURSE_WEAKNESS = {
        name = "Malédiction de faiblesse",
        ziel = {
            "Votre force vous abandonne, %s.",
            "Voilà qui devrait vous rendre un peu moins impressionnant, %s.",
            "Vous le sentez, %s ? Votre force s'écoule déjà.",
            "Continuez à vous battre, %s. Simplement avec moins de vigueur.",
            "Une petite malédiction pour un gros problème, %s.",
            "*trace une rune terne dans l'air ; une énergie sombre se pose sur %s.*",
            "*referme lentement une main tandis que la force semble quitter %s.*",
            "*murmure une courte malédiction et désigne %s de deux doigts.*",
        },
        gruppe = {
            "La force se négocie étonnamment bien.",
            "Un peu moins de puissance en face ne fait jamais de mal.",
            "*trace une rune terne dans l'air et la laisse se dissoudre en fumée sombre.*",
            "*murmure une malédiction qui étouffe la force et referme lentement la main.*",
        },
    },
    CURSE_RECKLESSNESS = {
        name = "Malediction de temerite",
        ziel = {
            "Allez-y, %s. Oubliez toute prudence.",
            "Le courage est charmant, %s. La temerite est plus utile.",
            "Jetez-vous donc dans le desastre, %s.",
            "La prudence est surestimee, %s. Du moins pour vous.",
            "Vous vouliez etre brave, %s. Je ne fais que vous aider.",
            "Armure, jugement, instinct de survie... tout cela se negocie etonnamment bien, %s.",
            "*trace de deux doigts un signe sombre en direction de %s.*",
            "*esquisse un sourire tandis qu'une audace surnaturelle gagne %s.*",
            "*prononce une breve malediction et fait un geste provocateur vers %s.*",
        },
        gruppe = {
            "Un peu moins de bon sens devrait aider.",
            "Le courage est utile. La temerite est plus previsible.",
            "Certaines maledictions affaiblissent le corps. Celle-ci s'occupe du jugement.",
            "*trace une petite rune sombre dans l'air puis referme lentement la main.*",
        },
    },
    OMEN_AGONY = {
        name = "Presage d'agonie",
        ziel = {
            "La douleur commence doucement, %s. Elle va grandir.",
            "Vous avez encore le temps de vous habituer a la douleur, %s. Pas beaucoup.",
            "L'agonie prend son temps avec vous, %s.",
            "Chaque instant sera un peu pire, %s.",
            "Je ne vous promets qu'une certitude croissante, %s.",
            "*trace de deux doigts une spirale sombre en direction de %s.*",
            "*prononce un presage a voix basse ; un voile sombre se referme autour de %s.*",
            "*observe %s avec une curiosite calme tandis que le tourment gagne lentement en force.*",
        },
        gruppe = {
            "L'agonie commence. Elle n'est pas pressee.",
            "Un presage a besoin de temps pour reveler tout son sens.",
            "*laisse une rune sombre s'eteindre lentement dans l'air.*",
        },
    },
    CURSE_AGONY = {
        name = "Malediction d'agonie",
        gruppe = {
            "De l'agonie pour tout le monde. Je suis genereux aujourd'hui.",
            "Qu'ils apprennent ensemble a quel point la douleur peut etre patiente.",
            "Une malediction, plusieurs cris. Efficace.",
            "Les tenebres n'ont pas besoin de choisir une seule victime aujourd'hui.",
            "*ecarte les deux mains ; une energie sombre deferle parmi les ennemis.*",
            "*murmure une malediction tandis que les ombres se repandent comme une fumee froide.*",
            "*trace un large cercle dans l'air ; des runes sombres s'illuminent tout autour.*",
            "*esquisse un sourire lorsque plusieurs ennemis tressaillent de douleur en meme temps.*",
        },
    },
    FEAR = {
        name = "Peur",
        ziel = {
            "Courez, %s. Votre instinct fonctionne enfin.",
            "Ne regardez pas de trop pres, %s.",
            "Il y a quelque chose derriere vous, %s. Probablement.",
            "Votre courage n'etait que provisoire, %s.",
            "Allez, %s. La panique vous va bien.",
            "*ouvre une main vers %s tandis qu'une ombre rampante se repand sur le sol.*",
            "*se penche vers %s et murmure un mot qui refroidit soudain l'air.*",
            "*fixe %s d'un regard inquietant tandis que les ombres semblent bouger seules.*",
        },
        gruppe = {
            "La peur est une forme de controle remarquablement efficace.",
            "Le courage est fragile. Verifions cela.",
            "Certaines lecons s'apprennent mieux en courant.",
            "*laisse une fine vague d'ombre ramper sur le sol.*",
            "*sourit faiblement tandis que l'air devient froid et oppressant.*",
        },
    },
    LIFE_TAP = {
        name = "Connexion",
        gruppe = {
            "Un peu de vie contre un peu de puissance. Echange equitable.",
            "Le sang n’est que du mana avec une mauvaise reputation.",
            "*puise directement dans sa propre vitalite et grimace un instant.*",
        },
    },
    DRAIN_LIFE = {
        name = "Drain de vie",
        ziel = {
            "Votre force sera plus utile ailleurs, %s.",
            "Restez tranquille, %s. Cela facilite le transfert.",
            "*arrache a %s un courant sombre de vitalite.*",
        },
        gruppe = {
            "Un peu de vitalite empruntee fera parfaitement l'affaire.",
            "Ce qui s'eteint la-bas devient fort utile ici.",
            "La force vitale n'est qu'une ressource avec un pouls.",
            "*tend une main et attire vers soi un courant sombre de vitalite.*",
            "*inspire lentement tandis qu'une energie vitale volee afflue dans son corps.*",
        },
    },
    DRAIN_SOUL = {
        name = "Drain d'ame",
        ziel = {
            "Restez encore un instant, %s. Je n'ai pas termine.",
            "Votre ame a une resonance interessante, %s.",
            "Juste un fragment, %s. Vous le remarquerez a peine.",
            "Ne resistez pas, %s. Cela rend l'extraction desordonnee.",
            "Il y a quelque chose en vous que j'aimerais garder, %s.",
            "*attire une faible lueur surnaturelle hors de %s.*",
            "*crochète deux doigts vers %s tandis qu'un fil pale d'essence commence a se liberer.*",
            "*murmure avec concentration tandis que quelque chose d'invisible est arrache a %s.*",
        },
        gruppe = {
            "Les ames laissent des traces fascinantes.",
            "Rien ne se perd. Surtout pas les ames.",
            "Il reste toujours quelque chose a recolter.",
            "*referme une main sur une faible lueur surnaturelle.*",
            "*attire un fil pale d'essence dans l'air et l'enroule autour de ses doigts.*",
        },
    },
    LIFE_FUNNEL = {
        name = "Captation de vie",
        gruppe = {
            "Prends-la, %p. Et ne gaspille pas une goutte.",
            "Ma force te maintient debout, %p. Ne t'y habitue pas.",
            "Ne bouge pas, %p. Je te repare avec ma propre vie.",
            "Tu me devras quelque chose apres ca, %p. Beaucoup.",
            "Du sang contre de l'obeissance, %p. Un contrat remarquablement simple.",
            "Si tu t'effondres maintenant, %p, je le prendrai personnellement.",
            "*tend une main vers %p tandis qu'une sombre energie vitale commence a circuler entre eux.*",
            "*grimace un instant tandis qu'une part de sa propre vitalite passe dans %p.*",
            "*serre les dents et alimente %p d'un mince courant de vitalite obscure.*",
            "*pose deux doigts sur son propre pouls et redirige une part de cette force vitale vers %p.*",
        },
    },
    SOUL_FIRE = {
        name = "Feu de l’ame",
        ziel = {
            "Celui-ci sera bruyant, %s.",
            "Vous vouliez savoir a quel point le Neant brule, %s.",
            "*projette sur %s une masse hurlante de feu d’ame.*",
        },
    },
    HEALTHSTONE = {
        name = "Pierre de soins",
        ziel = {
            "Prenez-la, %s. Ne demandez pas ce qu’il y a dedans.",
            "Pour les urgences, %s.",
            "*depose dans la main de %s une pierre chaude qui palpite faiblement.*",
        },
    },
    SOULSTONE = {
        name = "Pierre d’ame",
        ziel = {
            "Si le destin vous prend, %s, j’ai deja depose une reclamation.",
            "Mourir n’excuse pas un manque de preparation, %s.",
            "*lie une pierre d’ame a %s en murmurant une formule.*",
        },
    },
    DEMON_ARMOR = {
        name = "Armure demoniaque",
        gruppe = {
            "La peau mortelle est surestimee.",
            "*des runes sombres courent sur la peau puis disparaissent.*",
        },
    },
    FEL_ARMOR = {
        name = "Gangrarmure",
        gruppe = {
            "La magie gangrenee est dangereuse. C’est pour cela qu’elle fonctionne.",
            "*des etincelles vertes courent sur les vetements puis s’y fondent.*",
        },
    },
    SOUL_LINK = {
        name = "Lien spirituel",
        gruppe = {
            "La souffrance partagee est plus efficace.",
            "%p et moi avons un arrangement.",
            "*un fil sombre relie brievement le demoniste a %p.*",
        },
    },
    DARK_PACT = {
        name = "Pacte noir",
        gruppe = {
            "%p me doit deja quelque chose.",
            "Juste un petit transfert de puissance.",
            "*attire une etincelle sombre depuis %p.*",
        },
    },
    SUMMON_IMP = {
        name = "Invocation d’un diablotin",
        gruppe = {
            "Viens. Et ne touche a rien.",
            "*ouvre une petite fissure vacillante vers le Neant et attend avec impatience.*",
        },
    },
    SUMMON_VOIDWALKER = {
        name = "Invocation d’un marcheur du Vide",
        gruppe = {
            "Du Vide jusqu’a moi.",
            "*prononce un nom profond tandis que l’air devient anormalement silencieux.*",
        },
    },
    SUMMON_SUCCUBUS = {
        name = "Invocation d’une succube",
        gruppe = {
            "Nous avons du travail. Comportez-vous bien. Au debut au moins.",
            "*ouvre une faille violette d’un geste fluide.*",
        },
    },
    SUMMON_FELHUNTER = {
        name = "Invocation d’un chasseur corrompu",
        gruppe = {
            "Cherche. Et ne mange rien d’important.",
            "*dechire une faille verte d’ou monte un grondement affame.*",
        },
    },
    SUMMON_INFERNAL = {
        name = "Invocation d’un infernal",
        gruppe = {
            "La discretion s’arrete ici.",
            "*leve les deux bras tandis que le feu gangrene semble marquer le ciel.*",
        },
    },
    RITUAL_SUMMONING = {
        name = "Rituel d’invocation",
        gruppe = {
            "Placez-vous sur les marques. Ne marchez pas dans le cercle.",
            "*verifie deux fois chaque rune du cercle d’invocation.*",
        },
    },
    UNENDING_BREATH = {
        name = "Respiration interminable",
        gruppe = {
            "Respirer est etonnamment facultatif.",
            "*touche sa gorge tandis qu’une ombre froide recouvre son souffle.*",
        },
    },
    DETECT_INVISIBILITY = {
        name = "Detection de l’invisibilite",
        gruppe = {
            "Se cacher ne marche que si personne ne sait quoi chercher.",
            "*une lueur sombre traverse les yeux.*",
        },
    },
}
