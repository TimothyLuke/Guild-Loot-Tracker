local GLTAddon, _ = ...
local GLT = GLT
local Statics = GLT.Static

local currentclassDisplayName, currentenglishclass, currentclassId = UnitClass("player")
local L = GLT.L


function GLT:GROUP_ROSTER_UPDATE(...)


end

function GLT:ADDON_LOADED(event, addon)
	
	if addon == GLTAddon then
		LibStub("AceConfig-3.0"):RegisterOptionsTable(GLTAddon, GLT.OptionsTable, {"glt"})
		LibStub("AceConfigDialog-3.0"):AddToBlizOptions(GLTAddon, L["|cffff00FFGLT:|r Guild Loot Tracker"])	
		if  GLT.isEmpty(GLTOptions) then
			GLT.SetDefaultOptions()
			
		end
		print(L["|cffff00FFGLT:|r Guild Loot Tracker"], "Version ", GLT.VersionString, " loaded.")
	end
end

-- function GLT:CommandLine(input)
-- 	print("Got: ", input)
-- end

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
 
    print(player, "Looted: " .. itemLink, " of ", Statics.ItemQuality[quality])

end 

GLT:RegisterEvent("GROUP_ROSTER_UPDATE")
GLT:RegisterEvent("CHAT_MSG_LOOT")
--GLT:RegisterChatCommand("GLT", "CommandLine")
GLT:RegisterEvent('ADDON_LOADED')

