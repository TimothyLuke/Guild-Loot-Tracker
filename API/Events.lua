local GLT = GLT

local currentclassDisplayName, currentenglishclass, currentclassId = UnitClass("player")
local L = GLT.L


function GLT:GROUP_ROSTER_UPDATE(...)


end

function GSE:ADDON_LOADED(event, addon)

end

function GLT:CommandLine(input)
	print("Got: ", input)
end

function GLT:CHAT_MSG_LOOT(...) 
	--print("Got Here")
	--print(...)
	local event, lootstring, _,  _, _, player  = ... --"text", "playerName", "languageName", "channelName", "playerName2", "specialFlags", zoneChannelID, channelIndex, "channelBaseName", unused, lineID, "guid", bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons
	--print("lootstring", lootstring)
	--print("player", player)
	local itemLink = string.match(lootstring,"|%x+|Hitem:.-|h.-|h|r")
    --print("itemLink", itemLink)
    local itemString = string.match(itemLink, "item[%-?%d:]+")
    --print("itemString", itemString)
    local _, _, quality, _, _, class, subclass, _, equipSlot, texture, _, ClassID, SubClassID = GetItemInfo(itemString)
 
    print(player, " Looted: " .. itemLink)

end 

GLT:RegisterEvent("GROUP_ROSTER_UPDATE")
GLT:RegisterEvent("CHAT_MSG_LOOT")
GLT:RegisterChatCommand("GLT", "CommandLine")
GSE:RegisterEvent('ADDON_LOADED')

print("GLT Loaded")