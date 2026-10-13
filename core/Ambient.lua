-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

local nextAmbientAt
local pendingAmbientCategory
local ticker = CreateFrame("Frame")
local elapsed = 0

local function ScheduleNext()
    if not addon.db then return end
    local lo = math.max(30, addon.db.ambientMinInterval or 180)
    local hi = math.max(lo, addon.db.ambientMaxInterval or 420)
    nextAmbientAt = GetTime() + math.random(lo, hi)
end

-- Normales Ambient bleibt der Hauptanteil. Daemonische Sprachfragmente
-- sind bewusst seltener; lautes YELL ist dabei am seltensten.
local function WeightedCategory()
    local roll = math.random(100)
    if roll <= 50 then return "MURMUR" end
    if roll <= 74 then return "DISTURBED" end
    if roll <= 82 then return "OUTBURST" end
    if roll <= 91 then return "DEMONIC_WHISPER" end
    if roll <= 98 then return "DEMONIC_SAY" end
    return "DEMONIC_YELL"
end

local function RandomDemonicCategory()
    local roll = math.random(100)
    if roll <= 50 then return "DEMONIC_WHISPER" end
    if roll <= 88 then return "DEMONIC_SAY" end
    return "DEMONIC_YELL"
end

local function ForcedChannel(category)
    if category == "DEMONIC_SAY" then return "SAY" end
    if category == "DEMONIC_YELL" then return "YELL" end
    -- DEMONIC_WHISPER is stored as *...* and therefore becomes /me.
    return nil
end

function addon.BuildAmbient(category)
    local lang = addon.GetOutputLanguage()
    local pool = addon.GetLocalePoolExact(lang, "ambient", category)
        or addon.GetLocalePoolExact("deDE", "ambient", category)
    return addon.ChooseText(pool, nil, addon.GetDemonName())
end

local function SendAmbient(category)
    local text = addon.BuildAmbient(category)
    if not text then return false end
    return addon.SendText(text, ForcedChannel(category))
end

-- Public chat output is protected on this client and must originate from a
-- real player action. The timer therefore only queues an ambient line.
function addon.QueueAmbient(category)
    if not addon.ready or not addon.isWarlock or not addon.db or not addon.db.ambientEnabled then
        return false
    end
    if not addon.db.ambientInCombat and UnitAffectingCombat("player") then
        return false
    end
    if math.random(100) > addon.db.ambientChance then
        return false
    end
    pendingAmbientCategory = category or WeightedCategory()
    return true
end

function addon.HasPendingAmbient()
    return pendingAmbientCategory ~= nil
end

-- Call this only from a slash command / macro path triggered by the player.
function addon.FlushPendingAmbient()
    if not pendingAmbientCategory then return false end
    if not addon.db.ambientInCombat and UnitAffectingCombat("player") then
        return false
    end
    local category = pendingAmbientCategory
    if SendAmbient(category) then
        pendingAmbientCategory = nil
        addon.StartCooldown()
        return true
    end
    pendingAmbientCategory = nil
    return false
end

-- Explicit tests are typed/clicked by the player, so immediate output is safe.
function addon.TryAmbient(category, force)
    if not addon.ready or not addon.isWarlock then return false end
    if category == "DEMONIC" then
        category = RandomDemonicCategory()
    end
    if force then
        category = category or WeightedCategory()
        if SendAmbient(category) then
            addon.StartCooldown()
            return true
        end
        return false
    end
    return addon.QueueAmbient(category)
end

function addon.ResetAmbientTimer()
    pendingAmbientCategory = nil
    ScheduleNext()
end

function addon.StartAmbientSystem()
    ScheduleNext()
    ticker:SetScript("OnUpdate", function(_, dt)
        elapsed = elapsed + dt
        if elapsed < 1 then return end
        elapsed = 0
        if not addon.db or not addon.db.ambientEnabled then return end
        if not nextAmbientAt then ScheduleNext(); return end
        if GetTime() >= nextAmbientAt then
            addon.QueueAmbient(nil)
            ScheduleNext()
        end
    end)
end
