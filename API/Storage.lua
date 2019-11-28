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

	table.insert(LootHistory, lootRecord)

	-- GLT.BroadCast(lootRecord)

end

function GLT.checkInstance()
	local name, type, difficultyIndex, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceMapId, lfgID = GetInstanceInfo()
	local isRaid =  (type == 'raid') and true or false
	if isRaid then
		if not Statics.RaidZones[instanceMapId] then
			isRaid = false
		end
	end
	return isRaid, instanceMapId, type, maxPlayers, name
end

function GLT.ManageRaid()
    local isRaid, instanceMapId, type, maxPlayers, name = GLT.checkInstance()
    if GLT.ActiveRaid and isRaid then
        return GLT.ActiveRaid
    elseif GLT.ActiveRaid and not isRaid then
        GLT.CloseRaid(GLT.ActiveRaid)
    elseif isRaid then
        GLT.OpenRaid()
    end
end

function GLT.CloseRaid(raid)

end

function GLT.OpenRaid()

end