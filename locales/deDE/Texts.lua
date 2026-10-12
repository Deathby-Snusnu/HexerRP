local _, addon = ...

addon.localeData.deDE.texts = {
    SHADOW_BOLT = {
        name = "Schattenblitz",
        ziel = {
            "Die Schatten finden Euch, %s.",
            "Lauft ruhig weiter, %s. Dunkelheit ist schneller.",
            "Ein wenig Finsternis fuer Euch, %s.",
            "*zieht die Finger zusammen, waehrend sich zwischen den Haenden dunkle Energie verdichtet.*",
            "*schleudert einen kompakten Schattenblitz auf %s.*",
            "*laesst die Dunkelheit um den Arm kreisen und weist auf %s.*",
        },
        gruppe = {
            "Die Schatten antworten.",
            "*formt zwischen beiden Haenden eine Kugel aus flackernder Finsternis.*",
        },
    },
    IMMOLATE = {
        name = "Feuerbrand",
        ziel = {
            "Brennt, %s. Das macht die Sache uebersichtlicher.",
            "Fel-Feuer steht Euch erstaunlich gut, %s.",
            "Ihr solltet das nicht beruehren, %s. Zu spaet.",
            "*zeichnet ein scharfes Zeichen in die Luft; gruenliches Feuer springt auf %s ueber.*",
            "*schnippt mit zwei Fingern in Richtung %s, worauf Fel-Flammen aufflammen.*",
        },
        gruppe = {
            "Brennen ist nur eine andere Form von Erkenntnis.",
            "Fel-Feuer findet immer etwas, das brennen kann.",
            "*zeichnet ein scharfes Zeichen in die Luft; gruenliche Flammen schlagen auf.*",
            "*laesst einen Funken Fel-Feuer zwischen den Fingern aufflammen.*",
        },
    },
    CORRUPTION = {
        name = "Verderbnis",
        ziel = {
            "Etwas Dunkelheit fuer unterwegs, %s.",
            "Ihr werdet merken, wann sie zu wirken beginnt, %s.",
            "Keine Sorge, %s. Es wird nur allmaehlich schlimmer.",
            "*murmelt eine kurze Formel und legt einen schleichenden Fluch auf %s.*",
            "*zieht mit dem Finger eine dunkle Rune in die Luft vor %s.*",
        },
        gruppe = {
            "Verderbnis braucht kein Gesicht. Nur ein Opfer.",
            "Die Dunkelheit arbeitet am besten langsam.",
            "*murmelt eine kurze Formel, waehrend sich dunkle Energie sammelt.*",
            "*zeichnet eine dunkle Rune in die Luft und laesst sie verglimmen.*",
        },
    },
    CURSE_WEAKNESS = {
        name = "Fluch der Schwaeche",
        ziel = {
            "Eure Kraft verlaesst Euch, %s.",
            "Das sollte Euch etwas weniger beeindruckend machen, %s.",
            "Fuehlt Ihr das, %s? Eure Staerke versickert bereits.",
            "Kaempft ruhig weiter, %s. Nur eben mit weniger Kraft.",
            "Ein kleiner Fluch fuer ein grosses Problem, %s.",
            "*zieht mit zwei Fingern eine matte Rune in die Luft; dunkle Energie legt sich auf %s.*",
            "*schliesst langsam die Hand, waehrend die Kraft aus %s zu weichen scheint.*",
            "*murmelt einen kurzen Fluch und deutet mit zwei Fingern auf %s.*",
        },
        gruppe = {
            "Staerke ist erstaunlich leicht zu verhandeln.",
            "Ein wenig weniger Kraft auf der anderen Seite kann nie schaden.",
            "*zeichnet eine matte Rune in die Luft und laesst sie in dunklem Rauch zerfallen.*",
            "*murmelt einen krafterstickenden Fluch und schliesst langsam die Hand.*",
        },
    },
    OMEN_AGONY = {
        name = "Omen der Pein",
        ziel = {
            "Der Schmerz beginnt leise, %s. Er wird sich steigern.",
            "Ihr habt noch Zeit, Euch an den Schmerz zu gewoehnen, %s. Nicht viel.",
            "Die Pein nimmt sich Zeit mit Euch, %s.",
            "Jeder Augenblick wird ein wenig schlimmer, %s.",
            "Ich verspreche Euch nichts ausser einer zunehmenden Gewissheit, %s.",
            "*zeichnet mit zwei Fingern eine dunkle Spirale in Richtung von %s.*",
            "*spricht ein leises Omen; ein dunkler Schleier legt sich um %s.*",
            "*beobachtet %s mit ruhiger Neugier, waehrend der Fluch langsam an Kraft gewinnt.*",
        },
        gruppe = {
            "Die Pein beginnt. Sie hat es nicht eilig.",
            "Ein Omen braucht Zeit, um seine ganze Bedeutung zu entfalten.",
            "*laesst eine dunkle Rune langsam in der Luft verglimmen.*",
        },
    },
    CURSE_AGONY = {
        name = "Fluch der Pein",
        gruppe = {
            "Pein fuer alle. Ich bin heute grosszuegig.",
            "Moegen sie gemeinsam lernen, wie geduldig Schmerz sein kann.",
            "Ein Fluch, viele Schreie. Effizient.",
            "Die Dunkelheit muss sich heute nicht fuer ein einziges Opfer entscheiden.",
            "*breitet beide Haende aus; dunkle Energie schlaegt in Wellen in die Gegnerreihen.*",
            "*murmelt einen Fluch, waehrend sich Schatten wie kalter Rauch in der Umgebung ausbreiten.*",
            "*zieht einen weiten Kreis in die Luft; dunkle Runen flackern ringsum auf.*",
            "*laechelt schmal, als mehrere Gegner gleichzeitig unter der Pein zusammenzucken.*",
        },
    },
    FEAR = {
        name = "Furcht",
        ziel = {
            "Lauft, %s. Eure Instinkte haben ausnahmsweise recht.",
            "Seht genau hin, %s. Oder besser nicht.",
            "Was Ihr gleich seht, ist nicht fuer sterbliche Augen gedacht, %s.",
            "*oeffnet die Hand zu %s hin; ein kaum sichtbarer Schatten kriecht ueber den Boden.*",
            "*fluesterte ein einziges Wort, das %s sichtbar erschauern laesst.*",
        },
    },
    LIFE_TAP = {
        name = "Aderlass",
        gruppe = {
            "Ein wenig Leben gegen ein wenig Macht. Ein fairer Handel.",
            "Blut ist auch nur Mana mit schlechterer Werbung.",
            "Nur ein kleiner Preis. Noch.",
            "*presst zwei Finger gegen den eigenen Puls und zieht sichtbar Kraft aus dem eigenen Koerper.*",
            "*atmet scharf ein, waehrend dunkle Energie aus dem eigenen Lebensfunken gespeist wird.*",
            "*verzieht kurz das Gesicht und laechelt danach, als waere nichts geschehen.*",
        },
    },
    DRAIN_LIFE = {
        name = "Blutsauger",
        ziel = {
            "Eure Kraft wird anderswo dringender gebraucht, %s.",
            "Bleibt ruhig, %s. Das erleichtert die Uebertragung.",
            "Ihr habt davon mehr als genug, %s.",
            "*zieht mit ausgestreckter Hand einen dunklen Strom aus %s heraus.*",
            "*krallt die Finger in die Luft und entreisst %s sichtbar Lebenskraft.*",
        },
    },
    DRAIN_SOUL = {
        name = "Seelendieb",
        ziel = {
            "Bleibt noch einen Augenblick, %s. Etwas fehlt mir noch.",
            "Eure Seele hat einen interessanten Klang, %s.",
            "Nur ein Splitter, %s. Ihr werdet ihn kaum vermissen.",
            "*haelt die Hand ueber %s und zieht einen duennen, unnatuerlichen Schein an sich.*",
            "*murmelt angespannt, waehrend sich etwas Unsichtbares von %s loest.*",
        },
    },
    SOUL_FIRE = {
        name = "Seelenfeuer",
        ziel = {
            "Das hier wird laut, %s.",
            "Eine Seele, Feuer und schlechte Absichten. Mehr braucht es nicht, %s.",
            "Ihr wolltet doch wissen, wie heiss der Nether brennt, %s.",
            "*reisst beide Haende auseinander; zwischen ihnen lodert ein greller Ball aus Seelenfeuer.*",
            "*schleudert eine heulende Masse aus Fel-Feuer auf %s.*",
        },
    },
    HEALTHSTONE = {
        name = "Gesundheitsstein",
        ziel = {
            "Nehmt ihn, %s. Und fragt besser nicht, was darin steckt.",
            "Ein kleiner Vorrat fuer den Notfall, %s.",
            "Falls Ihr sterbt, lag es jedenfalls nicht an mangelnder Vorbereitung, %s.",
            "*drueckt %s einen warmen, unnatuerlich pulsierenden Stein in die Hand.*",
            "*formt einen dunklen Stein und reicht ihn %s mit auffallend unschuldiger Miene.*",
        },
        gruppe = {
            "Ich habe etwas fuer Notfaelle vorbereitet. Es lebt vermutlich nicht.",
            "*laesst einen dunklen Stein zwischen den Fingern kreisen.*",
        },
    },
    SOULSTONE = {
        name = "Seelenstein",
        ziel = {
            "Falls das Schicksal Euch holt, %s, habe ich Einspruch eingelegt.",
            "Behalten wir einen Teil von Euch lieber in Reichweite, %s.",
            "Sterben ist kein Grund, unorganisiert zu sein, %s.",
            "*legt %s einen Seelenstein an die Brust und murmelt eine bindende Formel.*",
            "*haelt den Stein vor %s und zieht fuer einen Moment einen matten Schein hinein.*",
        },
    },
    DEMON_ARMOR = {
        name = "Daemonenruestung",
        gruppe = {
            "Die Haut ist sterblich. Schutz muss es nicht sein.",
            "Ein wenig Daemonenmacht zwischen mir und dem Rest der Welt.",
            "*dunkle Runen ziehen kurz ueber die Haut und versinken wieder.*",
            "*streicht ueber den Unterarm, waehrend sich ein unnatuerlicher Schutzfilm bildet.*",
        },
    },
    FEL_ARMOR = {
        name = "Teufelsruestung",
        gruppe = {
            "Fel ist gefaehrlich. Genau deshalb funktioniert es.",
            "Das sollte halten. Wahrscheinlich.",
            "*laesst gruenliche Funken ueber die Kleidung kriechen, bis sie im Stoff verschwinden.*",
            "*zieht eine Fel-Rune ueber die Brust, die sofort in die Haut sinkt.*",
        },
    },
    SOUL_LINK = {
        name = "Seelenverbindung",
        gruppe = {
            "Geteiltes Leid ist... effizienter.",
            "%p und ich haben eine Vereinbarung. Details sind vertraulich.",
            "*wirft %p einen langen Blick zu, waehrend ein dunkler Faden beide kurz verbindet.*",
            "*legt zwei Finger an die Schlaefe; ein Schattenband spannt sich zu %p.*",
        },
    },
    DARK_PACT = {
        name = "Dunkler Pakt",
        gruppe = {
            "%p schuldet mir ohnehin etwas.",
            "Nur eine kleine Umbuchung von Macht.",
            "*streckt die Hand nach %p aus und zieht einen dunklen Funken an sich.*",
            "*murmelt eine Vertragsformel, waehrend %p sichtbar an Kraft verliert.*",
        },
    },
    SUMMON_IMP = {
        name = "Wichtel beschwoeren",
        gruppe = {
            "Komm heraus. Und diesmal nichts anfassen.",
            "Ein Wichtel. Klein, laut und erstaunlich entflammbar.",
            "*zeichnet einen kleinen Beschwoerungskreis und tippt ungeduldig mit dem Fuss.*",
            "*oeffnet einen flackernden Spalt zum Nether und wartet mit verschraenkten Armen.*",
        },
    },
    SUMMON_VOIDWALKER = {
        name = "Leerwandler beschwoeren",
        gruppe = {
            "Aus der Leere zu mir. Und keine philosophischen Kommentare.",
            "Ich brauche etwas, das Schlaege besser vertraegt als ich.",
            "*zieht einen schweren Kreis aus Schatten in die Luft.*",
            "*spricht einen tiefen Namen; die Umgebung wird fuer einen Augenblick unnatuerlich still.*",
        },
    },
    SUMMON_SUCCUBUS = {
        name = "Sukkubus beschwoeren",
        gruppe = {
            "Wir haben Arbeit. Benehmt Euch. Wenigstens zuerst.",
            "Kommt. Und versucht diesmal, niemanden ohne Auftrag zu verfuehren.",
            "*zeichnet eine elegante, viel zu sorgfaeltige Rune in die Luft.*",
            "*oeffnet mit einer fliessenden Geste einen purpurfarbenen Spalt zum Nether.*",
        },
    },
    SUMMON_FELHUNTER = {
        name = "Teufelsjaeger beschwoeren",
        gruppe = {
            "Such. Aber friss nichts Wichtiges.",
            "Ein guter Teufelsjaeger findet Magie. Ein grossartiger laesst etwas davon uebrig.",
            "*zieht eine gezackte Rune in die Luft und zischt einen kurzen Befehl.*",
            "*oeffnet einen gruenlich flackernden Spalt, aus dem hungriges Knurren dringt.*",
        },
    },
    SUMMON_INFERNAL = {
        name = "Inferno beschwoeren",
        gruppe = {
            "Jetzt wird es unauffaellig.",
            "Deckung waere eine ausgezeichnete Idee.",
            "*reisst beide Arme hoch, waehrend Fel-Feuer den Himmel zu markieren scheint.*",
            "*spricht eine donnernde Beschwoerung, bei der selbst die Luft schwerer wird.*",
        },
    },
    RITUAL_SUMMONING = {
        name = "Ritual der Beschwoerung",
        gruppe = {
            "Stellt Euch an die vorgesehenen Stellen. Und tretet nicht aus Versehen in den Kreis.",
            "Wir holen jemanden hierher. Im Idealfall nur jemanden.",
            "*kniet am Rand des Beschwoerungskreises und prueft jede Rune ein zweites Mal.*",
            "*faehrt mit den Fingern langsam die Linien des Ritualkreises nach.*",
        },
    },
    UNENDING_BREATH = {
        name = "Unendlicher Atem",
        gruppe = {
            "Atmen ist erstaunlich optional.",
            "Die Tiefe darf warten.",
            "*tippt sich an die Kehle; ein kalter Schatten legt sich fuer einen Moment ueber den Atem.*",
        },
    },
    DETECT_INVISIBILITY = {
        name = "Unsichtbarkeit entdecken",
        gruppe = {
            "Verstecken ist nur dann sinnvoll, wenn niemand weiss, wonach er sucht.",
            "Die Schatten verbergen viel. Mir nicht alles.",
            "*kneift die Augen zusammen, waehrend ein dunkler Schimmer ueber die Pupillen zieht.*",
        },
    },
}
