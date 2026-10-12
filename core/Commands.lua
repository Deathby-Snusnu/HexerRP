local _, addon = ...

local function ShowHelp()
    addon.Notify("HexerRP Befehle:")
    addon.Notify("/wrp help | /wrp list | /wrp status")
    addon.Notify("/wrp <schluessel>")
    addon.Notify("/wrp language deDE|enUS|frFR")
    addon.Notify("/wrp channel AUTO|SAY|YELL|EMOTE|PARTY|RAID|INSTANCE_CHAT")
    addon.Notify("/wrp chance 0-100 | /wrp cooldown 0-3600")
    addon.Notify("/wrp ambient on|off")
    addon.Notify("/wrp ambient test murmur|disturbed|outburst")
    addon.Notify("/wrp ambient chance 0-100")
    addon.Notify("/wrp ambient interval MIN MAX")
    addon.Notify("/wrp ambient combat on|off")
    addon.Notify("Ambient-Timer merkt Texte vor; Ausgabe bei der naechsten /wrp Aktion.")
end

local function SetLanguage(arg)
    local aliases={de="deDE",dede="deDE",en="enUS",enus="enUS",fr="frFR",frfr="frFR"}
    local lang=aliases[(arg or ""):lower()] or arg
    if not addon.outputLanguages[lang] then addon.Notify("Sprachen: deDE, enUS, frFR"); return end
    local ok=addon.SetOutputLanguage(lang)
    if ok then addon.Notify("Ausgabesprache: "..lang); else addon.Notify("Sprachdateien nicht geladen: "..tostring(lang)) end
end

local function AmbientCommand(arg)
    local a,b=(arg or ""):match("^%s*(%S*)%s*(.-)%s*$")
    a=(a or ""):lower()
    if a=="on" then addon.db.ambientEnabled=true; addon.ResetAmbientTimer(); addon.Notify("Ambient-RP: an")
    elseif a=="off" then addon.db.ambientEnabled=false; addon.Notify("Ambient-RP: aus")
    elseif a=="test" then
        local cat=(b~="" and b:upper()) or nil
        if cat and cat~="MURMUR" and cat~="DISTURBED" and cat~="OUTBURST" then addon.Notify("Test: murmur, disturbed, outburst"); return end
        addon.TryAmbient(cat,true)
    elseif a=="chance" then
        local v=tonumber(b); if addon.ValidNumber(v,100,0) then addon.db.ambientChance=v; addon.Notify("Ambient-Chance: "..v.."%") end
    elseif a=="interval" then
        local lo,hi=b:match("^(%d+)%s+(%d+)$"); lo,hi=tonumber(lo),tonumber(hi)
        if lo and hi and lo>=30 and hi>=lo and hi<=7200 then addon.db.ambientMinInterval=lo; addon.db.ambientMaxInterval=hi; addon.ResetAmbientTimer(); addon.Notify("Ambient-Intervall: "..lo.."-"..hi.."s") else addon.Notify("Benutzung: /wrp ambient interval 30 7200") end
    elseif a=="combat" then
        local v=b:lower(); if v=="on" then addon.db.ambientInCombat=true elseif v=="off" then addon.db.ambientInCombat=false else addon.Notify("/wrp ambient combat on|off"); return end
        addon.Notify("Ambient im Kampf: "..(addon.db.ambientInCombat and "an" or "aus"))
    else
        addon.Notify(string.format("Ambient: %s | Chance %d%% | Intervall %d-%ds | Kampf %s | Vorgemerkt %s", addon.db.ambientEnabled and "an" or "aus", addon.db.ambientChance, addon.db.ambientMinInterval, addon.db.ambientMaxInterval, addon.db.ambientInCombat and "an" or "aus", (addon.HasPendingAmbient and addon.HasPendingAmbient()) and "ja" or "nein"))
    end
end

SLASH_HEXERRP1="/wrp"
SLASH_HEXERRP2="/hexerrp"
SlashCmdList.HEXERRP=function(message)
    if not addon.ready then addon.Notify("Noch nicht geladen."); return end
    local command,arg=(message or ""):match("^%s*(%S+)%s*(.-)%s*$")
    command=command and command:lower() or "help"; arg=arg or ""
    if command=="help" or command=="?" then
        ShowHelp()
    elseif command=="list" then
        local keys={}; for key in pairs(addon.texts) do keys[#keys+1]=key end; table.sort(keys)
        for _,key in ipairs(keys) do addon.Notify(key.." - "..tostring(addon.texts[key].name or key)) end
    elseif command=="status" then
        addon.Notify(string.format("Chance %d%% | Cooldown %ds | Kanal %s | Sprache %s",addon.db.textChance,addon.db.cooldown,addon.db.chatChannel,addon.GetOutputLanguage()))
        AmbientCommand("")
    elseif command=="language" or command=="lang" then SetLanguage(arg)
    elseif command=="ambient" then AmbientCommand(arg)
    elseif command=="chance" or command=="cooldown" then
        local max=command=="chance" and 100 or 3600; local v=tonumber(arg)
        if addon.ValidNumber(v,max,0) then addon.db[command=="chance" and "textChance" or "cooldown"]=v; addon.Notify(command..": "..v) end
    elseif command=="channel" then
        local c=arg:upper(); if addon.channels[c] then addon.db.chatChannel=c; addon.Notify("Chatkanal: "..c) else addon.Notify("Kanaele: AUTO, SAY, YELL, EMOTE, PARTY, RAID, INSTANCE_CHAT") end
    elseif arg~="" then
        addon.Notify("Unbekannter Befehl: "..tostring(command))
        ShowHelp()
    else
        addon.TryText(command)
    end
end
