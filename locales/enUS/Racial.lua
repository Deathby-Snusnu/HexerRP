-- SPDX-License-Identifier: CC-BY-SA-4.0
-- Copyright (c) 2026 Hannes Weichselbaum
-- Racial warlock RP text variants; other spells use general Texts.lua pools.

local _, addon = ...

addon.localeData.enUS.racial = {
    Gnome = {
        SHADOW_BOLT = {
            ziel = { "The apparatus is calibrated, %s. Commencing shadow bolt.", "*adjusts a tiny rune and hurls a shadow bolt at %s.*" },
            gruppe = { "*recalibrates the runes for the next experiment.*" },
        },
        CORRUPTION = {
            ziel = { "Your decay curve looks promising, %s.", "*mentally records a formula while corrupting %s.*" },
            gruppe = { "*recalibrates the runes for the next experiment.*" },
        },
        IMMOLATE = {
            ziel = { "Initiating the thermal reaction, %s.", "*flicks a green spark towards %s.*" },
            gruppe = { "*recalibrates the runes for the next experiment.*" },
        },
        FEAR = {
            ziel = { "A practical demonstration of irrational panic, %s!", "*taps a rune-etched instrument and points at %s.*" },
            gruppe = { "*recalibrates the runes for the next experiment.*" },
        },
        DRAIN_LIFE = {
            ziel = { "Life-energy transfer from %s to me. Excellent!", "*studies the dark energy flowing from %s into one hand.*" },
            gruppe = { "*recalibrates the runes for the next experiment.*" },
        },
        CURSE_RECKLESSNESS = {
            ziel = { "Courage is useful, %s. Recklessness yields better experimental data.", "*sketches a tiny curse sigil towards %s.*" },
            gruppe = { "*recalibrates the runes for the next experiment.*" },
        },
    },
    Human = {
        SHADOW_BOLT = {
            ziel = { "The shadows shall judge you, %s.", "*points steadily at %s and summons darkness.*" },
            gruppe = { "*recites a dark formula in a steady voice.*" },
        },
        CORRUPTION = {
            ziel = { "Your strength will wither, %s.", "*quietly places an ancient curse of corruption on %s.*" },
            gruppe = { "*recites a dark formula in a steady voice.*" },
        },
    },
    Orc = {
        SHADOW_BOLT = {
            ziel = { "Power of the Nether! Crush %s!", "*hurls shadow at %s with a harsh battle cry.*" },
            gruppe = { "*clenches a fist and calls the shadows.*" },
        },
        CORRUPTION = {
            ziel = { "Wither, %s. Slowly.", "*clenches a fist and curses %s.*" },
            gruppe = { "*clenches a fist and calls the shadows.*" },
        },
    },
    Scourge = {
        SHADOW_BOLT = {
            ziel = { "Death and I are acquainted, %s. Now meet the shadows.", "*raises a bony hand and casts darkness at %s.*" },
            gruppe = { "*extends a bony hand into the darkness.*" },
        },
        CORRUPTION = {
            ziel = { "Your flesh will decay too, %s.", "*draws a cold curse sign before %s.*" },
            gruppe = { "*extends a bony hand into the darkness.*" },
        },
    },
    BloodElf = {
        SHADOW_BOLT = {
            ziel = { "Even darkness can be elegant, %s.", "*shapes a flawless shadow rune and aims it at %s.*" },
            gruppe = { "*traces a flawless rune in the air.*" },
        },
        CORRUPTION = {
            ziel = { "Your strength now serves a finer art, %s.", "*traces an elegant corruption sigil before %s.*" },
            gruppe = { "*traces a flawless rune in the air.*" },
        },
    },
    Troll = {
        SHADOW_BOLT = {
            ziel = { "The shadows are hungry for you, %s.", "*makes a quick, threatening gesture towards %s.*" },
            gruppe = { "*laughs hoarsely and speaks a curse.*" },
        },
        CORRUPTION = {
            ziel = { "A long, nasty curse for you, %s.", "*grins and traces a curse mark before %s.*" },
            gruppe = { "*laughs hoarsely and speaks a curse.*" },
        },
    },
}
