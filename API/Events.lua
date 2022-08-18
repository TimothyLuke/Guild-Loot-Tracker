local GLTAddon, _ = ...
local GLT = GLT
local Statics = GLT.Static

local currentclassDisplayName, currentenglishclass, currentclassId = UnitClass("player")
local L = GLT.L

function GLT:GROUP_ROSTER_UPDATE(...)
  -- Serialisation stuff
  GLT.sendVersionCheck()
  if table.getn(GLT.UnsavedOptions) > 0 then
    for k, _ in pairs(GLT.UnsavedOptions["PartyUsers"]) do
      if not (UnitInParty(k) or UnitInRaid(k)) then
        -- Take them out of the list
        GLT.UnsavedOptions["PartyUsers"][k] = nil
      end
    end
  end
  -- Check if in a raid
  GLT.ManageRaid()
end

function GLT:ADDON_LOADED(event, addon)
  -- Add dynamic options
  local ord = 30
  for k, _ in pairs(Statics.DebugModules) do
    ord = ord + 1
    GLT.OptionsTable.args.debugTab.args[k] = {
      name = k,
      desc = L["This will display debug messages for the "] .. k,
      type = "toggle",
      set = function(info, val)
        GLTOptions.DebugModules[k] = val
      end,
      get = function(info)
        if GLT.isEmpty(GLTOptions.DebugModules) then
          GLTOptions.DebugModules = {}
        end
        if GLT.isEmpty(GLTOptions.DebugModules[k]) then
          GLTOptions.DebugModules[k] = false
        end
        return GLTOptions.DebugModules[k]
      end,
      order = ord
    }
  end

  if addon == GLTAddon then
    LibStub("AceConfig-3.0"):RegisterOptionsTable(GLTAddon, GLT.OptionsTable, {"glt"})
    LibStub("AceConfigDialog-3.0"):AddToBlizOptions(GLTAddon, Statics.GLTPrefix .. L["Guild Loot Tracker"])
    if GLT.isEmpty(GLTOptions) then
      GLT.SetDefaultOptions()
    end
    GLT.Print(
      GLTOptions.AuthorColour ..
        L["Guild Loot Tracker"] .. Statics.StringReset .. " Version " .. GLT.VersionString .. " loaded."
    )
    -- if GLT.isEmpty(LootHistory) then
    -- 	LootHistory = {}
    -- end
    if GLT.isEmpty(GLTRaidLibrary) then
      GLTRaidLibrary = {}
    end
  end
end

-- function GLT:CommandLine(input)
-- 	print("Got: ", input)
-- end

function GLT:PLAYER_ENTERING_WORLD()
  GLT.PerformOneOffEvents()
  GLT.PrintAvailable = true
  GLT.PerformPrint()
end

function GLT:CHAT_MSG_LOOT(...)
  -- print("Got Here")
  -- print(...)
  local event, lootstring, altPlayer, _, _, player, specialFlags, zoneChannelID, channelIndex, channelBaseName = ... --"text", "playerName", "languageName", "channelName", "playerName2", "specialFlags", zoneChannelID, channelIndex, "channelBaseName", unused, lineID, "guid", bnSenderID, isMobile, isSubtitle, hideSenderInLetterbox, supressRaidIcons
  -- print("altPlayer", altPlayer)
  -- print("specialFlags", specialFlags)
  -- print("zoneChannelID", zoneChannelID)
  -- print("channelIndex", channelIndex)
  -- print("channelBaseName", channelBaseName)
  local itemLink = string.match(lootstring, "|%x+|Hitem:.-|h.-|h|r")
  -- print("itemLink", itemLink)
  local itemString = string.match(itemLink, "item[%-?%d:]+")
  -- print("itemString", itemString)
  local _, _, quality, _, _, class, subclass, _, equipSlot, texture, _, ClassID, SubClassID = GetItemInfo(itemString)
  if string.len(player) >= 1 then
    local isRaid, instanceMapID, _ = GLT.checkInstance()
    if isRaid and quality > GLTOptions.LootThreshold then
      GLT.PrintDebugMessage(
        "isRaid: " .. tostring(isRaid) .. " instanceMapID: " .. instanceMapID .. "Quality: " .. quality,
        Statics.DebugModules["Events"]
      )
      GLT.logLootDrop(player, itemLink, quality, instanceMapID, GLT.lastBoss)
      GLT.PrintDebugMessage(
        player .. " Looted: " .. itemLink .. " of " .. Statics.ItemQuality[quality],
        Statics.DebugModules["Storage"]
      )
    end
  -- print(...)
  end
end

function GLT:COMBAT_LOG_EVENT_UNFILTERED(...)
  --print(CombatLogGetCurrentEventInfo())

  local timestamp, combatEvent, _, _, _, _, _, destGUID, destName, _, _, spellID = CombatLogGetCurrentEventInfo()

  if combatEvent == "UNIT_DIED" then
    --print(CombatLogGetCurrentEventInfo())
    local bossID
    --local localBossName = destName
    local unitType, _, _, instanceID, zoneID, ID = strsplit("-", destGUID) --[Unit type]-0-[server ID]-[instance ID]-[zone UID]-[ID]-[Spawn UID]
    if (unitType == "Creature") or (unitType == "Vehicle") then
      bossID = tonumber(ID)
    end
    -- print(destGUID, destName, bossID);
    if Statics.Encounters[bossID] then
      GLT.lastBoss = bossID
    else
      GLT.lastBoss = 0
    end
  end
end

function GLT:GUILD_ROSTER_UPDATE(...)
  GLT.sendVersionCheck("GUILD")
end

function GLT:ZONE_CHANGED(...)
  GLT.ManageRaid()
end

function GLT:ZONE_CHANGED_INDOORS(...)
  GLT.ManageRaid()
end

function GLT:ZONE_CHANGED_NEW_AREA(...)
  GLT.ManageRaid()
end

GLT:RegisterEvent("GROUP_ROSTER_UPDATE")
GLT:RegisterEvent("CHAT_MSG_LOOT")
--GLT:RegisterChatCommand("GLT", "CommandLine")
GLT:RegisterEvent("ADDON_LOADED")
GLT:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
GLT:RegisterEvent("GUILD_ROSTER_UPDATE")
GLT:RegisterEvent("ZONE_CHANGED")
GLT:RegisterEvent("ZONE_CHANGED_INDOORS")
GLT:RegisterEvent("ZONE_CHANGED_NEW_AREA")
GLT:RegisterEvent("PLAYER_ENTERING_WORLD")
