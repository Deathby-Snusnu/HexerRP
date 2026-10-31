# Changelog

Änderungen an HexerRP. Für undatierte Einträge wird kein Datum ergänzt;
eine unklare Versionszuordnung bleibt ausdrücklich offen.

## Aktueller Quellstand: 0.4.1 (unveröffentlicht)

- Versionsangabe aktualisiert und gemeinsame Dokumentationslinks für
  einzelne AddOn-Checkouts erläutert.

## [0.4.0] - 2026-10-26

### Dokumentation

- Rassen-/Sprach-Fallback, Dämonenanforderung für LIFE_FUNNEL, Makros,
  Modulübersicht und gemeinsame Anleitungen präzisiert.
- Historie sprachlich und strukturell vereinheitlicht, ohne Releases zu erfinden.

### Hinzugefügt

- Dynamische Schluessellisten mit `/wrp list`, `/wrp list racial` und
  `/wrp list all` ergaenzt.

## [0.3.0] - 2026-10-19

### Hinzugefügt

- Neue rassenspezifische Zaubertextpools für Gnom, Mensch, Ork, Untote,
  Blutelfen und Trolle in DE, EN und FR.
- Fallback auf allgemeine Hexertexte, falls ein Rassenpool fehlt oder unbrauchbar ist.
- Bestehende Makros, persönliche Texte und Ambient-Ausgaben unverändert.

## [0.2.3] - 2026-10-17

### Hinzugefügt

- `CURSE_RECKLESSNESS` für Fluch der Tollkühnheit in deDE, enUS und frFR.
- Zielbezogene Dialoge, `/me`-Handlungen und zielunabhängige Ausweichtexte.

## [0.2.2]

### Behoben

- `DRAIN_LIFE` hat zielunabhängige Ausweichtexte in deDE, enUS und frFR.
- Verhindert fehlende nutzbare Texte, wenn kein Zielname aufgelöst werden kann.

## [0.2.1] - 2026-10-16

### Hinzugefügt

- `LIFE_FUNNEL` für Lebenslinie in deDE, enUS und frFR.
- Lebenslinie verwendet ausschließlich den aktiven Dämonen über `%p`;
  feindliche Ziele werden ignoriert. Ohne Dämon wird kein RP-Text erzeugt.

## [0.2.0] - 2026-10-14

### Geändert

- Einheitliche Textauswahl und Fallback-Logik für Ziel, Gruppe und Dämon.
- Erweiterter DE/EN/FR-Zauber- und Ambient-Textvorrat.

## Nicht eindeutig zugeordnete Bestandseinträge

Der bisherige Abschnitt enthielt eine zusätzliche leere Überschrift
`0.1.5` vor `0.2.0`. Die folgenden Punkte werden ohne gesicherte
Release-Zuordnung erhalten:

- SHADOW_BOLT- und FEAR-Pools erweitert, besonders auf Englisch.
- Zielunabhängige Ausweichtexte für SHADOW_BOLT, FEAR und DRAIN_SOUL in
  deDE, enUS und frFR ergänzt.
- Klarstellung: Seelendieb verwendet den internen Schlüssel DRAIN_SOUL.

## [0.1.5] - 2026-10-13

### Hinzugefügt

- Dämonische Ambient-Sprachfragmente in drei Lautstärken:
  `DEMONIC_WHISPER`, `DEMONIC_SAY` und `DEMONIC_YELL`.
- Geflüsterte Fragmente werden als `/me`-Aktion ausgegeben und benötigen
  deshalb kein Whisper-Ziel.
- `/say`- und `/yell`-Fragmente erzwingen für diese Ambient-Kategorie den
  passenden Kanal unabhängig vom normalen HexerRP-Kanal.
- `/wrp ambient test demonic` wählt zufällig eine dämonische Variante;
  die drei Unterkategorien können ebenfalls direkt getestet werden.

### Geändert

- Die Ambient-Gewichtung enthält nun seltene dämonische Sprache; laute
  Ausbrüche per `/yell` bleiben absichtlich sehr selten.
- `SendText` kann optional einen Kanal für besondere RP-Ausgaben erzwingen,
  ohne bestehende Zaubertexte zu verändern.

## [0.1.4] - 2026-10-12

### Geändert

- Omen der Pein und Fluch der Pein sind getrennte Textschlüssel.
- `OMEN_AGONY` beschreibt den Einzelziel-Schaden-über-Zeit-Effekt.
- `CURSE_AGONY` ist als zielunabhängiger Flächenfluch ausgelegt.
- Deutsche, englische und französische Texte ergänzt.

## [0.1.3]

### Hinzugefügt

- Fluch der Schwäche (`CURSE_WEAKNESS`) mit deutschen, englischen und
  französischen Texten, sowohl zielbezogen als auch zielunabhängig.
- Zusätzliche zielunabhängige Texte für `IMMOLATE` und `CORRUPTION` in
  allen drei Sprachen.

### Geändert

- Unbrauchbare persönliche Textpools fallen auf die normalen Locale-Texte
  zurück.

## [0.1.2]

### Geändert

- Der Ambient-Timer sendet keine geschützten Chatnachrichten selbstständig.
- Fällige Ambient-Texte werden vorgemerkt und bei einem
  spielerausgelösten `/wrp`-Textaufruf ausgegeben.
- Verhindert den Clientfehler durch automatisches `SendChatMessage` aus
  einem Add-on-Timer.

## [0.1.0]

### Hinzugefügt

- Erste Fassung mit deutschen, englischen und französischen Texten,
  Zauber-RP, Dämonenplatzhaltern und Ambient-System.
