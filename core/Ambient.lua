local _, addon = ...

local nextAmbientAt
local ticker = CreateFrame("Frame")
local elapsed = 0

local function ScheduleNext()
    if not addon.db then return end
    local lo = math.max(30, addon.db.ambientMinInterval or 180)
    local hi = math.max(lo, addon.db.ambientMaxInterval or 420)
    nextAmbientAt = GetTime() + math.random(lo, hi)
end

local function WeightedCategory()
    local roll = math.random(100)
    if roll <= 62 then return "MURMUR" end
    if roll <= 92 then return "DISTURBED" end
    return "OUTBURST"
end

function addon.BuildAmbient(category)
    local lang = addon.GetOutputLanguage()
    local pool = addon.GetLocalePoolExact(lang, "ambient", category)
        or addon.GetLocalePoolExact("deDE", "ambient", category)
    return addon.ChooseText(pool, nil, addon.GetDemonName())
end

function addon.TryAmbient(category, force)
    if not addon.ready or not addon.isWarlock then return false end
    if not force and not addon.db.ambientEnabled then return false end
    if not force then
        if not addon.db.ambientInCombat and UnitAffectingCombat("player") then return false end
        if not addon.CooldownReady() then return false end
        if math.random(100) > addon.db.ambientChance then return false end
    end
    category = category or WeightedCategory()
    local text = addon.BuildAmbient(category)
    if not text then return false end
    if addon.SendText(text) then
        addon.StartCooldown()
        return true
    end
    return false
end

function addon.ResetAmbientTimer() ScheduleNext() end

function addon.StartAmbientSystem()
    ScheduleNext()
    ticker:SetScript("OnUpdate", function(_, dt)
        elapsed = elapsed + dt
        if elapsed < 1 then return end
        elapsed = 0
        if not addon.db or not addon.db.ambientEnabled then return end
        if not nextAmbientAt then ScheduleNext(); return end
        if GetTime() >= nextAmbientAt then
            addon.TryAmbient(nil, false)
            ScheduleNext()
        end
    end)
end
