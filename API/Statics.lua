local GLT = GLT
local L = GLT.L

GLT.Static = {}

local Statics = GLT.Static

Statics.StringReset =  "|r"
Statics.CommPrefix = "GLT"
Statics.ItemQuality = {
	[0] = L["Grey"],
	[1] = L["White"],
	[2] = L['Green'],
	[3] = L["Blue"],
	[4] = L["Epic"],
	[5] = L["Legendary"]
}

Statics.RaidZones = {
    [249] = true, -- Onyxia's Lair
	[409] = true, -- Molten Core
	[469] = true, -- Blackwing Lair
	[509] = true, -- Ruins of Ahn'Qiraj
    [531] = true, -- Temple of Ahn'Qiraj
   	[533] = true, -- Naxxramas 
	-- Need ZG's Zone 
    [859] = true, -- Guessing
}

Statics.Encounters = {
	-- Molten Core
    [12118] = true, -- Lucifron
    [11982] = true, -- Magmadar
    [12259] = true, -- Gehennas
    [12057] = true, -- Garr
    [12264] = true, -- Shazzrah
    [12056] = true, -- Baron Geddon
    [11988] = true, -- Golemagg the Incinerator
    [12098] = true, -- Sulfuron Harbinger
    [12018] = true, -- Majordomo Executus
    [11502] = true, -- Ragnaros
  	-- Onyxias Lair
    [10184] = true, -- Onyxia
    -- Blackwing Lair
    [12435] = true, -- Razorgore the Untamed
    [13020] = true, -- Vaelastrasz the Corrupt
    [12017] = true, -- Broodlord Lashlayer
    [11983] = true, -- Firemaw
    [14601] = true, -- Ebonroc
    [11981] = true, -- Flamegor
    [14020] = true, -- Chromaggus
    [11583] = true, -- Nefarian
    -- Ruins of Ahn'Qiraj
    [15348] = true, -- Kurinnaxx
    [15341] = true, -- General Rajaxx
    [15340] = true, -- Moam
    [15370] = true, -- Buru the Gorger
    [15369] = true, -- Ayamiss the Hunter
    [15339] = true, -- Ossirian the Unscarred
    -- Temple of Ahn'Qiraj
    [15263] = true, -- The Prophet Skeram
    [15516] = true, -- Battleguard Sartura
    [15510] = true, -- Fankriss the Unyielding
    [15509] = true, -- Princess Huhuran
    [15276] = true, -- Twin Emperors
    [15589] = true, -- C'Thun
    [15544] = true, -- Bug Trio
    [15299] = true, -- Viscidus
    [15517] = true, -- Ouro
   -- Naxxramas
    [15956] = true, -- Anub'Rekhan
    [15953] = true, -- Grand Widow Faerlina
    [15952] = true, -- Maexxna
    [15954] = true, -- Noth the Plaguebringer
    [15936] = true, -- Heigan the Unclean
    [16011] = true, -- Loatheb
    [16061] = true, -- Instructor Razuvious
    [16060] = true, -- Gothik the Harvester
    [16063] = true, -- The Four Horsemen
    [16028] = true, -- Patchwerk
    [15931] = true, -- Grobbulus
    [15932] = true, -- Gluth
    [15928] = true, -- Thaddius
    [15989] = true, -- Sapphiron
    [15990] = true, -- Kel'Thuzad
   -- Zul'Gurub
}

Statics.DownloadLocation = "https://www.curseforge.com/wow/addons/GLT-gnome-sequencer-enhanced-advanced-macros"

StaticPopupDialogs['GLT_UPDATE_AVAILABLE'] = {
	text = L["Guild Loot Tracker is out of date. You can download the newest version from"] .. " " .. Statics.DownloadLocation,
	hasEditBox = 1,
	OnShow = function(self)
		self.editBox:SetAutoFocus(false)
		self.editBox:SetWidth(220)
		self.editBox:SetText(Statics.DownloadLocation)
		self.editBox:HighlightText()
		ChatEdit_FocusActiveWindow();
	end,
	OnHide = function(self)
		self.editBox:SetWidth(self.editBox.width or 50)
	end,
	hideOnEscape = 1,
	button1 = OKAY,
	EditBoxOnEnterPressed = function(self)
		ChatEdit_FocusActiveWindow();
		self:GetParent():Hide();
	end,
	EditBoxOnEscapePressed = function(self)
		ChatEdit_FocusActiveWindow();
		self:GetParent():Hide();
	end,
	EditBoxOnTextChanged = function(self)
		if(self:GetText() ~= Statics.DownloadLocation) then
			self:SetText(Statics.DownloadLocation)
		end
		self:HighlightText()
		self:ClearFocus()
		ChatEdit_FocusActiveWindow();
	end,
	OnEditFocusGained = function(self)
		self:HighlightText()
	end,
	showAlert = 1,
}