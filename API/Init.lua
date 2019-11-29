GLT = LibStub("AceAddon-3.0"):NewAddon("GLT", "AceConsole-3.0", "AceEvent-3.0", "AceComm-3.0", "AceSerializer-3.0", "AceTimer-3.0")
GLT.L = LibStub("AceLocale-3.0"):GetLocale("GLT")

GLT.VersionString = GetAddOnMetadata("guild-loot-tracker", "Version");
GLT.Static = {}

local Statics = GLT.Static

Statics.StringReset =  "|r"
GLT.OutputQueue = {}

--@debug@
if GLT.VersionString == "@project-version@" then
  GLT.VersionString = "1.1.24-18-g95ecb41"
end
--@end-debug@

-- Initialisation Functions
--- Checks for nil or empty variables.
function GLT.isEmpty(s)
  return s == nil or s == ''
end

--- When the Addon loads, printing is paused until after every other mod has loaded.
--    This method prints the print queue.
function GLT.PerformPrint()
  for k,v in ipairs(GLT.OutputQueue) do
    print(v)
    GLT.OutputQueue[k] = nil
  end
end

--- Prints <code>filepath</code>to the chat handler.  This accepts an optional
--    <code>title</code> to be prepended to that message.
function GLT.Print(message, title)
  -- Store this for later on.
  if not GLT.isEmpty(title) then
    message = GLTOptions.CommandColour .. title .. Statics.StringReset .." " .. message
  end
  table.insert(GLT.OutputQueue, message)
  if GLT.PrintAvailable then
    GLT.PerformPrint()
  end
end

--- Prints <code>message</code>to the chat handler.  This accepts an optional
--    <code>module</code> that is used to identify whether debugging for that module
--    is currently enabled.
function GLT.PrintDebugMessage(message, module)
    if GLT.isEmpty(module) then
      module = "GS-Core"
    end
    if module == Statics.SequenceDebug then
      determinationOutputDestination(message, GLTOptions.CommandColour .. GNOME .. ':|r ' .. GLTOptions.AuthorColour .. L["<SEQUENCEDEBUG> |r "] )
    elseif GLTOptions.debug and module ~= GSStaticSequenceDebug and GLTOptions.DebugModules[module] == true then
      determinationOutputDestination(GLTOptions.CommandColour .. (GLT.isEmpty(module) and GNOME or module) .. ':|r ' .. GLTOptions.AuthorColour .. L["<DEBUG> |r "] .. message )
    end
end

function GLT.split(source, delimiters)
  local elements = {}
  local pattern = '([^'..delimiters..']+)'
  string.gsub(source, pattern, function(value) elements[#elements + 1] =     value;  end);
  return elements
end

local gameversion, build, date, tocversion = GetBuildInfo()
local majorVersion = GLT.split(gameversion, '.')

GLT.GameMode = tonumber(majorVersion[1])
GLT.UnsavedOptions = {}

--- This function takes a version String and returns a version number.
function GLT.ParseVersion(version)
  local parts = GLT.split(version, "-")
  local numbers = GLT.split(parts[1], ".")
  local returnVal = 0
  if GLT.isEmpty(number) and type(version) == "number" then
    returnVal = version
  else
    if table.getn(numbers) >= 1 then
      returnVal = (tonumber(numbers[1]) * 1000) + (tonumber(numbers[2]) * 100) + (tonumber(numbers[3]) )
    else
      returnVal = tonumber(version)
    end
  end
  return tonumber(returnVal)
end


GLT.VersionNumber = GLT.ParseVersion(GLT.VersionString)

