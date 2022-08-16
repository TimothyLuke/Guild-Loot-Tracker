local GLT = GLT
local Statics = GLT.Static

--- Remove WoW Text Markup from a sequence.
function GLT.UnEscapeSequence(sequence)
  local retseq = GLT.UnEscapeTable(sequence)
  for k, v in pairs(sequence) do
    if type(k) == "string" then
      retseq[k] = v
    end
  end
  if not GLT.isEmpty(sequence.KeyPress) then
    retseq.KeyPress = GLT.UnEscapeTable(sequence.KeyPress)
  end
  if not GLT.isEmpty(sequence.KeyRelease) then
    retseq.KeyRelease = GLT.UnEscapeTable(sequence.KeyRelease)
  end
  if not GLT.isEmpty(sequence.PreMacro) then
    retseq.PreMacro = GLT.UnEscapeTable(sequence.PreMacro)
  end
  if not GLT.isEmpty(sequence.PostMacro) then
    retseq.PostMacro = GLT.UnEscapeTable(sequence.PostMacro)
  end

  return retseq
end

function GLT.UnEscapeTable(tab)
  local newtab = {}
  for k, v in ipairs(tab) do
    --print (k .. " " .. v)
    local cleanstring = GLT.UnEscapeString(v)
    if not GLT.isEmpty(cleanstring) then
      newtab[k] = cleanstring
    end
  end
  return newtab
end

--- Remove WoW Text Markup from a string.
function GLT.UnEscapeString(str)
  for k, v in pairs(Statics.StringFormatEscapes) do
    str = string.gsub(str, k, v)
  end
  return str
end

--- Add the lines of a string as individual entries.
function GLT.lines(tab, str)
  local function helper(line)
    table.insert(tab, line)
    return ""
  end
  helper((str:gsub("(.-)\r?\n", helper)))
end

--- Convert a string to an array of lines.
function GLT.SplitMeIntolines(str)
  local t = {}
  local function helper(line)
    table.insert(t, line)
    return ""
  end
  helper((str:gsub("(.-)\r?\n", helper)))
  return t
end

function GLT.FixQuotes(source)
  source = string.gsub(source, "%‘", "'")
  source = string.gsub(source, "%’", "'")
  source = string.gsub(source, "%”", '"')
  return source
end

function GLT.CleanStrings(source)
  for _, v in pairs(Statics.CleanStrings) do
    if source == v then
      source = ""
    else
      source = string.gsub(source, v, "")
    end
  end
  return source
end

function GLT.CleanStringsArray(tabl)
  for k, v in ipairs(tabl) do
    local tempval = GLT.CleanStrings(v)
    if tempval == [[""]] then
      tabl[k] = nil
    else
      tabl[k] = tempval
    end
  end
  return tabl
end

function GLT.pairsByKeys(t, f)
  local a = {}
  for n in pairs(t) do
    table.insert(a, n)
  end
  table.sort(a, f)
  local i = 0 -- Iterator variable
  local iter = function()
    -- Iterator function
    i = i + 1
    if a[i] == nil then
      return nil
    else
      return a[i], t[a[i]]
    end
  end
  return iter
end

--- This function removes any hidden characters from a string.
function GLT.StripControlandExtendedCodes(str)
  local s = ""
  for i = 1, str:len() do
    if str:byte(i) >= 32 and str:byte(i) <= 126 then -- Space through to normal EN character
      s = s .. str:sub(i, i)
    elseif str:byte(i) == 194 and str:byte(i + 1) == 160 then -- Fix for IE/Edge
      s = s .. " "
    elseif str:byte(i) == 160 and str:byte(i - 1) == 194 then -- Fix for IE/Edge
      s = s .. " "
    elseif str:byte(i) == 10 then -- Leave line breaks Unix style
      s = s .. str:sub(i, i)
    elseif str:byte(i) == 13 then -- Leave line breaks Windows style
      s = s .. str:sub(i, str:byte(10))
    elseif str:byte(i) >= 128 then -- Extended characters including accented characters for international languages
      s = s .. str:sub(i, i)
    else -- Convert everything else to whitespace
      s = s .. " "
    end
  end
  return s
end

function GLT.TrimWhiteSpace(str)
  return (string.gsub(str, "^%s*(.-)%s*$", "%1"))
end

function GLT.Dump(obj)
  if type(obj) == "table" then
    local s = "{ "
    for k, v in pairs(obj) do
      if type(k) ~= "number" then
        k = '"' .. k .. '"'
      end
      s = s .. "[" .. k .. "] = " .. GLT.Dump(v) .. ","
    end
    return s .. "} "
  else
    return tostring(obj)
  end
end

function GLT.FindGlobalObject(name)
  local a = _G
  for key in string.gmatch(name, "([^%.]+)(%.?)") do
    if a[key] then
      a = a[key]
    else
      return nil
    end
  end
  return a
end

function GLT.ObjectExists(name)
  return type(GLT.FindGlobalObject(name)) ~= "nil"
end

function GLT.GUIGetColour(option)
  local _ = string.gsub(option, "#", "")
  return tonumber("0x" .. string.sub(option, 5, 6)) / 255, tonumber("0x" .. string.sub(option, 7, 8)) / 255, tonumber(
    "0x" .. string.sub(option, 9, 10)
  ) / 255
end

function GLT.GUISetColour(option, r, g, b)
  GLT.PrintDebugMessage("Incoming Option " .. option, "Events")
  option = string.format("|c%02x%02x%02x%02x", 255, r * 255, g * 255, b * 255)
  return option
end
