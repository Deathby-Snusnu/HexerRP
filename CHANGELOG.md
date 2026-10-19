# Changelog

Aenderungen an HexerRP. Fuer undatierte Eintraege wird kein Datum ergaenzt;
eine unklare Versionszuordnung bleibt ausdruecklich offen.

## [Unreleased]

### Dokumentation

- Rassen-/Sprach-Fallback, Daemonenanforderung fuer LIFE_FUNNEL, Makros,
  Moduluebersicht und gemeinsame Anleitungen praezisiert.
- Historie sprachlich und strukturell vereinheitlicht, ohne Releases zu erfinden.

## [0.3.0] - 2026-10-19

### Hinzugefuegt

- Neue rassenspezifische Zaubertextpools fuer Gnom, Mensch, Ork, Untote,
  Blutelfen und Trolle in DE, EN und FR.
- Fallback auf allgemeine Hexertexte, falls ein Rassenpool fehlt oder unbrauchbar ist.
- Bestehende Makros, persoenliche Texte und Ambient-Ausgaben unveraendert.

## [0.2.3] - 2026-10-17

### Hinzugefuegt

- `CURSE_RECKLESSNESS` fuer Fluch der Tollkuehnheit in deDE, enUS und frFR.
- Zielbezogene Dialoge, `/me`-Handlungen und zielunabhaengige Ausweichtexte.

## [0.2.2]

### Behoben

- `DRAIN_LIFE` hat zielunabhaengige Ausweichtexte in deDE, enUS und frFR.
- Verhindert fehlende nutzbare Texte, wenn kein Zielname aufgeloest werden kann.

## [0.2.1] - 2026-10-16

### Hinzugefuegt

- `LIFE_FUNNEL` fuer Lebenslinie in deDE, enUS und frFR.
- Lebenslinie verwendet ausschliesslich den aktiven Daemonen ueber `%p`;
  feindliche Ziele werden ignoriert. Ohne Daemon wird kein RP-Text erzeugt.

## [0.2.0] - 2026-10-14

### Geaendert

- Einheitliche Textauswahl und Fallback-Logik fuer Ziel, Gruppe und Daemon.
- Erweiterter DE/EN/FR-Zauber- und Ambient-Textvorrat.

## Nicht eindeutig zugeordnete Bestandseintraege

Der bisherige Abschnitt enthielt eine zusaetzliche leere Ueberschrift
`0.1.5` vor `0.2.0`. Die folgenden Punkte werden ohne gesicherte
Release-Zuordnung erhalten:

- SHADOW_BOLT- und FEAR-Pools erweitert, besonders auf Englisch.
- Zielunabhaengige Ausweichtexte fuer SHADOW_BOLT, FEAR und DRAIN_SOUL in
  deDE, enUS und frFR ergaenzt.
- Klarstellung: Seelendieb verwendet den internen Schluessel DRAIN_SOUL.

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
