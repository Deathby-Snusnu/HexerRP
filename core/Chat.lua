-- SPDX-License-Identifier: MPL-2.0
-- Copyright (c) 2026 Hannes Weichselbaum
--
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.

local _, addon = ...

addon.channels = { AUTO=true, SAY=true, YELL=true, EMOTE=true, PARTY=true, RAID=true, INSTANCE_CHAT=true }

function addon.GetChatChannel()
    local channel = addon.db.chatChannel
    if channel == "AUTO" then
        if IsInGroup(LE_PARTY_CATEGORY_INSTANCE) then return "INSTANCE_CHAT" end
        if IsInRaid() then return "RAID" end
        if IsInGroup() then return "PARTY" end
        return "SAY"
    end
    if not addon.channels[channel] then return nil end
    return channel
end

local function PrepareText(text)
    local a, b = text:sub(1,1)=="*", text:sub(-1)=="*"
    if a ~= b then addon.Notify("Text nicht gesendet: fehlerhafte Emote-Markierung."); return nil,nil end
    if a and b then
        local t=text:sub(2,-2):match("^%s*(.-)%s*$")
        if not t or t=="" then return nil,nil end
        return t,true
    end
    return text,false
end

function addon.SendText(text, forcedChannel)
    if type(text) ~= "string" or text == "" then return false end
    local message,isEmote=PrepareText(text)
    if not message then return false end
    if #message>255 or message:find("[\r\n]") or message:find("|",1,true) then
        addon.Notify("Text nicht gesendet: ungueltiges Chatformat.")
        return false
    end
    local channel=isEmote and "EMOTE" or forcedChannel or addon.GetChatChannel()
    if not channel then return false end
    if not C_ChatInfo or type(C_ChatInfo.SendChatMessage)~="function" then
        addon.Notify("Dieser Client stellt keine unterstuetzte Chat-API bereit.")
        return false
    end
    local languageID
    if not forcedChannel and (channel == "SAY" or channel == "YELL") then
        local rpChat = _G.RPChatMod
        if type(rpChat) == "table" and type(rpChat.GetChatLanguageID) == "function" then
            languageID = rpChat.GetChatLanguageID(channel)
        end
    end
    C_ChatInfo.SendChatMessage(message, channel, languageID)
    return true
end
