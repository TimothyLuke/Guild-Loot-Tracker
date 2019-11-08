local GRT = GRT

--- Remove WoW Text Markup from a sequence.
function GRT.UnEscapeSequence(sequence)

  local retseq = GRT.UnEscapeTable(sequence)
  for k,v in pairs(sequence) do
    if type (k) == "string" then
      retseq[k] = v
    end
  end
  if not GRT.isEmpty(sequence.KeyPress) then
    retseq.KeyPress = GRT.UnEscapeTable(sequence.KeyPress)
  end
  if not GRT.isEmpty(sequence.KeyRelease) then
    retseq.KeyRelease = GRT.UnEscapeTable(sequence.KeyRelease)
  end
  if not GRT.isEmpty(sequence.PreMacro) then
    retseq.PreMacro = GRT.UnEscapeTable(sequence.PreMacro)
  end
  if not GRT.isEmpty(sequence.PostMacro) then
    retseq.PostMacro = GRT.UnEscapeTable(sequence.PostMacro)
  end

  return retseq
end

function GRT.UnEscapeTable(tab)
  local newtab = {}
  for k,v in ipairs(tab) do
    --print (k .. " " .. v)
    local cleanstring = GRT.UnEscapeString(v)
    if not GRT.isEmpty(cleanstring) then
      newtab[k] = cleanstring
    end
  end
  return newtab
end

--- Remove WoW Text Markup from a string.
function GRT.UnEscapeString(str)

    for k, v in pairs(Statics.StringFormatEscapes) do
        str = string.gsub(str, k, v)
    end
    return str
end

--- Add the lines of a string as individual entries.
function GRT.lines(tab, str)
  local function helper(line)
    table.insert(tab, line)
    return ""
  end
  helper((str:gsub("(.-)\r?\n", helper)))
end

--- Convert a string to an array of lines.
function GRT.SplitMeIntolines(str)
  local t = {}
  local function helper(line)
    table.insert(t, line)
    return ""
  end
  helper((str:gsub("(.-)\r?\n", helper)))
  return t
end


function GRT.FixQuotes(source)
  source = string.gsub(source, "%‘", "'")
  source = string.gsub(source, "%’", "'")
  source = string.gsub(source, "%”", "\"")
  return source
end

function GRT.CleanStrings(source)
  for k,v in pairs(Statics.CleanStrings) do
    if source == v then
      source = ""
    else
      source = string.gsub(source, v, "")
    end
  end
  return source
end

function GRT.CleanStringsArray(tabl)
  for k,v in ipairs(tabl) do
    local tempval = GRT.CleanStrings(v)
    if tempval == [[""]] then
      tabl[k] = nil
    else
      tabl[k] = tempval
    end
  end
  return tabl
end


function GRT.pairsByKeys (t, f)
  local a = {}
  for n in pairs(t) do table.insert(a, n) end
  table.sort(a, f)
  local i = 0      -- Iterator variable
  local iter = function ()   -- Iterator function
    i = i + 1
    if a[i] == nil then return nil
    else return a[i], t[a[i]]
    end
  end
  return iter
end

--- This function removes any hidden characters from a string.
function GRT.StripControlandExtendedCodes( str )
  local s = ""
  for i = 1, str:len() do
	  if str:byte(i) >= 32 and str:byte(i) <= 126 then -- Space through to normal EN character
      s = s .. str:sub(i,i)
    elseif str:byte(i) == 194 and str:byte(i+1) == 160 then -- Fix for IE/Edge
      s = s .. " "
    elseif str:byte(i) == 160 and str:byte(i-1) == 194 then -- Fix for IE/Edge
      s = s .. " "
    elseif str:byte(i) == 10 then -- Leave line breaks Unix style
      s = s .. str:sub(i,i)
    elseif str:byte(i) == 13 then -- Leave line breaks Windows style
      s = s .. str:sub(i, str:byte(10))
    elseif str:byte(i) >= 128 then -- Extended characters including accented characters for international languages
      s = s .. str:sub(i,i)
    else -- Convert everything else to whitespace
      s = s .. " "
	  end
  end
  return s
end

function GRT.TrimWhiteSpace(str)
  return (string.gsub(str, "^%s*(.-)%s*$", "%1"))
end

function GRT.Dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. GRT.Dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

function GRT.FindGlobalObject(name)
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

function GRT.ObjectExists(name)
    return type(GRT.FindGlobalObject(name)) ~= 'nil'
end
