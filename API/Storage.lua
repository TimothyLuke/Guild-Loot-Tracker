local GLT = GLT
local L = GLT.L

local Statics = GLT.Static

function GLT.logLootDrop(player, itemLink, quality, instanceID, bossID)
    if not Statics.Encounters[bossID] then
        bossID = 0
    end

    local lootRecord = {
        ["timestamp"] = GetServerTime(),
        ["instanceID"] = instanceID,
        ["player"] = player,
        ["itemLink"] = itemLink,
        ["quality"] = quality,
        ["bossID"] = bossID
    }

    GLT.recordLootDrop(GLTRaidLibrary[GLT.ActiveRaid]["id"], lootRecord)
    GLT.broadcastLootDrop(GLTRaidLibrary[GLT.ActiveRaid]["id"], lootRecord)
end

function GLT.recordLootDrop(raidIndex, lootRecord)
    print(raidIndex)
    print(lootRecord)
    local index = lootRecord["instanceID"] .. "-" .. lootRecord["player"] .. "-" .. lootRecord["itemLink"]
    GLTRaidLibrary[raidIndex]["loot"][index] = lootRecord
    GLTRaidLibrary[GLT.findRaidIndex(raidIndex)]["lastUpdated"] = GetServerTime()
end

function GLT.checkInstance()
    local name,
        instanceType,
        difficultyIndex,
        difficultyName,
        maxPlayers,
        dynamicDifficulty,
        isDynamic,
        instanceMapId,
        lfgID = GetInstanceInfo()
    local isRaid = (instanceType == "raid") and true or false
    -- if isRaid then
    --     if not Statics.RaidZones[instanceMapId] then
    --         isRaid = false
    --     end
    -- end
    GLT.PrintDebugMessage(
        "isRaid: " .. tostring(isRaid) .. " GLT.includeGroup" .. tostring(GLT.includeGroup) .. " type:" .. instanceType,
        Statics.DebugModules["Storage"]
    )
    if GLT.includeGroup then
        if instanceType == "party" or instanceType == "raid" then
            isRaid = true
        end
    end
    return isRaid, instanceMapId, type, maxPlayers, name
end

function GLT.ManageRaid()
    local isRaid, instanceMapId, _, _, _ = GLT.checkInstance()
    if GLT.ActiveRaid and isRaid then
        return GLT.ActiveRaid
    elseif GLT.ActiveRaid and not isRaid then
        GLT.CloseRaid(GLT.ActiveRaid)
    elseif isRaid then
        GLT.OpenRaid(instanceMapId)
    end
end

function GLT.CloseRaid(raidIndex)
    GLT.PrintDebugMessage("GLT Raid Index: " .. raidIndex, Statics.DebugModules["Storage"])
    GLTRaidLibrary[raidIndex]["endDate"] = GetServerTime()
    GLT.sendCloseRaid(raidIndex)
    local activeRaid = GLTRaidLibrary[GLT.findRaidIndex(GLT.ActiveRaid)]
    if activeRaid and activeRaid["id"] == raidIndex then
        GLT.ActiveRaid = nil
    end
end

function GLT.getCurrentRaidMembers()
    local RaidMembers = {}
    for i = 1, 40, 1 do
        local name, rank, subgroup, level, class, fileName, zone, online, isDead, role, isML = GetRaidRosterInfo(i)
        if level and level > 0 then
            table.insert(
                RaidMembers,
                {
                    ["name"] = name,
                    ["class"] = class,
                    ["level"] = level
                }
            )
        end
    end

    return RaidMembers
end

function GLT.OpenRaid(instanceMapId)
    local player = UnitName("player")
    local currentTime = GetServerTime()
    local server = GetNormalizedRealmName()
    local RaidSchema = {
        ["id"] = server .. "-" .. instanceMapId .. "-" .. currentTime .. "-" .. player,
        ["instanceMapId"] = instanceMapId,
        ["startDate"] = currentTime,
        ["members"] = GLT.getCurrentRaidMembers(),
        ["loot"] = {},
        ["lastUpdated"] = currentTime
        --endDate = timestamp
    }
    table.insert(GLTRaidLibrary, RaidSchema)
    GLT.ActiveRaid = #GLTRaidLibrary
    GLT.sendRaidInfo(GLT.ActiveRaid)
end

function GLT.receiveRaid(raidId, raidInfo)
    -- see if raidId exists.
    local raidIndex = GLT.findRaidIndex(raidId)
    -- if not add the raid
    if GLT.isEmpty(raidIndex) then
        table.insert(GLTRaidLibrary, raidInfo)
    else
        -- if so merge its data into ours
        if raidInfo["lastUpdated"] > GLTRaidLibrary[raidIndex]["lastUpdated"] then
            GLTRaidLibrary[raidIndex] = raidInfo
        end
    end
    -- if it does and you are in the same raid make it active
    if GLT.isEmpty(raidInfo["endDate"]) and GLT.playerInRaid(raidId) then
        GLT.ActiveRaid = GLT.findRaidIndex(raidId)
    end
end

function GLT.getKnownRaids()
    local list = {}
    for _, v in ipairs(GLTRaidLibrary) do
        table.insert(list, v.id)
    end
    return list
end

function GLT.playerInRaid(raidId)
    local raid = GLTRaidLibrary[GLT.findRaidIndex(raidId)]
    local set = {}
    local player = UnitName("player")
    for k, v in ipairs(raid["members"]) do
        local name = v.name
        set[name] = k
    end
    return not GLT.isEmpty(set[player])
end

function GLT.checkForUnknownRaids(list, sender)
    -- check if sender in guild?
    for _, v in ipairs(list) do
        local index = GLT.findRaidIndex(v.id)
        if GLT.isEmpty(index) then
            GLT.requestRaid(v.id, "WHISPER", sender)
        end
    end
end

function GLT.findRaidIndex(raidId)
    local set = {}
    for k, v in ipairs(GLTRaidLibrary) do
        local id = v.id
        set[id] = k
    end
    return (set[raidId])
end

function GLT.updateRaid(raidId, field, value)
    GLTRaidLibrary[GLT.findRaidIndex(raidId)][field] = value
    GLTRaidLibrary[GLT.findRaidIndex(raidId)]["lastUpdated"] = GetServerTime()
end
