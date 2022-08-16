local GLT = GLT
local L = GLT.L

local Statics = GLT.Static

function GLT.SetDefaultOptions()
	if GLT.isEmpty(GLTOptions) then
		GLTOptions = {}
	end
	GLTOptions.TitleColour = "|cFFFF0000"
	GLTOptions.AuthorColour = "|cFF00D1FF"
	GLTOptions.CommandColour = "|cFF00FF00"
	GLTOptions.NormalColour = "|cFFFFFFFF"
	GLTOptions.EmphasisColour = "|cFFFFFF00"
	GLTOptions.KEYWORD = "|cff88bbdd"
	GLTOptions.UNKNOWN = "|cffff6666"
	GLTOptions.CONCAT = "|cffcc7777"
	GLTOptions.NUMBER = "|cffffaa00"
	GLTOptions.STRING = "|cff888888"
	GLTOptions.COMMENT = "|cff55cc55"
	GLTOptions.INDENT = "|cffccaa88"
	GLTOptions.EQUALS = "|cffccddee"
	GLTOptions.STANDARDFUNCS = "|cff55ddcc"
	GLTOptions.WOWSHORTCUTS = "|cffddaaff"
	GLTOptions.LootThreshold = 3
	GLTOptions.DebugModules = {}
	for k, _ in ipairs(Statics.DebugModules) do
		GLTOptions.DebugModules[Statics.DebugModules[k]] = false
	end
end

GLT.OptionsTable = {
	type = "group",
	name = Statics.GLTPrefix .. L["Guild Loot Tracker Options"],
	args = {
		generalTab = {
			name = L["General"],
			desc = L["General Options"],
			type = "group",
			order = 1,
			args = {
				title1 = {
					type = "header",
					name = L["General Options"],
					order = 100
				},
				lootThreshold = {
					name = L["Loot Threshold"],
					desc = L["Minimum item quality to log."],
					type = "select",
					style = "dropdown",
					values = Statics.ItemQuality,
					set = function(info, val)
						GLTOptions.LootThreshold = val
					end,
					get = function(info)
						if GLT.isEmpty(GLTOptions.LootThreshold) then
							GLTOptions.LootThreshold = 3
						end
						return GLTOptions.LootThreshold
					end,
					order = 120
				},
				includeGroup = {
					name = L["Track Groups"],
					desc = L["Should this track Groups as well as raids"],
					type = "toggle",
					--style = "dropdown",
					--values = Statics.ItemQuality,
					set = function(info, val)
						GLTOptions.includeGroup = val
					end,
					get = function(info)
						return GLTOptions.includeGroup
					end,
					order = 120
				}
			}
		},
		colourTab = {
			name = L["Colour"],
			desc = L["Colour and Accessibility Options"],
			type = "group",
			order = 3,
			args = {
				ctitle1 = {
					type = "header",
					name = L["General Options"],
					order = 100
				},
				titleColour = {
					type = "color",
					name = L["Title Colour"],
					desc = L["Picks a Custom Colour for the Mod Names."],
					order = 101,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.TitleColour)
					end,
					set = function(info, r, g, b, a)
						GLTOptions.TitleColour = string.format("|c%02x%02x%02x%02x", a * 255, r * 255, g * 255, b * 255)
					end
				},
				authorColour = {
					type = "color",
					name = L["Author Colour"],
					desc = L["Picks a Custom Colour for the Author."],
					order = 110,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.AuthorColour)
					end,
					set = function(info, r, g, b)
						GLTOptions.AuthorColour = string.format("|c%02x%02x%02x%02x", 255, r * 255, g * 255, b * 255)
					end
				},
				commandColour = {
					type = "color",
					name = L["Command Colour"],
					desc = L["Picks a Custom Colour for the Commands."],
					order = 120,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.CommandColour)
					end,
					set = function(info, r, g, b)
						GLTOptions.CommandColour = string.format("|c%02x%02x%02x%02x", 255, r * 255, g * 255, b * 255)
					end
				},
				emphasisColour = {
					type = "color",
					name = L["Emphasis Colour"],
					desc = L["Picks a Custom Colour for emphasis."],
					order = 130,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.EmphasisColour)
					end,
					set = function(info, r, g, b)
						GLTOptions.EmphasisColour = string.format("|c%02x%02x%02x%02x", 255, r * 255, g * 255, b * 255)
					end
				},
				normalColour = {
					type = "color",
					name = L["Normal Colour"],
					desc = L["Picks a Custom Colour to be used normally."],
					order = 140,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.NormalColour)
					end,
					set = function(info, r, g, b)
						GLTOptions.NormalColour = string.format("|c%02x%02x%02x%02x", 255, r * 255, g * 255, b * 255)
					end
				},
				ctitle2 = {
					type = "header",
					name = L["Editor Colours"],
					order = 200
				},
				keywordColour = {
					type = "color",
					name = L["Spell Colour"],
					desc = L["Picks a Custom Colour to be used for Spells and Abilities."],
					order = 210,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.KEYWORD)
					end,
					set = function(info, r, g, b)
						GLT.GUISetColour(GLTOptions.KEYWORD, r, g, b)
					end
				},
				unknownColour = {
					type = "color",
					name = L["Unknown Colour"],
					desc = L["Picks a Custom Colour to be used for unknown terms."],
					order = 220,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.UNKNOWN)
					end,
					set = function(info, r, g, b)
						GLT.GUISetColour(GLTOptions.UNKNOWN, r, g, b)
					end
				},
				iconColour = {
					type = "color",
					name = L["Icon Colour"],
					desc = L["Picks a Custom Colour to be used for Icons."],
					order = 230,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.CONCAT)
					end,
					set = function(info, r, g, b)
						GLT.GUISetColour(GLTOptions.CONCAT, r, g, b)
					end
				},
				numberColour = {
					type = "color",
					name = L["SpecID/ClassID Colour"],
					desc = L["Picks a Custom Colour to be used for numbers."],
					order = 240,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.NUMBER)
					end,
					set = function(info, r, g, b)
						GLT.GUISetColour(GLTOptions.NUMBER, r, g, b)
					end
				},
				stringColour = {
					type = "color",
					name = L["String Colour"],
					desc = L["Picks a Custom Colour to be used for strings."],
					hidden = true,
					order = 250,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.STRING)
					end,
					set = function(info, r, g, b)
						GLT.GUISetColour(GLTOptions.STRING, r, g, b)
					end
				},
				conditionalColour = {
					type = "color",
					name = L["Conditionals Colour"],
					desc = L["Picks a Custom Colour to be used for macro conditionals eg [mod:shift]"],
					order = 260,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.COMMENT)
					end,
					set = function(info, r, g, b)
						GLT.GUISetColour(GLTOptions.COMMENT, r, g, b)
					end
				},
				helpColour = {
					type = "color",
					name = L["Help Colour"],
					desc = L["Picks a Custom Colour to be used for braces and indents."],
					order = 270,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.INDENT)
					end,
					set = function(info, r, g, b)
						GLT.GUISetColour(GLTOptions.INDENT, r, g, b)
					end
				},
				stepColour = {
					type = "color",
					name = L["Step Functions"],
					desc = L["Picks a Custom Colour to be used for StepFunctions."],
					order = 280,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.EQUALS)
					end,
					set = function(info, r, g, b)
						GLT.GUISetColour(GLTOptions.EQUALS, r, g, b)
					end
				},
				languageColour = {
					type = "color",
					name = L["Language Colour"],
					desc = L["Picks a Custom Colour to be used for language descriptors"],
					order = 290,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.STANDARDFUNCS)
					end,
					set = function(info, r, g, b)
						GLT.GUISetColour(GLTOptions.STANDARDFUNCS, r, g, b)
					end
				},
				shortcutsColour = {
					type = "color",
					name = L["Blizzard Functions Colour"],
					desc = L["Picks a Custom Colour to be used for Macro Keywords like /cast and /target"],
					order = 300,
					hasAlpha = false,
					get = function(info)
						return GLT.GUIGetColour(GLTOptions.WOWSHORTCUTS)
					end,
					set = function(info, r, g, b)
						GLT.GUISetColour(GLTOptions.WOWSHORTCUTS, r, g, b)
					end
				}
			}
		},
		aboutTab = {
			name = L["About"],
			desc = L["About Guild Loot Tracker"],
			type = "group",
			order = 5,
			args = {
				-- aboutIcon = {
				--   type = "description",
				--   name = "",
				--   image = "Interface\\Addons\\GSE_GUI\\GSE2_Logo_Dark_512.tga",
				--   imageWidth = 100;
				--   imageHeight = 100;
				--   order = 5
				-- },
				title4 = {
					type = "header",
					name = L["History"],
					order = 10
				},
				aboutDescription = {
					type = "description",
					name = L["Guild Loot Tracker was written to track loot over multiple raid groups by TimothyLuke."],
					order = 20,
					image = "Interface\\Addons\\guild-loot-tracker\\Textures\\icon.tga",
					imageWidth = 120,
					imageHeight = 120
				}
				-- title5 = {
				--   type = "header",
				--   name = L["Supporters"],
				--   order = 30,
				-- },
				-- supportersDescription = {
				--   type = "description",
				--   name = L["The following people donate monthly via Patreon for the ongoing maintenance and development of GSE.  Their support is greatly appreciated."],
				--   order = 31,
				-- },
			}
		},
		debugTab = {
			name = L["Debug"],
			desc = L["Debug Mode Options"],
			type = "group",
			order = -1,
			args = {
				title4 = {
					type = "header",
					name = L["Debug Mode Options"],
					order = 1
				},
				debug = {
					name = L["Enable Mod Debug Mode"],
					desc = L["This option dumps extra trace information to your chat window to help troubleshoot problems with the mod"],
					type = "toggle",
					set = function(info, val)
						GLTOptions.debug = val
						GLT.PrintDebugMessage("Debug Mode Enabled", Statics.DebugModules["Events"])
					end,
					get = function(info)
						return GLTOptions.debug
					end,
					order = 10
				},
				title5 = {
					type = "header",
					name = L["Debug Output Options"],
					order = 20
				},
				debugchat = {
					name = L["Display debug messages in Chat Window"],
					desc = L["This will display debug messages in the Chat window."],
					type = "toggle",
					set = function(info, val)
						GLTOptions.sendDebugOutputToChatWindow = val
					end,
					get = function(info)
						return GLTOptions.sendDebugOutputToChatWindow
					end,
					order = 21
				},
				checkZone = {
					name = "CheckZone",
					desc = "Print out zone Information",
					--guiHidden = true,
					type = "execute",
					func = function(info)
						print(GLT.checkInstance())
					end,
					order = 25
				},
				-- printKeyPressModifiers={
				--   name = L["Print KeyPress Modifiers on Click"],
				--   desc = L["Print to the chat window if the alt, shift, control modifiers as well as the button pressed on each macro keypress."],
				--   type = "toggle",
				--   set = function(info,val) GLTOptions.DebugPrintModConditionsOnKeyPress = val end,
				--   get = function(info) return GLTOptions.DebugPrintModConditionsOnKeyPress end,
				--   order = 26
				-- },
				title6 = {
					type = "header",
					name = L["Enable Debug for the following Modules"],
					order = 30
				}
			}
		}
	}
}
