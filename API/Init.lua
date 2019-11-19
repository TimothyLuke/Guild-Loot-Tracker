GLT = LibStub("AceAddon-3.0"):NewAddon("GLT", "AceConsole-3.0", "AceEvent-3.0", "AceComm-3.0", "AceSerializer-3.0", "AceTimer-3.0")
GLT.L = LibStub("AceLocale-3.0"):GetLocale("GLT")

GLT.VersionString = GetAddOnMetadata("GLT", "Version");

function GLT.split(source, delimiters)
  local elements = {}
  local pattern = '([^'..delimiters..']+)'
  string.gsub(source, pattern, function(value) elements[#elements + 1] =     value;  end);
  return elements
end

local gameversion, build, date, tocversion = GetBuildInfo()
local majorVersion = GLT.split(gameversion, '.')

GLT.GameMode = tonumber(majorVersion[1])


--- This function takes a version String and returns a version number.
function GLT.ParseVersion(version)
  local parts = GLT.split(version, "-")
  local numbers = GLT.split(parts[1], ".")
  local returnVal = 0
  if GLT.isEmpty(number) and type(version) == "number" then
    returnVal = version
  else
    if table.getn(numbers) > 1 then
      returnVal = (tonumber(numbers[1]) * 1000) + (tonumber(numbers[2]) * 100) + (tonumber(numbers[3]) )
    else
      returnVal = tonumber(version)
    end
  end
  return tonumber(returnVal)
end

GLT.VersionNumber = GLT.ParseVersion(GLT.VersionString)

