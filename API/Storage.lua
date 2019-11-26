function GLT.logLootDrop(player, itemLink, quality, instanceID, bossID)
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
