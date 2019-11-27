GLT = {}
GLT.L = {}
GLT.Static = {}
GLT.VersionString = "2.0.00-18-g95ecb41";

GNOME = "UnitTest"

LootHistory = {}

L["Guild Loot Tracker is out of date. You can download the newest version from"] = "Guild Loot Tracker is out of date. You can download the newest version from"

-- Mock Character Functions
function GetTalentTierInfo(tier, ...)
  return 1
end

function GetSpecialization()
  return 11
end

function GetClassInfo(i)
  if i == 11 then
    return "Druid", "DRUID", 11
  else
    return "Paladin", "PALADIN", 2
  end
end

function GetSpecializationInfoByID(id)
  return id, "SPecName", "SPecDescription", 1234567, "file.blp", 1, "DRUID"
end

function UnitClass(str)
  return "Druid", "DRUID", 11
end

function GetUnitName(str)
  local retval = "Unknown"
  if str == "player" then
    retval = "Draik"
  end
  return retval
end

function GetSpellInfo(spellstring)
  print( "GetSpellInfo -- " .. spellstring)
  local name, rank, icon, castTime, minRange, maxRange, spellId
  if type(spellstring) == "string" then
    name = spellstring
    spellId = 1010101
  else
    name = "Eye of Tyr"
    spellId = spellstring
  end
  print( "GetSpellInfo " .. name .. spellId)
  return name, rank, icon, castTime, minRange, maxRange, spellId
end

-- Mock Standard Functions
function GLT.Print(message, title)
  print (title .. ": " .. message)
end

function GLT.PrintDebugMessage(message, title)
  GLT.Print(message, title)
end

function GLT.isEmpty(s)
  return s == nil or s == ''
end

--- Split a string into an array based on the delimiter specified.
function GLT.split(source, delimiters)
  local elements = {}
  local pattern = '([^'..delimiters..']+)'
  string.gsub(source, pattern, function(value) elements[#elements + 1] =     value;  end);
  return elements
end

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



function strmatch(string, pattern, initpos)
  return string.match(string, pattern, initpos)
end

function newLocale(application, locale, isDefault, silent)
  local writedefaultproxy = setmetatable({}, {
    __newindex = function(self, key, value)
      if not rawget(registering, key) then
        rawset(registering, key, value == true and key or value)
      end
    end,
    __index = assertfalse
  })
  if isDefault then
    return writedefaultproxy
  end
end

function GetLocale()
  return "enUS"
end


classic = "1.13.2 12345 Aug 10 2019 11302"
retail = "8.2.0 31429 Aug 7 2019 80200"
currentver = classic

function GetBuildInfo()
  return currentver
end

function setClassic()
  currentver = classic
end

function setRetail()
  currentver = retail
end

