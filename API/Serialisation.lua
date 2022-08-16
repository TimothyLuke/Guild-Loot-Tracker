local GLT = GLT
local L = GLT.L
local Statics = GLT.Static
local libS = LibStub:GetLibrary("AceSerializer-3.0")
local libC = LibStub:GetLibrary("LibCompress")
local libCE = libC:GetAddonEncodeTable()

local bytetoB64 = {
    [0] = "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z",
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
    "I",
    "J",
    "K",
    "L",
    "M",
    "N",
    "O",
    "P",
    "Q",
    "R",
    "S",
    "T",
    "U",
    "V",
    "W",
    "X",
    "Y",
    "Z",
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "(",
    ")"
}

local GLTOld = false

local B64tobyte = {
    a = 0,
    b = 1,
    c = 2,
    d = 3,
    e = 4,
    f = 5,
    g = 6,
    h = 7,
    i = 8,
    j = 9,
    k = 10,
    l = 11,
    m = 12,
    n = 13,
    o = 14,
    p = 15,
    q = 16,
    r = 17,
    s = 18,
    t = 19,
    u = 20,
    v = 21,
    w = 22,
    x = 23,
    y = 24,
    z = 25,
    A = 26,
    B = 27,
    C = 28,
    D = 29,
    E = 30,
    F = 31,
    G = 32,
    H = 33,
    I = 34,
    J = 35,
    K = 36,
    L = 37,
    M = 38,
    N = 39,
    O = 40,
    P = 41,
    Q = 42,
    R = 43,
    S = 44,
    T = 45,
    U = 46,
    V = 47,
    W = 48,
    X = 49,
    Y = 50,
    Z = 51,
    ["0"] = 52,
    ["1"] = 53,
    ["2"] = 54,
    ["3"] = 55,
    ["4"] = 56,
    ["5"] = 57,
    ["6"] = 58,
    ["7"] = 59,
    ["8"] = 60,
    ["9"] = 61,
    ["("] = 62,
    [")"] = 63
}

-- This code is based on the Encode7Bit algorithm from LibCompress
-- Credit goes to Galmok of European Stormrage (Horde), galmok@gmail.com
-- This version was lifted straight from WeakAuras 2
local encodeB64Table = {}

function GLT.encodeB64(str)
    local B64 = encodeB64Table
    local remainder = 0
    local remainder_length = 0
    local encoded_size = 0
    local l = #str
    local code
    for i = 1, l do
        code = string.byte(str, i)
        remainder = remainder + bit.lshift(code, remainder_length)
        remainder_length = remainder_length + 8
        while (remainder_length) >= 6 do
            encoded_size = encoded_size + 1
            B64[encoded_size] = bytetoB64[bit.band(remainder, 63)]
            remainder = bit.rshift(remainder, 6)
            remainder_length = remainder_length - 6
        end
    end
    if remainder_length > 0 then
        encoded_size = encoded_size + 1
        B64[encoded_size] = bytetoB64[remainder]
    end
    return table.concat(B64, "", 1, encoded_size)
end

local decodeB64Table = {}

function GLT.decodeB64(str)
    local bit8 = decodeB64Table
    local decoded_size = 0
    local ch
    local i = 1
    local bitfield_len = 0
    local bitfield = 0
    local l = #str
    while true do
        if bitfield_len >= 8 then
            decoded_size = decoded_size + 1
            bit8[decoded_size] = string.char(bit.band(bitfield, 255))
            bitfield = bit.rshift(bitfield, 8)
            bitfield_len = bitfield_len - 8
        end
        ch = B64tobyte[str:sub(i, i)]
        bitfield = bitfield + bit.lshift(ch or 0, bitfield_len)
        bitfield_len = bitfield_len + 6
        if i > l then
            break
        end
        i = i + 1
    end
    return table.concat(bit8, "", 1, decoded_size)
end

-- This encodes a LUA Table for transmission
function GLT.EncodeMessage(tab)
    local one = libS:Serialize(tab)
    local two = libC:Compress(one)
    local final = GLT.encodeB64(two)
    return final
end

function GLT.DecodeMessage(data)
    -- Decode the compressed data
    local one = GLT.decodeB64(data)

    -- Decompress the decoded data
    local two, message = libC:Decompress(one)
    if (not two) then
        GLT.PrintDebugMessage("Error decompressing: " .. message, Statics.DebugModules["Transmission"])
        return
    end

    -- Deserialize the decompressed data
    local success, final = libS:Deserialize(two)
    if (not success) then
        GLT.PrintDebugMessage("Error deserializing " .. final, Statics.DebugModules["Transmission"])
        return
    end

    GLT.PrintDebugMessage("Data Finalised", Statics.DebugModules["Transmission"])
    return success, final
end

--- data is the information or table to send
-- channel is one of "PARTY", "RAID", "GUILD", "BATTLEGROUND", "WHISPER", and "CHANNEL"
-- where channel is Whisper or Channel, target is the channelID or the target.
function GLT.sendMessage(data, channel, target)
    local transmission = GLT.EncodeMessage(data)
    GLT.PrintDebugMessage("Transmission: \n" .. transmission, Statics.DebugModules["Transmission"])
    if GLT.isEmpty(channel) then
        if IsInRaid() then
            channel =
                (not IsInRaid(LE_PARTY_CATEGORY_HOME) and IsInRaid(LE_PARTY_CATEGORY_INSTANCE)) and "INSTANCE_CHAT" or
                "RAID"
        else
            channel =
                (not IsInGroup(LE_PARTY_CATEGORY_HOME) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE)) and "INSTANCE_CHAT" or
                "PARTY"
        end
    else
        channel = "GUILD"
    end
    GLT.PrintDebugMessage("Transmission:" .. transmission, Statics.DebugModules["Transmission"])
    GLT.PrintDebugMessage("Using Channel " .. channel, Statics.DebugModules["Transmission"])
    GLT:SendCommMessage(Statics.CommPrefix, transmission, channel, target)
end

function GLT.performVersionCheck(version)
    GLT.PrintDebugMessage("Perform Version Check", Statics.DebugModules["Transmission"])
    if GLT.ParseVersion(version) ~= nil and GLT.ParseVersion(version) > GLT.VersionNumber then
        if not GLTOld then
            GLT.Print(
                L["Guild Loot Tracker is out of date. You can download the newest version from"] ..
                    " " .. Statics.DownloadLocation
            )
            GLTOld = true
            if (GLT.ParseVersion(version) - GLT.VersionNumber >= 5) then
                StaticPopup_Show("GLT_UPDATE_AVAILABLE")
            end
        end
    end
end

function GLT.storeSender(sender, senderversion)
    if sender and senderversion then
        GLT.PrintDebugMessage(
            "Sender: " .. sender .. " version: " .. senderversion,
            Statics.DebugModules["Transmission"]
        )
    end
    if GLT.isEmpty(GLT.UnsavedOptions["PartyUsers"]) then
        GLT.UnsavedOptions["PartyUsers"] = {}
    end
    GLT.UnsavedOptions["PartyUsers"][sender] = senderversion
end

function GLT.sendVersionCheck(channel)
    GLT.PrintDebugMessage("Send Version Check", Statics.DebugModules["Transmission"])
    local t = {}
    t.Command = Statics.SerialisationCommands["Version"]
    t.Version = GLT.VersionString
    GLT.sendMessage(t, channel)
end

function GLT.sendRaidInfo(raidIndex, channel, target)
    GLT.PrintDebugMessage("Send Raid Info", Statics.DebugModules["Transmission"])
    local t = {}
    t.Command = Statics.SerialisationCommands["SendRaidInfo"]
    t.raidId = GLTRaidLibrary[raidIndex]["id"]
    t.raidInfo = GLTRaidLibrary[raidIndex]
    t.lastUpdated = GLTRaidLibrary[raidIndex]["lastUpdated"]
    GLT.sendMessage(t, channel, target)
end

function GLT.sendStartRaid(raidIndex, channel, target)
    GLT.PrintDebugMessage("Start Raid", Statics.DebugModules["Transmission"])
    local t = {}
    t.Command = Statics.SerialisationCommands["StartRaid"]
    t.raidId = GLTRaidLibrary[raidIndex].id
    t.raidInfo = GLTRaidLibrary[raidIndex]
    GLT.sendMessage(t, "GUILD", target)
    GLT.sendMessage(t, "RAID", target)
end

function GLT.sendCloseRaid(raidIndex, channel, target)
    GLT.PrintDebugMessage("Close Raid", Statics.DebugModules["Transmission"])
    local t = {}
    t.Command = Statics.SerialisationCommands["CloseRaid"]
    t.raidId = GLTRaidLibrary[raidIndex].id
    t.endDate = GLTRaidLibrary[raidIndex].endDate
    GLT.sendMessage(t, channel, target)
end

function GLT.sendCurrentRaid(raidIndex, channel, target)
    GLT.PrintDebugMessage("Send Current Raid", Statics.DebugModules["Transmission"])
    local t = {}
    t.Command = Statics.SerialisationCommands["GetCurrentRaid"]
    t.raidId = GLTRaidLibrary[raidIndex].id
    GLT.sendMessage(t, channel, target)
end

function GLT.sendRaidList(raidIndex, channel, target)
    GLT.PrintDebugMessage("Send Current Raid", Statics.DebugModules["Transmission"])
    local t = {}
    t.Command = Statics.SerialisationCommands["ListRaids"]
    t.raidList = GLT.getKnownRaids()
    GLT.sendMessage(t, channel, target)
end

function GLT.requestRaid(raidId, channel, target)
    GLT.PrintDebugMessage("Request Raid", Statics.DebugModules["Transmission"])
    local t = {}
    t.Command = Statics.SerialisationCommands["ListRaids"]
    t.raidId = raidId
    GLT.sendMessage(t, channel, target)
end

function GLT.replaceRaid(oldRaidId, newRaid, channel, target)
    GLT.PrintDebugMessage("Replace Raid", Statics.DebugModules["Transmission"])
    local t = {}
    t.Command = Statics.SerialisationCommands["MergeRaids"]
    t.oldRaidId = oldRaidId
    t.newRaidInfo = newRaid
    GLT.sendMessage(t, channel, target)
end

function GLT.broadcastLootDrop(raidId, lootRecord)
    GLT.PrintDebugMessage("Loop Drop", Statics.DebugModules["Transmission"])
    local t = {}
    t.Command = Statics.SerialisationCommands["BroadcastLoot"]
    t.raidId = raidId
    t.lootRecord = lootRecord
    GLT.sendMessage(t, "RAID", nil)
end
function GLT:OnCommReceived(prefix, message, distribution, sender)
    local success, t = GLT.DecodeMessage(message)
    if success then
        if sender ~= GetUnitName("player", true) then
            GLT.PrintDebugMessage(
                t.Command .. " received from " .. sender .. " via " .. distribution,
                Statics.DebugModules["Transmission"]
            )
            if t.Command == Statics.SerialisationCommands["Version"] then
                if not GLTOld then
                    GLT.performVersionCheck(t.Version)
                end
                GLT.storeSender(sender, t.Version)
            elseif t.Command == Statics.SerialisationCommands["GetRaidInfo"] then
                GLT.requestRaid(t.raidId)
            elseif t.Command == Statics.SerialisationCommands["SendRaidInfo"] then
                GLT.sendRaidInfo(t.raidId)
            elseif t.Command == Statics.SerialisationCommands["CloseRaid"] then
                GLT.updateRaid(t.raidId, "endDate", t.endDate)
                local activeRaid = GLTRaidLibrary[GLT.findRaidIndex(GLT.ActiveRaid)]
                if activeRaid and activeRaid["id"] == t.raidId then
                    GLT.ActiveRaid = nil
                end
            elseif t.Command == Statics.SerialisationCommands["StartRaid"] then
                if GLT.isEmpty(GLT.findRaidIndex(t.raidId)) then
                    table.insert(GLTRaidLibrary, t.raidInfo)
                end
                if GLT.isEmpty(t.raidInfo["endDate"]) and GLT.playerInRaid(t.raidId) then
                    GLT.ActiveRaid = GLT.findRaidIndex(t.raidId)
                end
            elseif t.Command == Statics.SerialisationCommands["ListRaids"] then
                GLT.checkForUnknownRaids(t.Raidlist, sender)
            elseif t.Command == Statics.SerialisationCommands["GetCurrentRaid"] then
                local raid = GLTRaidLibrary[GLT.ActiveRaid]
                if raid and raid.id ~= t.raidId and GLT.playerInRaid(t.raidId) then
                    GLT.ActiveRaid = GLT.findRaidIndex(t.raidId)
                end
            elseif t.Command == Statics.SerialisationCommands["BroadcastLoot"] then
                GLT.recordLootDrop(GLT.findRaidIndex(t.raidId), t.lootRecord)
            elseif t.Command == Statics.SerialisationCommands["MergeRaids"] then
                local activeRaid = GLTRaidLibrary[GLT.ActiveRaid]
                local index = GLT.findRaidIndex(t.oldRaidInfo)
                if index then
                    table.remove(GLTRaidLibrary, index)
                end
                table.insert(GLTRaidLibrary, t.newRaidIndo)
                if activeRaid.id == t.oldRaidInfo then
                    GLT.ActiveRaid = #GLTRaidLibrary
                end
            end
        end
    else
        GLT.PrintDebugMessage(
            t.Command .. " received from you via " .. distribution,
            Statics.DebugModules["Transmission"]
        )
    end
end

GLT:RegisterComm("GLT")
