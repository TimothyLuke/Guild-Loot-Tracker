local GRT = GRT

local currentclassDisplayName, currentenglishclass, currentclassId = UnitClass("player")
local L = GRT.L


function GRT:GROUP_ROSTER_UPDATE(...)


end

function GSE:CommandLine(input)

end

GRT:RegisterEvent("GROUP_ROSTER_UPDATE")
GSE:RegisterChatCommand("grt", "CommandLine")