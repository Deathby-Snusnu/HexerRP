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
    -- Maléfices, rituels et gestes écrits pour chaque action
    SEARING_PAIN = { name = "Douleur brûlante", gruppe = { "Une seule étincelle peut remplacer une longue discussion.", "J'appelle cela de l'insistance. La flamme appelle cela du travail.", "*fait jaillir une braise douloureusement vive du bout des doigts.*", "*dessine une rune brûlante sur le dos de sa main.*" }, ziel = { "%s, cette brûlure n'était que le bonjour." }, },
    RAIN_OF_FIRE = { name = "Pluie de feu", gruppe = { "Le ciel distribue des cadeaux brûlants aujourd'hui.", "Gardez vos capuches. Il va pleuvoir du feu.", "*tend les bras tandis que des étincelles tombent sur un cercle lointain.*", "*dessine des points incandescents dans le ciel nocturne.*" }, },
    HELLFIRE = { name = "Flammes infernales", gruppe = { "Un petit cercle de feu pour mes amis les plus proches.", "Parfois il faut éclairer les ténèbres de l'intérieur.", "*écarte les bras et fait monter des flammes gangrenées tout autour.*", "*sourit au centre d'un tourbillon brûlant.*" }, },
    CONFLAGRATE = { name = "Conflagration", gruppe = { "Une braise est un feu qui attend une invitation.", "Ce qui couve peut répondre soudainement.", "*serre le poing et attise des braises dormantes.*", "*trace une dernière ligne brûlante d'un doigt.*" }, ziel = { "%s, la braise est devenue un verdict." }, },
    SHADOWBURN = { name = "Brûlure de l'ombre", gruppe = { "La cendre projette une ombre étonnamment longue.", "Ce sort brûle froid avant de finir brûlant.", "*presse deux étincelles sombres entre les paumes.*", "*ouvre le poing, libérant une flamme noire.*" }, ziel = { "%s, tes ombres te manqueront." }, },
    DEATH_COIL = { name = "Voile mortel", gruppe = { "La fin possède de nombreuses voix. Celle-ci manque de douceur.", "Parfois un murmure de l'autre côté suffit.", "*projette une spirale hurlante d'énergie noire.*", "*dessine un croissant étroit de lumière violette.*" }, ziel = { "Entends-tu la dernière cloche, %s ?" }, },
    HOWL_OF_TERROR = { name = "Hurlement de terreur", gruppe = { "La peur rend les jambes rapides plus sincères.", "Ah, ce silence délicieux juste avant la panique.", "*pousse un cri plus profond qu'une gorge mortelle ne le pourrait.*", "*lève les bras tandis que l'air semble lui-même hurler.*" }, },
    BANISH = { name = "Bannir", gruppe = { "Retourne dans les interstices d'où tu es sorti en rampant.", "Certains invités doivent partir sans adieux.", "*dessine un cercle de sceaux pâles autour de sa main.*", "*ferme les doigts comme on verrouille une porte invisible.*" }, ziel = { "Ta visite se termine ici, %s." }, },
    ENSLAVE_DEMON = { name = "Asservir démon", gruppe = { "Un marché sans négociation. La facture viendra plus tard.", "Même un démon peut apprendre à obéir.", "*trace une chaîne de runes ardentes dans l'air.*", "*soutient le regard du démon sans cligner des yeux.*" }, ziel = { "Pour un instant, %s, ta volonté est mienne." }, },
    EYE_OF_KILROGG = { name = "Œil de Kilrogg", gruppe = { "Pour tout voir, il n'est pas nécessaire d'aller partout.", "Un œil volant économise bien des semelles.", "*ouvre la main et libère un œil flottant et inquiet.*", "*ferme les paupières tandis que son regard voyage ailleurs.*" }, },
    SENSE_DEMONS = { name = "Détection des démons", gruppe = { "Soufre et arrogance. Une piste indiscutable.", "Je reconnais l'odeur des mauvaises décisions.", "*hume l'air comme s'il avait le goût de cendre froide.*", "*caresse un sceau noir qui s'illumine faiblement.*" }, },
    DRAIN_MANA = { name = "Drain de mana", gruppe = { "Ta magie vient de trouver un nouvel usage.", "Le gaspillage est un péché. Je suis très consciencieux.", "*referme les doigts sur un fil magique invisible.*", "*attire un courant violet vers sa poitrine.*" }, ziel = { "%s, partageons ta puissance. Je prendrai la plus grande part." }, },
    SIPHON_LIFE = { name = "Siphon de vie", gruppe = { "Une petite part de ta vie est due comme loyer.", "Les ténèbres ont un appétit très patient.", "*fait glisser un fil rouge de vie entre deux doigts.*", "*fait scintiller un minuscule battement de cœur.*" }, ziel = { "Ta fatigue me nourrit, %s." }, },
    CURSE_TONGUES = { name = "Malédiction des langages", gruppe = { "Les mots sont dangereux. Les confusions le sont davantage.", "Même une grande incantation peut trébucher sur une syllabe.", "*noue trois runes murmurantes dans l'air.*", "*pose un doigt sur les lèvres avec un sourire moqueur.*" }, ziel = { "Réessaie, %s. Très lentement." }, },
    CURSE_ELEMENTS = { name = "Malédiction des éléments", gruppe = { "Le feu et le givre se persuadent plus facilement que les gens.", "Les éléments ont signé un autre accord aujourd'hui.", "*dispose quatre sceaux lumineux comme des cartes dans une main.*", "*fait éclater un sceau élémentaire sous les doigts.*" }, ziel = { "Même les éléments se retournent contre toi, %s." }, },
    CURSE_SHADOW = { name = "Malédiction de l'ombre", gruppe = { "Là où finit la lumière, commence mon domaine.", "Les ombres sont des alliées patientes.", "*effleure un croissant sombre dans l'air.*", "*laisse des fils noirs ramper sur la terre.*" }, ziel = { "Ton ombre connaissait déjà mon nom, %s." }, },
    CURSE_DOOM = { name = "Malédiction funeste", gruppe = { "Une échéance n'est qu'un nom poli pour le destin.", "Le sablier n'est pas de ton côté.", "*retourne un sablier invisible entre deux doigts.*", "*pose un sceau obscur qui palpite lentement.*" }, ziel = { "%s, je t'ai réservé une fin." }, },
    CURSE_EXHAUSTION = { name = "Malédiction de fatigue", gruppe = { "Fuis et bientôt le monde entier pèsera sur tes épaules.", "Un pas lourd est le début d'une pensée honnête.", "*abaisse la main comme si l'air devenait pesant.*", "*trace un fil de plomb invisible sur le sentier.*" }, ziel = { "Pas si vite, %s. Nous avons le temps." }, },
    RITUAL_DOOM = { name = "Rituel de malédiction", gruppe = { "Le cercle est fermé. Ce n'est presque jamais bon signe.", "Je conseille à chacun de compter ses doigts.", "*vérifie chaque entaille du cercle rituel.*", "*pose une marque d'offrande noire sur le sol.*" }, },
    DEMONIC_SACRIFICE = { name = "Sacrifice démoniaque", gruppe = { "Tout pacte réclame son prix. Celui-ci est personnel.", "Un démon est un outil qui se souvient de son propriétaire.", "*dessine un symbole terrible entre soi et son compagnon.*", "*baisse le regard tandis que l'énergie démoniaque revient.*" }, },
    SHADOW_WARD = { name = "Gardien de l'ombre", gruppe = { "Combattre l'ombre avec l'ombre. C'est économique.", "Même les démonistes aiment parfois une protection.", "*enveloppe ses mains d'un voile d'obscurité.*", "*referme une rune protectrice violette sur l'armure.*" }, },
    CREATE_FIRESTONE = { name = "Création de pierre de feu", gruppe = { "Un peu de feu portatif, sans four nécessaire.", "Qui travaille les flammes devrait en garder en réserve.", "*comprime une étincelle flamboyante en une pierre solide.*", "*fait rouler un caillou incandescent sur la paume.*" }, },
    CREATE_SPELLSTONE = { name = "Création de pierre de sort", gruppe = { "La magie se discipline. Un peu, du moins.", "Une pierre pleine d'objections. Charmant.", "*tisse une coque brillante autour d'une petite pierre.*", "*enferme une rune chuchotante dans des éclats de cristal.*" }, },
    BANE_OF_HAVOC = { name = "Fléau du chaos", gruppe = { "Un ennemi est un souci. Deux sont une occasion.", "Le chaos sait partager les factures.", "*trace un lien brûlant entre deux ombres.*", "*dessine un sceau fendu au-dessus de sa paume gauche.*" }, ziel = { "%s, ta souffrance s'est trouvé de la compagnie." }, },
    INCINERATE = { name = "Incinérer", gruppe = { "Le feu a une réponse. Elle est brève.", "Nul besoin d'être philosophe pour comprendre la flamme.", "*projette un rayon de feu concentré d'une main.*", "*écarte les doigts et embrase une étincelle aveuglante.*" }, ziel = { "%s, tu étais exactement au mauvais endroit." }, },
    WRACK = { name = "Tourment", gruppe = { "Une forteresse se brise lentement. Une volonté aussi.", "Les meilleures malédictions savent attendre.", "*ferme lentement le poing comme pour tordre un fil invisible.*", "*laisse disparaître un fin signe obscur dans le néant.*" }, ziel = { "Chaque seconde m'appartient désormais, %s." }, },
    PORTAL_SUMMONING = { name = "Portail d'invocation", gruppe = { "Un portail est une porte avec de bien pires voisins.", "Ne marche pas sur les runes. La porte est sensible.", "*trace un large anneau de runes gangrenées.*", "*touche d'un doigt le bord d'un passage ondoyant.*" }, },
    SPELL_LOCK = { name = "Verrou magique", gruppe = { "Tes mots ne trouveront aucune sortie aujourd'hui.", "Même la meilleure formule exige une bouche libre.", "*éteint une rune bleue d'un claquement de doigts.*", "*place un cercle de silence autour d'une syllabe murmurée.*" }, ziel = { "Cette prochaine syllabe te restera dans la gorge, %s." }, },
    FEL_DOMINATION = { name = "Domination gangrenée", gruppe = { "Un démon doit savoir qui rédige les règles ici.", "Les légions infernales sont fort mal dirigées.", "*déchire un sceau démoniaque d'un geste brusque.*", "*frappe une marque clignotante sur le sol.*" }, },
}