local GLTAddon, _ = ...
local GLT = GLT

local currentclassDisplayName, currentenglishclass, currentclassId = UnitClass("player")
local L = GLT.L


function GLT:GROUP_ROSTER_UPDATE(...)


end

function GSE:ADDON_LOADED(event, addon)
	if addon == GLTAddon then
		print("GLT Version ", GLT.VersionString, " loaded.")
	end
end

function GLT:CommandLine(input)
	print("Got: ", input)
end

function GLT:CHAT_MSG_LOOT(...) 
	--print("Got Here")
	--print(...)
	local event, lootstring, altPlayer,  _, _, player, specialFlags, zoneChannelID, channelIndex, channelBaseName  = ... --"text", "playerName", "languageName", "channelName", "playerName2", "specialFlags", zoneChannelID, channelIndex, "channelBaseName", unused, lineID, "guid", bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons
	-- print("altPlayer", altPlayer)
	-- print("specialFlags", specialFlags)
	-- print("zoneChannelID", zoneChannelID)
	-- print("channelIndex", channelIndex)
	-- print("channelBaseName", channelBaseName)
	local itemLink = string.match(lootstring,"|%x+|Hitem:.-|h.-|h|r")
    --print("itemLink", itemLink)
    local itemString = string.match(itemLink, "item[%-?%d:]+")
    --print("itemString", itemString)
    local _, _, quality, _, _, class, subclass, _, equipSlot, texture, _, ClassID, SubClassID = GetItemInfo(itemString)
 
    print(player, "Looted: " .. itemLink, " of ", quality)

end 

GLT:RegisterEvent("GROUP_ROSTER_UPDATE")
GLT:RegisterEvent("CHAT_MSG_LOOT")
GLT:RegisterChatCommand("GLT", "CommandLine")
GSE:RegisterEvent('ADDON_LOADED')

