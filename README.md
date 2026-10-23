# Hexer RP

## Beschreibung

Eigenständiges Rollenspiel-Addon für Hexenmeister. Es stellt zufällige
Zaubertexte in Deutsch, Englisch und Französisch sowie ein optionales,
seltenes Ambient-RP bereit. RP-Texte werden auf manuellen Aufruf ausgegeben;
der Ambient-Timer sendet keine Chatnachrichten selbstständig.

Nur Hexenmeister können RP-Texte senden. Andere Klassen können Einstellungen
einsehen und ändern. Das Add-on benötigt kein anderes Add-on.

## Dokumentation

[Sammlungsübersicht](../../README.md) · [Changelog](CHANGELOG.md) ·
[Texteditor und Handbuch](../../docs/RPTextStudio/HANDBUCH.md) ·
[Verpackung und gemeinsame Tests](../../docs/VERPACKUNG.md)

## Installation

Den Ordner `HexerRP` in das `Interface\AddOns`-Verzeichnis des WoW-Clients
kopieren. Danach muss `AddOns\HexerRP\HexerRP.toc` vorhanden sein. Das Add-on
in der Charakterauswahl aktivieren und mit einem Hexenmeister einloggen.

## Schnellstart

```text
/wrp help
/wrp list
/wrp status
/wrp immolate
/wrp language enUS
```

`/hexerrp` ist ein Alias für `/wrp`. Standardmäßig beträgt die Textchance
35 Prozent, der Cooldown 18 Sekunden und der Sprachkanal SAY. Die
RP-Ausgabesprache ist standardmäßig Deutsch. Der erste Text ist sofort
möglich.

## Befehle

| Befehl | Funktion |
| --- | --- |
| `/wrp` oder `/wrp help` | Hilfe anzeigen |
| `/wrp list` | Verfügbare Textschlüssel auflisten |
| `/wrp <schluessel>` | RP-Text versuchen |
| `/wrp status` | Einstellungen und Ambient-Status anzeigen |
| `/wrp chance <0-100>` | Textchance als ganze Zahl setzen |
| `/wrp cooldown <0-3600>` | Cooldown in Sekunden als ganze Zahl setzen |
| `/wrp channel <kanal>` | Sprachkanal setzen |
| `/wrp language <deDE\|enUS\|frFR>` | RP-Ausgabesprache setzen |
| `/wrp ambient on\|off` | Ambient-RP ein- oder ausschalten |
| `/wrp ambient test [murmur\|disturbed\|outburst\|demonic]` | Ambient-Text sofort testen |
| `/wrp ambient chance <0-100>` | Ambient-Auslösewahrscheinlichkeit setzen |
| `/wrp ambient interval <MIN> <MAX>` | Intervall in Sekunden setzen |
| `/wrp ambient combat on\|off` | Ambient-Ausgabe im Kampf erlauben oder sperren |

Sprachkanäle sind `AUTO`, `SAY`, `YELL`, `EMOTE`, `PARTY`, `RAID` und
`INSTANCE_CHAT`. `AUTO` wählt Instanzgruppe, Schlachtzug, Gruppe oder SAY
in dieser Reihenfolge. Ein nicht verfügbarer expliziter Gruppenkanal wird
nicht auf einen öffentlichen Kanal umgeleitet.

Befehle und Textschlüssel werden ohne Beachtung der Groß-/Kleinschreibung
verarbeitet. `/wrp status` zeigt die gespeicherten Kanal- und
Spracheinstellungen an. Die Werte müssen innerhalb der oben genannten
Bereiche liegen.

## Rassenspezifische Hexertexte (ab 0.3.0)

HexerRP erkennt den Rassentoken des eigenen Charakters über `UnitRace`.
In `locales/{deDE,enUS,frFR}/Racial.lua` stehen eigene Stimmen für
`Gnome`, `Human`, `Orc`, `Scourge` (Untote), `BloodElf` und `Troll`.
Weitere Rassen und nicht überschriebene Zauber verwenden unverändert
allgemeine Hexertexte. Die Rassenschicht ist absichtlich erweiterbar.

Priorität: persönliche Texte -> Rassentexte in der Ausgabesprache ->
allgemeine Texte in der Ausgabesprache -> deutsche Rassentexte ->
deutsche allgemeine Texte. Wenn ein Pool aktuell nicht nutzbar ist,
wird die nächste Stufe versucht. Rassenspezifisch gestaltete Texte
stehen nur für die jeweils definierten Schlüssel bereit; für den Rest greift
der bisherige allgemeine Vorrat. `/wrp language` wechselt auch die
Sprache der Rassentexte, nicht die im Spiel gesprochene Volkssprache.

## Texte und Platzhalter

Die RP-Ausgabesprache kann pro Charakter auf `deDE`, `enUS` oder `frFR`
gesetzt werden. Fehlt ein Textpool in der gewählten Sprache, wird der
deutsche Pool verwendet.

`%s` steht für ein passendes aktuelles Ziel und `%p` für den aktuellen
Dämonenbegleiter. Selbstzauber verwenden kein Ziel; bei Heilstein und
Seelenstein wird ein freundliches Ziel verwendet, sonst der eigene Charakter.
Texte in `*Sternchen*` werden ohne die Markierung als `/me`-Emote ausgegeben.

Eigene Textpools können pro Charakter unter
`HexerRP_CharacterDB.personalTexts["SCHLUESSEL"]` abgelegt werden. Ein eigener
Pool wird verwendet, wenn er einen nutzbaren Text enthält; andernfalls folgt
die Auswahl den oben beschriebenen Rassen-/Sprachpools und dem deutschen
Fallback. Anders als bei den anderen Klassen-AddOns wird auch ein vorhandener,
aber unbrauchbarer Rassen-/Locale-Pool übersprungen.

Mit aufgelöstem Zielnamen wird in strukturierten Pools zuerst `ziel`, dann
`gruppe` versucht; anschließend sind auch zielunabhängige Texte aus `ziel`
möglich. Einträge mit `%s` oder `%p` werden nur ausgewählt, wenn der
jeweilige Name verfügbar ist. `LIFE_FUNNEL` verwendet ausschließlich den
Dämonen und liefert ohne aktiven Begleiter keinen Text.

Gesendete Texte müssen maximal 255 Bytes lang sein und dürfen keine
Zeilenumbrüche oder `|`-Chatmarkierungen enthalten.

## Ambient-RP

Ambient-RP ist standardmäßig aktiviert. Ein zufälliges Intervall plant
einen Text aus `MURMUR`, `DISTURBED`, `OUTBURST` oder einer seltenen
dämonischen Kategorie vor. Dämonische Fragmente erscheinen entweder in
`/say`, sehr selten in `/yell` oder als `/me`-Geflüster. Echtes `/whisper`
wird für Ambient absichtlich nicht verwendet. Die Nachricht
wird erst beim nächsten spielerausgelösten RP-Textbefehl
(`/wrp <schluessel>`) gesendet. Dadurch versucht der Timer keine geschützte
Chataktion im Hintergrund. `/wrp ambient test` sendet einen Testtext direkt
auf ausdrücklichen Spielerbefehl.

Standardwerte: 70 Prozent Ambient-Chance, 180 bis 420 Sekunden Intervall und
keine Ambient-Ausgabe im Kampf. Das Intervall kann zwischen mindestens
30 Sekunden und maximal 7200 Sekunden eingestellt werden; die obere Grenze
muss mindestens der unteren entsprechen.

## Einstellungen

Die Vorgaben stehen in [config/Settings.lua](config/Settings.lua). Einstellungen
und eigene Texte werden pro Charakter in `HexerRP_CharacterDB` gespeichert.
Ungültige gespeicherte Werte werden mit einer Meldung repariert; gültige
Werte bleiben erhalten.

| Einstellung | Standard | Gültige Werte |
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
serverseitige Zustellung kann das Add-on nicht bestätigen.

## Projektstruktur

- [HexerRP.toc](HexerRP.toc): Metadaten und Ladereihenfolge.
- [HexerRP.lua](HexerRP.lua): Login, Hexenmeisterprüfung und `HexerRP.TryText`.
- [config/Settings.lua](config/Settings.lua): Standardwerte.
- `locales/`: Sprachinitialisierung und deutsche, englische sowie französische
  Texte.
- `core/Database.lua`: Charakterdaten und Validierung.
- `core/Text.lua`: Textauswahl, Ziel- und Dämonenplatzhalter.
- `core/Chat.lua`: Sprachkanäle und sichere Chat-Ausgabe.
- `core/Cooldown.lua`: Cooldown-Verwaltung.
- `core/Ambient.lua`: Timer, Vormerkung und spielerausgelöste Ambient-Ausgabe.
- `core/Commands.lua`: `/wrp`-Befehle.
- `locales/<locale>/Expansion.lua`: zusätzliche geladene Textbestände;
  RP Text Studio bearbeitet diese Dateien nicht.

Die internen Kernfunktionen heißen `BuildText`, `SendText`,
`CooldownReady` und `StartCooldown`. Nach dem Login ist
`HexerRP.TryText("SHADOW_BOLT")` die öffentliche manuelle Schnittstelle.
`TryText(key)` erwartet einen nicht leeren String, normalisiert ihn auf
Großbuchstaben und liefert `true` nach einem erfolgreichen Chat-API-Aufruf,
sonst `false`. Ein vorgemerkter Ambient-Text kann dabei anstelle des
angeforderten Zaubertexts gesendet werden. Vor `PLAYER_LOGIN` wird der Aufruf
mit einer Meldung abgelehnt.

Ein Makro kann Zauber und RP-Aufruf verbinden:

```text
#showtooltip Schattenblitz
/cast Schattenblitz
/wrp shadow_bolt
```

Zaubernamen an die Sprache des Clients anpassen. Ein RP-Text belegt weder
einen erfolgreichen Zauber noch einen Treffer.

## Kompatibilität

Die TOC deklariert Interface `16001` und Version `0.3.0`; dies ist keine
Zusicherung für andere WoW-Clientversionen. Für Chat-Ausgaben wird
`C_ChatInfo.SendChatMessage` vorausgesetzt. Ein Client ohne diese API wird
mit einer Meldung abgewiesen.

Die Kompatibilität mit anderen Clientversionen ist nicht festgelegt.

## Tests

Die AddOn-Regressionstests liegen im Quellprojekt unter
`tests/test_addon.lua`. Zusammen mit den
Integrationstests können sie aus dem AddOns-Verzeichnis mit
`.\Test-AddOns.ps1` und einem lokalen Lua-Interpreter ausgeführt werden.
Ein Ingame-Test im WoW-Client bleibt erforderlich.

## Lizenz

Dieses AddOn verwendet eine **geteilte Lizenzierung nach Dateityp**:

- Programmcode: **Mozilla Public License 2.0 (MPL-2.0)**, siehe
  [LICENSE](./LICENSE).
- RP-Dialoge, Emote-/Ambient-Texte und Übersetzungen: **CC BY-SA 4.0**, siehe
  [LICENSE-TEXTS](./LICENSE-TEXTS).
- Die verbindliche Zuordnung einer Lua-Datei steht in ihrem
  `SPDX-License-Identifier`.

Weitere Hinweise und der Markenhinweis stehen in [NOTICE](./NOTICE).

## Wichtige Textschlüssel

- `SHADOW_BOLT` - Schattenblitz / Shadow Bolt
- `FEAR` - Furcht / Fear
- `CURSE_RECKLESSNESS` - Fluch der Tollkühnheit / Curse of Recklessness
- `DRAIN_SOUL` - Seelendieb / Drain Soul
- `LIFE_FUNNEL` - Lebenslinie / Health Funnel
