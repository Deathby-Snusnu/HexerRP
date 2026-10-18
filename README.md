# Hexer RP

## Beschreibung

Eigenstaendiges Rollenspiel-Addon fuer Hexenmeister. Es stellt zufaellige
Zaubertexte in Deutsch, Englisch und Franzoesisch sowie ein optionales,
seltenes Ambient-RP bereit. RP-Texte werden auf manuellen Aufruf ausgegeben;
der Ambient-Timer sendet keine Chatnachrichten selbststaendig.

Nur Hexenmeister koennen RP-Texte senden. Andere Klassen koennen Einstellungen
einsehen und aendern. Das Addon benoetigt kein anderes Addon.

## Installation

Den Ordner `HexerRP` in das `Interface\AddOns`-Verzeichnis des WoW-Clients
kopieren. Danach muss `AddOns\HexerRP\HexerRP.toc` vorhanden sein. Das Addon
in der Charakterauswahl aktivieren und mit einem Hexenmeister einloggen.

## Schnellstart

```text
/wrp help
/wrp list
/wrp status
/wrp immolate
/wrp language enUS
```

`/hexerrp` ist ein Alias fuer `/wrp`. Standardmaessig betraegt die Textchance
35 Prozent, der Cooldown 18 Sekunden und der Sprachkanal SAY. Die
RP-Ausgabesprache ist standardmaessig Deutsch. Der erste Text ist sofort
moeglich.

## Befehle

| Befehl | Funktion |
| --- | --- |
| `/wrp` oder `/wrp help` | Hilfe anzeigen |
| `/wrp list` | Verfuegbare Textschluessel auflisten |
| `/wrp <schluessel>` | RP-Text versuchen |
| `/wrp status` | Einstellungen und Ambient-Status anzeigen |
| `/wrp chance <0-100>` | Textchance als ganze Zahl setzen |
| `/wrp cooldown <0-3600>` | Cooldown in Sekunden als ganze Zahl setzen |
| `/wrp channel <kanal>` | Sprachkanal setzen |
| `/wrp language <deDE\|enUS\|frFR>` | RP-Ausgabesprache setzen |
| `/wrp ambient on\|off` | Ambient-RP ein- oder ausschalten |
| `/wrp ambient test [murmur\|disturbed\|outburst\|demonic]` | Ambient-Text sofort testen |
| `/wrp ambient chance <0-100>` | Ambient-Ausloesewahrscheinlichkeit setzen |
| `/wrp ambient interval <MIN> <MAX>` | Intervall in Sekunden setzen |
| `/wrp ambient combat on\|off` | Ambient-Ausgabe im Kampf erlauben oder sperren |

Sprachkanaele sind `AUTO`, `SAY`, `YELL`, `EMOTE`, `PARTY`, `RAID` und
`INSTANCE_CHAT`. `AUTO` waehlt Instanzgruppe, Schlachtzug, Gruppe oder SAY
in dieser Reihenfolge. Ein nicht verfuegbarer expliziter Gruppenkanal wird
nicht auf einen oeffentlichen Kanal umgeleitet.

Befehle und Textschluessel werden ohne Beachtung der Gross-/Kleinschreibung
verarbeitet. `/wrp status` zeigt die gespeicherten Kanal- und
Spracheinstellungen an. Die Werte muessen innerhalb der oben genannten
Bereiche liegen.

## Texte und Platzhalter

Die RP-Ausgabesprache kann pro Charakter auf `deDE`, `enUS` oder `frFR`
gesetzt werden. Fehlt ein Textpool in der gewaehlten Sprache, wird der
deutsche Pool verwendet.

`%s` steht fuer ein passendes aktuelles Ziel und `%p` fuer den aktuellen
Daemonenbegleiter. Selbstzauber verwenden kein Ziel; bei Heilstein und
Seelenstein wird ein freundliches Ziel verwendet, sonst der eigene Charakter.
Texte in `*Sternchen*` werden ohne die Markierung als `/me`-Emote ausgegeben.

Eigene Textpools koennen pro Charakter unter
`HexerRP_CharacterDB.personalTexts["SCHLUESSEL"]` abgelegt werden. Ein eigener
Pool wird verwendet, wenn er einen nutzbaren Text enthaelt; andernfalls folgt
die Auswahl dem Sprachpool und dem deutschen Fallback.

Gesendete Texte muessen maximal 255 Bytes lang sein und duerfen keine
Zeilenumbrueche oder `|`-Chatmarkierungen enthalten.

## Ambient-RP

Ambient-RP ist standardmaessig aktiviert. Ein zufaelliges Intervall plant
einen Text aus `MURMUR`, `DISTURBED`, `OUTBURST` oder einer seltenen
daemonischen Kategorie vor. Daemonische Fragmente erscheinen entweder in
`/say`, sehr selten in `/yell` oder als `/me`-Gefluester. Echtes `/whisper`
wird fuer Ambient absichtlich nicht verwendet. Die Nachricht
wird erst beim naechsten spielerausgeloesten RP-Textbefehl
(`/wrp <schluessel>`) gesendet. Dadurch versucht der Timer keine geschuetzte
Chataktion im Hintergrund. `/wrp ambient test` sendet einen Testtext direkt
auf ausdruecklichen Spielerbefehl.

Standardwerte: 70 Prozent Ambient-Chance, 180 bis 420 Sekunden Intervall und
keine Ambient-Ausgabe im Kampf. Das Intervall kann zwischen mindestens
30 Sekunden und maximal 7200 Sekunden eingestellt werden; die obere Grenze
muss mindestens der unteren entsprechen.

## Einstellungen

Die Vorgaben stehen in [config/Settings.lua](config/Settings.lua). Einstellungen
und eigene Texte werden pro Charakter in `HexerRP_CharacterDB` gespeichert.
Ungueltige gespeicherte Werte werden mit einer Meldung repariert; gueltige
Werte bleiben erhalten.

| Einstellung | Standard | Gueltige Werte |
| --- | --- | --- |
| `outputLanguage` | `deDE` | `deDE`, `enUS`, `frFR` |
| `textChance` | `35` | Ganze Zahl 0-100 |
| `cooldown` | `18` | Ganze Zahl 0-3600 Sekunden |
| `chatChannel` | `SAY` | `AUTO`, `SAY`, `YELL`, `EMOTE`, `PARTY`, `RAID`, `INSTANCE_CHAT` |
| `ambientEnabled` | `true` | `true` oder `false` |
| `ambientChance` | `70` | Ganze Zahl 0-100 |
| `ambientMinInterval` | `180` | Ganze Zahl 30-3600 Sekunden |
| `ambientMaxInterval` | `420` | Ganze Zahl 30-7200 Sekunden, mindestens der Minimalwert |
| `ambientInCombat` | `false` | `true` oder `false` |

Ein Cooldown beginnt nach einem erfolgreichen Chat-API-Aufruf. Die
serverseitige Zustellung kann das Addon nicht bestaetigen.

## Projektstruktur

- [HexerRP.toc](HexerRP.toc): Metadaten und Lade-Reihenfolge.
- [HexerRP.lua](HexerRP.lua): Login, Hexenmeisterpruefung und `HexerRP.TryText`.
- [config/Settings.lua](config/Settings.lua): Standardwerte.
- `locales/`: Sprachinitialisierung und deutsche, englische sowie franzoesische Texte.
- `core/Database.lua`: Charakterdaten und Validierung.
- `core/Text.lua`: Textauswahl, Ziel- und Daemonenplatzhalter.
- `core/Chat.lua`: Sprachkanaele und sichere Chat-Ausgabe.
- `core/Cooldown.lua`: Cooldown-Verwaltung.
- `core/Ambient.lua`: Timer, Vormerkung und spielerausgeloeste Ambient-Ausgabe.
- `core/Commands.lua`: `/wrp`-Befehle.

## Kompatibilitaet

Die TOC deklariert Interface `16001` und Version `0.2.2`; dies ist keine
Zusicherung fuer andere WoW-Clientversionen. Fuer Chat-Ausgaben wird
`C_ChatInfo.SendChatMessage` vorausgesetzt. Ein Client ohne diese API wird
mit einer Meldung abgewiesen.

Die Kompatibilitaet mit anderen Clientversionen ist nicht festgelegt.

## Tests

Die AddOn-Regressionstests liegen im Quellprojekt unter
`tests/test_addon.lua`. Zusammen mit den
Integrationstests koennen sie aus dem AddOns-Verzeichnis mit
`.\Test-AddOns.ps1` und einem lokalen Lua-Interpreter ausgefuehrt werden.
Ein Ingame-Test im WoW-Client bleibt erforderlich.

## Lizenz

Dieses AddOn verwendet eine **geteilte Lizenzierung nach Dateityp**:

- Programmcode: **Mozilla Public License 2.0 (MPL-2.0)**, siehe [LICENSE](./LICENSE).
- RP-Dialoge, Emote-/Ambient-Texte und Übersetzungen: **CC BY-SA 4.0**, siehe [LICENSE-TEXTS](./LICENSE-TEXTS).
- Die verbindliche Zuordnung einer Lua-Datei steht in ihrem `SPDX-License-Identifier`.

Weitere Hinweise und der Markenhinweis stehen in [NOTICE](./NOTICE).


## Wichtige Textschluessel

- `SHADOW_BOLT` - Schattenblitz / Shadow Bolt
- `FEAR` - Furcht / Fear
- `CURSE_RECKLESSNESS` - Fluch der Tollkuehnheit / Curse of Recklessness
- `DRAIN_SOUL` - Seelendieb / Drain Soul
- `LIFE_FUNNEL` - Lebenslinie / Health Funnel
