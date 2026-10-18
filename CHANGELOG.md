# Changelog

## 0.3.0 - 2026-10-19

- Neue rassenspezifische Zaubertextpools fuer Gnom, Mensch, Ork, Untote,
  Blutelfen und Trolle in DE, EN und FR.
- Fallback auf allgemeine Hexertexte, falls ein Rassenpool fehlt oder unbrauchbar ist.
- Bestehende Makros, persoenliche Texte und Ambient-Ausgaben unveraendert.

## 0.2.3 - 2026-10-17
- Added `CURSE_RECKLESSNESS` for Fluch der Tollkuehnheit / Curse of Recklessness in deDE, enUS and frFR.
- Includes target-aware dialogue, `/me` actions and target-independent fallback texts.


## 0.2.2
- `DRAIN_LIFE` now has target-independent fallback text pools in deDE, enUS and frFR.
- Prevents “Kein nutzbarer Text fuer DRAIN_LIFE” when no target name can be resolved.

## 0.2.1 - 2026-10-16
- Added `LIFE_FUNNEL` for Lebenslinie / Health Funnel in deDE, enUS and frFR.
- Lebenslinie resolves exclusively against the active demon via `%p`; hostile targets are ignored.
- No RP line is produced for `LIFE_FUNNEL` when no demon is present.

## 0.1.5

## 0.2.0 - 2026-10-14
- Einheitliche Textauswahl und Fallback-Logik fuer Ziel, Gruppe und Daemon.
- Erweiterter DE/EN/FR-Zauber- und Ambient-Textvorrat.

- Expanded SHADOW_BOLT and FEAR text pools, especially in English.
- Added target-independent fallback texts for SHADOW_BOLT, FEAR and DRAIN_SOUL in deDE/enUS/frFR.
- Clarified that Seelendieb uses the internal key DRAIN_SOUL.

# Changelog

Aenderungen an HexerRP werden hier dokumentiert. Fuer undatierte Eintraege
wird kein Datum ergaenzt.

## [0.1.5] - 2026-10-13

### Hinzugefuegt

- Daemonische Ambient-Sprachfragmente in drei Lautstaerken:
  `DEMONIC_WHISPER`, `DEMONIC_SAY` und `DEMONIC_YELL`.
- Gefluesterte Fragmente werden als `/me`-Aktion ausgegeben und benoetigen
  deshalb kein Whisper-Ziel.
- `/say`- und `/yell`-Fragmente erzwingen fuer diese Ambient-Kategorie den
  passenden Kanal unabhaengig vom normalen HexerRP-Kanal.
- `/wrp ambient test demonic` waehlt zufaellig eine daemonische Variante;
  die drei Unterkategorien koennen ebenfalls direkt getestet werden.

### Geaendert

- Die Ambient-Gewichtung enthaelt nun seltene daemonische Sprache; laute
  Ausbrueche per `/yell` bleiben absichtlich sehr selten.
- `SendText` kann optional einen Kanal fuer besondere RP-Ausgaben erzwingen,
  ohne bestehende Zaubertexte zu veraendern.

## [0.1.4] - 2026-10-12

### Geaendert

- Omen der Pein und Fluch der Pein sind getrennte Textschluessel.
- `OMEN_AGONY` beschreibt den Einzelziel-Schaden-ueber-Zeit-Effekt.
- `CURSE_AGONY` ist als zielunabhaengiger Flaechenfluch ausgelegt.
- Deutsche, englische und franzoesische Texte ergaenzt.

## [0.1.3]

### Hinzugefuegt

- Fluch der Schwaeche (`CURSE_WEAKNESS`) mit deutschen, englischen und
  franzoesischen Texten, sowohl zielbezogen als auch zielunabhaengig.
- Zusaetzliche zielunabhaengige Texte fuer `IMMOLATE` und `CORRUPTION` in
  allen drei Sprachen.

### Geaendert

- Unbrauchbare persoenliche Textpools fallen auf die normalen Locale-Texte
  zurueck.

## [0.1.2]

### Geaendert

- Der Ambient-Timer sendet keine geschuetzten Chatnachrichten selbststaendig.
- Faellige Ambient-Texte werden vorgemerkt und bei einem
  spielerausgeloesten `/wrp`-Textaufruf ausgegeben.
- Verhindert den Clientfehler durch automatisches `SendChatMessage` aus
  einem Addon-Timer.

## [0.1.0]

### Hinzugefuegt

- Erste Fassung mit deutschen, englischen und franzoesischen Texten,
  Zauber-RP, Daemonenplatzhaltern und Ambient-System.
