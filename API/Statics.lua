local GLT = GLT

GLT.Static = {}

local Statics = GLT.Static

Statics.StringReset =  "|r"

Statics.ItemQuality = {
	[0] = "Grey",
	[1] = "White",
	[2] = 'Green',
	[3] = "Blue",
	[4] = "Epic",
	[5] = "Legendary"
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
    [663] = 12118, -- Lucifron
    [664] = 11982, -- Magmadar
    [665] = 12259, -- Gehennas
    [666] = 12057, -- Garr
    [667] = 12264, -- Shazzrah
    [668] = 12056, -- Baron Geddon
    [670] = 11988, -- Golemagg the Incinerator
    [669] = 12098, -- Sulfuron Harbinger
    [671] = 12018, -- Majordomo Executus
    [672] = 11502, -- Ragnaros
  	-- Onyxias Lair
    [1084] = 10184, -- Onyxia
    -- Blackwing Lair
    [610] = 12435, -- Razorgore the Untamed
    [611] = 13020, -- Vaelastrasz the Corrupt
    [612] = 12017, -- Broodlord Lashlayer
    [613] = 11983, -- Firemaw
    [614] = 14601, -- Ebonroc
    [615] = 11981, -- Flamegor
    [616] = 14020, -- Chromaggus
    [617] = 11583, -- Nefarian
    -- Ruins of Ahn'Qiraj
    [718] = 15348, -- Kurinnaxx
    [719] = 15341, -- General Rajaxx
    [720] = 15340, -- Moam
    [721] = 15370, -- Buru the Gorger
    [722] = 15369, -- Ayamiss the Hunter
    [723] = 15339, -- Ossirian the Unscarred
    -- Temple of Ahn'Qiraj
    [709] = 15263, -- The Prophet Skeram
    [711] = 15516, -- Battleguard Sartura
    [712] = 15510, -- Fankriss the Unyielding
    [714] = 15509, -- Princess Huhuran
    [715] = 15276, -- Twin Emperors
    [717] = 15589, -- C'Thun
    [710] = 15544, -- Bug Trio
    [713] = 15299, -- Viscidus
    [716] = 15517, -- Ouro
   -- Naxxramas
    [1107] = 15956, -- Anub'Rekhan
    [1110] = 15953, -- Grand Widow Faerlina
    [1116] = 15952, -- Maexxna
    [1117] = 15954, -- Noth the Plaguebringer
    [1112] = 15936, -- Heigan the Unclean
    [1115] = 16011, -- Loatheb
    [1113] = 16061, -- Instructor Razuvious
    [1109] = 16060, -- Gothik the Harvester
    [1121] = 16063, -- The Four Horsemen
    [1118] = 16028, -- Patchwerk
    [1111] = 15931, -- Grobbulus
    [1108] = 15932, -- Gluth
    [1120] = 15928, -- Thaddius
    [1119] = 15989, -- Sapphiron
    [1114] = 15990, -- Kel'Thuzad


}