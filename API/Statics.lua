local GLT = GLT
local L = GLT.L

local Statics = GLT.Static

Statics.StringReset = "|r"
Statics.StringFormatEscapes = {
    ["|c%x%x%x%x%x%x%x%x"] = "", -- Color start
    ["|r"] = "", -- Color end
    ["|H.-|h(.-)|h"] = "%1", -- Links
    ["|T.-|t"] = "", -- Textures
    ["{.-}"] = "" -- Raid target icons
}

Statics.GLTPrefix = "|cffff00FFGLT:|r "

Statics.CommPrefix = "GLT"
Statics.ItemQuality = {
    [0] = L["Grey"],
    [1] = L["White"],
    [2] = L["Green"],
    [3] = L["Blue"],
    [4] = L["Epic"],
    [5] = L["Legendary"]
}

Statics.SerialisationCommands = {
    ["Version"] = "GLT_VERSIONCHK",
    ["GetRaidInfo"] = "GLT_GetRaidINFO",
    ["CloseRaid"] = "GLT_CLOSERAID",
    ["StartRaid"] = "GLT_STARTRAID",
    ["ListRaids"] = "GLT_LISTRAIDS",
    ["GetCurrentRaid"] = "GLT_GETCURRENTRAID",
    ["BroadcastLoot"] = "GLT_BROADCASTLOOT",
    ["MergeRaids"] = "GLT_MERGERAIDS",
    ["SendRaidInfo"] = "GLT_SendRaidINFO"
}

Statics.DebugModules = {
    ["Storage"] = "Storage",
    ["Transmission"] = "Transmission",
    ["Events"] = "Events",
    ["GUI"] = "GUI",
    ["Export"] = "Export"
}

Statics.Encounters = {
    -------------------------------------------------------------------------------
    -- Ahn'kahet: The Old Kingdom
    -------------------------------------------------------------------------------
    [29309] = true, -- Elder Nadox
    [29308] = true, -- Prince Taldaram (Ahn'kahet: The Old Kingdom)
    [29310] = true, -- Jedoga Shadowseeker
    [29311] = true, -- Herald Volazj
    [30258] = true, -- Amanitar (Heroic)
    -------------------------------------------------------------------------------
    -- Auchindoun
    -------------------------------------------------------------------------------
    [75839] = true, -- Vigilant Kaathar
    [76177] = true, -- Soulbinder Nyami
    [75927] = true, -- Azzakel
    [77734] = true, -- Teron'gor
    -------------------------------------------------------------------------------
    -- Auchindoun: Auchenai Crypts
    -------------------------------------------------------------------------------
    [18371] = true, -- Shirrak the Dead Watcher
    [18373] = true, -- Exarch Maladaar
    -------------------------------------------------------------------------------
    -- Auchindoun: Mana-Tombs
    -------------------------------------------------------------------------------
    [18341] = true, -- Pandemonius
    [18343] = true, -- Tavarok
    [22930] = true, -- Yor (Heroic)
    [18344] = true, -- Nexus-Prince Shaffar
    -------------------------------------------------------------------------------
    -- Auchindoun: Sethekk Halls
    -------------------------------------------------------------------------------
    [18472] = true, -- Darkweaver Syth
    [23035] = true, -- Anzu (Heroic)
    [18473] = true, -- Talon King Ikiss
    -------------------------------------------------------------------------------
    -- Auchindoun: Shadow Labyrinth
    -------------------------------------------------------------------------------
    [18731] = true, -- Ambassador Hellmaw
    [18667] = true, -- Blackheart the Inciter
    [18732] = true, -- Grandmaster Vorpil
    [18708] = true, -- Murmur
    -------------------------------------------------------------------------------
    -- Azjol-Nerub
    -------------------------------------------------------------------------------
    [28684] = true, -- Krik'thir the Gatewatcher
    [28921] = true, -- Hadronox
    [29120] = true, -- Anub'arak
    -------------------------------------------------------------------------------
    -- Azshara
    -------------------------------------------------------------------------------
    [14464] = true, -- Avalanchion
    [6109] = true, -- Azuregos
    -------------------------------------------------------------------------------
    -- Black Temple
    -------------------------------------------------------------------------------
    [22887] = true, -- High Warlord Naj'entus
    [22898] = true, -- Supremus
    [22841] = true, -- Shade of Akama
    [22871] = true, -- Teron Gorefiend
    [22948] = true, -- Gurtogg Bloodboil
    [23420] = true, -- Essence of Anger
    [23419] = true, -- Essence of Desire
    [23418] = true, -- Essence of Suffering
    [22947] = true, -- Mother Shahraz
    [23426] = true, -- Illidari Council
    [22917] = true, -- Illidan Stormrage	-- Not adding solo quest IDs for now
    [22949] = true, -- Gathios the Shatterer
    [22950] = true, -- High Nethermancer Zerevor
    [22951] = true, -- Lady Malande
    [22952] = true, -- Veras Darkshadow
    -------------------------------------------------------------------------------
    -- Blackfathom Deeps
    -------------------------------------------------------------------------------
    [4829] = true, -- Aku'mai
    [4830] = true, -- Old Serra'kis
    [4831] = true, -- Lady Sarevess
    [4832] = true, -- Twilight Lord Kelris
    [4887] = true, -- Ghamoo-ra
    [6243] = true, -- Gelihast
    [12876] = true, -- Baron Aquanis
    [12902] = true, -- Lorgus Jett
    -------------------------------------------------------------------------------
    -- Blackrock Depths: Detention Block
    -------------------------------------------------------------------------------
    [9018] = true, -- High Interrogator Gerstahn
    -------------------------------------------------------------------------------
    -- Blackrock Depths: Grim Guzzler
    -------------------------------------------------------------------------------
    [9543] = true, -- Ribbly Screwspigot
    [9537] = true, -- Hurley Blackbreath
    [9502] = true, -- Phalanx
    [9499] = true, -- Plugger Spazzring
    [23872] = true, -- Coren Direbrew
    -------------------------------------------------------------------------------
    -- Blackrock Depths: Halls of the Law
    -------------------------------------------------------------------------------
    [9025] = true, -- Lord Roccor
    [9319] = true, -- Houndmaster Grebmar
    -------------------------------------------------------------------------------
    -- Blackrock Depths: Inner Blackrock Depths
    -------------------------------------------------------------------------------
    [9156] = true, -- Ambassador Flamelash
    [8923] = true, -- Panzor the Invincible
    [9035] = true, -- Anger'rel
    [9039] = true, -- Doom'rel
    [9040] = true, -- Dope'rel
    [9037] = true, -- Gloom'rel
    [9034] = true, -- Hate'rel
    [9038] = true, -- Seeth'rel
    [9036] = true, -- Vile'rel
    [9938] = true, -- Magmus
    [10076] = true, -- High Priestess of Thaurissan
    [8929] = true, -- Princess Moira Bronzebeard
    [9019] = true, -- Emperor Dagran Thaurissan
    -------------------------------------------------------------------------------
    -- Blackrock Depths: Outer Blackrock Depths
    -------------------------------------------------------------------------------
    [9024] = true, -- Pyromancer Loregrain
    [9041] = true, -- Warder Stilgiss
    [9042] = true, -- Verek
    [9476] = true, -- Watchman Doomgrip
    [9056] = true, -- Fineous Darkvire
    [9017] = true, -- Lord Incendius
    [9016] = true, -- Bael'Gar
    [9033] = true, -- General Angerforge
    [8983] = true, -- Golem Lord Argelmach
    -- Dark Keepers, 6 of em: http://www.wowpedia.org/Dark_Keeper

    -------------------------------------------------------------------------------
    -- Blackrock Depths: Ring of Law (Arena)
    -------------------------------------------------------------------------------
    [9031] = true, -- Anub'shiah
    [9029] = true, -- Eviscerator
    [9027] = true, -- Gorosh the Dervish
    [9028] = true, -- Grizzle
    [9032] = true, -- Hedrum the Creeper
    [9030] = true, -- Ok'thor the Breaker
    [16059] = true, -- Theldren
    -------------------------------------------------------------------------------
    -- Blackwing Lair
    -------------------------------------------------------------------------------
    [12435] = true, -- Razorgore the Untamed
    [13020] = true, -- Vaelastrasz the Corrupt
    [12017] = true, -- Broodlord Lashlayer
    [11983] = true, -- Firemaw
    [14601] = true, -- Ebonroc
    [11981] = true, -- Flamegor
    [14020] = true, -- Chromaggus
    [11583] = true, -- Nefarian
    [12557] = true, -- Grethok the Controller
    [10162] = true, -- Lord Victor Nefarius <Lord of Blackrock> (Also found in Blackrock Spire)
    -------------------------------------------------------------------------------
    -- Caverns of Time: Battle for Mount Hyjal
    -------------------------------------------------------------------------------
    [17767] = true, -- Rage Winterchill
    [17808] = true, -- Anetheron
    [17888] = true, -- Kaz'rogal
    [17842] = true, -- Azgalor
    [17968] = true, -- Archimonde
    -------------------------------------------------------------------------------
    -- Caverns of Time: Culling of Stratholme
    -------------------------------------------------------------------------------
    [26529] = true, -- Meathook
    [26530] = true, -- Salramm the Fleshcrafter
    [26532] = true, -- Chrono-Lord Epoch
    [32273] = true, -- Infinite Corruptor
    [26533] = true, -- Mal'Ganis
    [29620] = true, -- Mal'Ganis
    -------------------------------------------------------------------------------
    -- Caverns of Time: Escape from Durnholde Keep
    -------------------------------------------------------------------------------
    [17848] = true, -- Lieutenant Drake
    [17862] = true, -- Captain Skarloc
    [18096] = true, -- Epoch Hunter
    [28132] = true, -- Don Carlos
    -------------------------------------------------------------------------------
    -- Caverns of Time: Opening the Dark Portal
    -------------------------------------------------------------------------------
    [17879] = true, -- Chrono Lord Deja
    [17880] = true, -- Temporus
    [17881] = true, -- Aeonus
    -------------------------------------------------------------------------------
    -- Coilfang Reservoir: Serpentshrine Cavern
    -------------------------------------------------------------------------------
    [21216] = true, -- Hydross the Unstable
    [21217] = true, -- The Lurker Below
    [21215] = true, -- Leotheras the Blind
    [21214] = true, -- Fathom-Lord Karathress
    [21213] = true, -- Morogrim Tidewalker
    [21212] = true, -- Lady Vashj
    [21875] = true, -- Shadow of Leotheras
    -------------------------------------------------------------------------------
    -- Coilfang Reservoir: Slave Pens
    -------------------------------------------------------------------------------
    [25740] = true, -- Ahune
    [17941] = true, -- Mennu the Betrayer
    [17991] = true, -- Rokmar the Crackler
    [17942] = true, -- Quagmirran
    -------------------------------------------------------------------------------
    -- Coilfang Reservoir: The Steamvault
    -------------------------------------------------------------------------------
    [17797] = true, -- Hydromancer Thespia
    [17796] = true, -- Mekgineer Steamrigger
    [17798] = true, -- Warlord Kalithresh
    -------------------------------------------------------------------------------
    -- Coilfang Reservoir: The Underbog
    -------------------------------------------------------------------------------
    [17770] = true, -- Hungarfen
    [18105] = true, -- Ghaz'an
    [17826] = true, -- Swamplord Musel'ek
    [17827] = true, -- Claw <Swamplord Musel'ek's Pet>
    [17882] = true, -- The Black Stalker
    -------------------------------------------------------------------------------
    -- Dire Maul: Arena
    -------------------------------------------------------------------------------
    [11447] = true, -- Mushgog
    [11498] = true, -- Skarr the Unbreakable
    [11497] = true, -- The Razza
    -------------------------------------------------------------------------------
    -- Dire Maul: East
    -------------------------------------------------------------------------------
    [14354] = true, -- Pusillin
    [14327] = true, -- Lethtendris
    [14349] = true, -- Pimgib
    [13280] = true, -- Hydrospawn
    [11490] = true, -- Zevrim Thornhoof
    [11492] = true, -- Alzzin the Wildshaper
    [16097] = true, -- Isalien
    -------------------------------------------------------------------------------
    -- Dire Maul: North
    -------------------------------------------------------------------------------
    [14326] = true, -- Guard Mol'dar
    [14322] = true, -- Stomper Kreeg
    [14321] = true, -- Guard Fengus
    [14323] = true, -- Guard Slip'kik
    [14325] = true, -- Captain Kromcrush
    [14324] = true, -- Cho'Rush the Observer
    [11501] = true, -- King Gordok
    -------------------------------------------------------------------------------
    -- Dire Maul: West
    -------------------------------------------------------------------------------
    [11489] = true, -- Tendris Warpwood
    [11487] = true, -- Magister Kalendris
    [11467] = true, -- Tsu'zee
    [11488] = true, -- Illyanna Ravenoak
    [14690] = true, -- Revanchion (Scourge Invasion)
    [11496] = true, -- Immol'thar
    [14506] = true, -- Lord Hel'nurath
    [11486] = true, -- Prince Tortheldrin
    -------------------------------------------------------------------------------
    -- Drak'Tharon Keep
    -------------------------------------------------------------------------------
    [26630] = true, -- Trollgore
    [26631] = true, -- Novos the Summoner
    [27483] = true, -- King Dred
    [26632] = true, -- The Prophet Tharon'ja
    [27696] = true, -- The Prophet Tharon'ja
    -------------------------------------------------------------------------------
    -- Forge of Souls
    -------------------------------------------------------------------------------
    [36497] = true, -- Bronjahm
    [36502] = true, -- Devourer of Souls
    -------------------------------------------------------------------------------
    -- Gnomeregan
    -------------------------------------------------------------------------------
    [7800] = true, -- Mekgineer Thermaplugg
    [7079] = true, -- Viscous Fallout
    [7361] = true, -- Grubbis
    [6235] = true, -- Electrocutioner 6000
    [6229] = true, -- Crowd Pummeler 9-60
    [6228] = true, -- Dark Iron Ambassador
    [6231] = true, -- Techbot, outside
    -------------------------------------------------------------------------------
    -- Gruul's Lair
    -------------------------------------------------------------------------------
    [18831] = true, -- High King Maulgar
    [19044] = true, -- Gruul the Dragonkiller
    -- Gruul's Lair: Maulgar's Ogre Council
    [18835] = true, -- Kiggler the Crazed
    [18836] = true, -- Blindeye the Seer
    [18834] = true, -- Olm the Summoner
    [18832] = true, -- Krosh Firehand
    -------------------------------------------------------------------------------
    -- Gundrak
    -------------------------------------------------------------------------------
    [29304] = true, -- Slad'ran
    [29305] = true, -- Moorabi
    [29307] = true, -- Drakkari Colossus
    [29306] = true, -- Gal'darah
    [29932] = true, -- Eck the Ferocious (Heroic)
    -------------------------------------------------------------------------------
    -- Halls of Lightning
    -------------------------------------------------------------------------------
    [28586] = true, -- General Bjarngrim
    [28587] = true, -- Volkhan
    [28546] = true, -- Ionar
    [28923] = true, -- Loken
    -------------------------------------------------------------------------------
    -- Halls of Reflection
    -------------------------------------------------------------------------------
    [38112] = true, -- Falric
    [38113] = true, -- Marwyn
    [37226] = true, -- The Lich King
    -------------------------------------------------------------------------------
    -- Halls of Stone
    -------------------------------------------------------------------------------
    [27977] = true, -- Krystallus
    [27975] = true, -- Maiden of Grief
    [28234] = true, -- The Tribunal of Ages
    [27978] = true, -- Sjonnir The Ironshaper
    -------------------------------------------------------------------------------
    -- Hellfire Citadel: Hellfire Ramparts
    -------------------------------------------------------------------------------
    [17306] = true, -- Watchkeeper Gargolmar
    [17308] = true, -- Omor the Unscarred
    [17537] = true, -- Vazruden
    [17307] = true, -- Vazruden the Herald
    [17536] = true, -- Nazan
    -------------------------------------------------------------------------------
    -- Hellfire Citadel: Magtheridon's Lair
    -------------------------------------------------------------------------------
    [17257] = true, -- Magtheridon
    -------------------------------------------------------------------------------
    -- Hellfire Citadel: Shattered Halls
    -------------------------------------------------------------------------------
    [16807] = true, -- Grand Warlock Nethekurse
    [20923] = true, -- Blood Guard Porung (Heroic)
    [16809] = true, -- Warbringer O'mrogg
    [16808] = true, -- Warchief Kargath Bladefist
    -------------------------------------------------------------------------------
    -- Hellfire Citadel: The Blood Furnace
    -------------------------------------------------------------------------------
    [17381] = true, -- The Maker
    [17380] = true, -- Broggok
    [17377] = true, -- Keli'dan the Breaker
    -------------------------------------------------------------------------------
    -- Hellfire Peninsula
    -------------------------------------------------------------------------------
    [18728] = true, -- Doom Lord Kazzak
    [12397] = true, -- Lord Kazzak
    -------------------------------------------------------------------------------
    -- Icecrown Citadel
    -------------------------------------------------------------------------------
    [36612] = true, -- Lord Marrowgar
    [36855] = true, -- Lady Deathwhisper
    -- Gunship Battle
    [37813] = true, -- Deathbringer Saurfang
    [36626] = true, -- Festergut
    [36627] = true, -- Rotface
    [36678] = true, -- Professor Putricide
    [37972] = true, -- Prince Keleseth (Icecrown Citadel)
    [37970] = true, -- Prince Valanar
    [37973] = true, -- Prince Taldaram (Icecrown Citadel)
    [37955] = true, -- Queen Lana'thel
    [36789] = true, -- Valithria Dreamwalker
    [37950] = true, -- Valithria Dreamwalker (Phased)
    [37868] = true, -- Risen Archmage, Valitrhia Add
    [36791] = true, -- Blazing Skeleton, Valithria Add
    [37934] = true, -- Blistering Zombie, Valithria Add
    [37886] = true, -- Gluttonous Abomination, Valithria Add
    [37985] = true, -- Dream Cloud , Valithria "Add"
    [36853] = true, -- Sindragosa
    [36597] = true, -- The Lich King (Icecrown Citadel)
    [37217] = true, -- Precious
    [37025] = true, -- Stinki
    [36661] = true, -- Rimefang <Drake of Tyrannus>
    -------------------------------------------------------------------------------
    -- Karazhan
    -------------------------------------------------------------------------------
    [15550] = true, -- Attumen the Huntsman
    [16151] = true, -- Midnight
    [28194] = true, -- Tenris Mirkblood (Scourge invasion)
    [15687] = true, -- Moroes
    [16457] = true, -- Maiden of Virtue
    [15691] = true, -- The Curator
    [15688] = true, -- Terestian Illhoof
    [16524] = true, -- Shade of Aran
    [15689] = true, -- Netherspite
    [15690] = true, -- Prince Malchezaar
    [17225] = true, -- Nightbane
    [17229] = true, -- Kil'rek
    -- Chess event

    -------------------------------------------------------------------------------
    -- Karazhan: Servants' Quarters Beasts
    -------------------------------------------------------------------------------
    [16179] = true, -- Hyakiss the Lurker
    [16181] = true, -- Rokad the Ravager
    [16180] = true, -- Shadikith the Glider
    -------------------------------------------------------------------------------
    -- Karazhan: Opera Event
    -------------------------------------------------------------------------------
    [17535] = true, -- Dorothee
    [17546] = true, -- Roar
    [17543] = true, -- Strawman
    [17547] = true, -- Tinhead
    [17548] = true, -- Tito
    [18168] = true, -- The Crone
    [17521] = true, -- The Big Bad Wolf
    [17533] = true, -- Romulo
    [17534] = true, -- Julianne
    -------------------------------------------------------------------------------
    -- Lower Blackrock Spire
    -------------------------------------------------------------------------------
    [10263] = true, -- Burning Felguard
    [9218] = true, -- Spirestone Battle Lord
    [9219] = true, -- Spirestone Butcher
    [9217] = true, -- Spirestone Lord Magus
    [9196] = true, -- Highlord Omokk
    [9236] = true, -- Shadow Hunter Vosh'gajin
    [9237] = true, -- War Master Voone
    [16080] = true, -- Mor Grayhoof
    [9596] = true, -- Bannok Grimaxe
    [10596] = true, -- Mother Smolderweb
    [10376] = true, -- Crystal Fang
    [10584] = true, -- Urok Doomhowl
    [9736] = true, -- Quartermaster Zigris
    [10220] = true, -- Halycon
    [10268] = true, -- Gizrul the Slavener
    [9718] = true, -- Ghok Bashguud
    [9568] = true, -- Overlord Wyrmthalak
    -------------------------------------------------------------------------------
    -- Magisters' Terrace
    -------------------------------------------------------------------------------
    [24723] = true, -- Selin Fireheart
    [24744] = true, -- Vexallus
    [24560] = true, -- Priestess Delrissa
    [24664] = true, -- Kael'thas Sunstrider
    -------------------------------------------------------------------------------
    -- Maraudon
    -------------------------------------------------------------------------------
    -- [13718]	= true,	-- The Nameless Prophet (Pre-instance)
    [13742] = true, -- Kolk <The First Khan>
    [13741] = true, -- Gelk <The Second Khan>
    [13740] = true, -- Magra <The Third Khan>
    [13739] = true, -- Maraudos <The Fourth Khan>
    [12236] = true, -- Lord Vyletongue
    [13738] = true, -- Veng <The Fifth Khan>
    [13282] = true, -- Noxxion
    [12258] = true, -- Razorlash
    [12237] = true, -- Meshlok the Harvester
    [12225] = true, -- Celebras the Cursed
    [12203] = true, -- Landslide
    [13601] = true, -- Tinkerer Gizlock
    [13596] = true, -- Rotgrip
    [12201] = true, -- Princess Theradras
    -------------------------------------------------------------------------------
    -- Molten Core
    -------------------------------------------------------------------------------
    [12118] = true, -- Lucifron
    [11982] = true, -- Magmadar
    [12259] = true, -- Gehennas
    [12057] = true, -- Garr
    [12056] = true, -- Baron Geddon
    [12264] = true, -- Shazzrah
    [12098] = true, -- Sulfuron Harbinger
    [11988] = true, -- Golemagg the Incinerator
    [12018] = true, -- Majordomo Executus
    [11502] = true, -- Ragnaros
    -------------------------------------------------------------------------------
    -- Nagrand
    -------------------------------------------------------------------------------
    [18398] = true, -- Brokentoe
    [18069] = true, -- Mogor <Hero of the Warmaul>, friendly
    [18399] = true, -- Murkblood Twin
    [18400] = true, -- Rokdar the Sundered Lord
    [18401] = true, -- Skra'gath
    [18402] = true, -- Warmaul Champion
    -------------------------------------------------------------------------------
    -- Naxxramas
    -------------------------------------------------------------------------------
    [30549] = true, -- Baron Rivendare (Naxxramas)
    [16803] = true, -- Death Knight Understudy
    [15930] = true, -- Feugen
    [15929] = true, -- Stalagg
    -------------------------------------------------------------------------------
    -- Naxxramas: Abomination Wing
    -------------------------------------------------------------------------------
    [16028] = true, -- Patchwerk
    [15931] = true, -- Grobbulus
    [15932] = true, -- Gluth
    [15928] = true, -- Thaddius
    -------------------------------------------------------------------------------
    -- Naxxramas: Deathknight Wing
    -------------------------------------------------------------------------------
    [16061] = true, -- Instructor Razuvious
    [16060] = true, -- Gothik the Harvester
    -------------------------------------------------------------------------------
    -- Naxxramas: Frostwyrm Lair
    -------------------------------------------------------------------------------
    [15989] = true, -- Sapphiron
    [15990] = true, -- Kel'Thuzad
    [25465] = true, -- Kel'Thuzad
    -------------------------------------------------------------------------------
    -- Naxxramas: Plague Wing
    -------------------------------------------------------------------------------
    [15954] = true, -- Noth the Plaguebringer
    [15936] = true, -- Heigan the Unclean
    [16011] = true, -- Loatheb
    -------------------------------------------------------------------------------
    -- Naxxramas: Spider Wing
    -------------------------------------------------------------------------------
    [15956] = true, -- Anub'Rekhan
    [15953] = true, -- Grand Widow Faerlina
    [15952] = true, -- Maexxna
    -------------------------------------------------------------------------------
    -- Naxxramas: The Four Horsemen
    -------------------------------------------------------------------------------
    [16065] = true, -- Lady Blaumeux
    [16064] = true, -- Thane Korth'azz
    [16062] = true, -- Highlord Mograine
    [16063] = true, -- Sir Zeliek
    -------------------------------------------------------------------------------
    -- Obsidian Sanctum
    -------------------------------------------------------------------------------
    [30451] = true, -- Shadron
    [30452] = true, -- Tenebron
    [30449] = true, -- Vesperon
    [28860] = true, -- Sartharion
    -------------------------------------------------------------------------------
    -- Onyxia's Lair
    -------------------------------------------------------------------------------
    [10184] = true, -- Onyxia
    -------------------------------------------------------------------------------
    -- Pit of Saron
    -------------------------------------------------------------------------------
    [36494] = true, -- Forgemaster Garfrost
    [36477] = true, -- Krick
    [36476] = true, -- Ick <Krick's Minion>
    [36658] = true, -- Scourgelord Tyrannus
    -------------------------------------------------------------------------------
    -- Ragefire Chasm
    -------------------------------------------------------------------------------
    [11517] = true, -- Oggleflint
    [11518] = true, -- Jergosh the Invoker
    [11519] = true, -- Bazzalan
    [11520] = true, -- Taragaman the Hungerer
    [17830] = true, -- Zelemar the Wrathful
    -------------------------------------------------------------------------------
    -- Razorfen Downs
    -------------------------------------------------------------------------------
    [7355] = true, -- Tuten'kash
    [14686] = true, -- Lady Falther'ess (Scourge invasion only)
    [7356] = true, -- Plaguemaw the Rotting
    [7357] = true, -- Mordresh Fire Eye
    [8567] = true, -- Glutton
    [7354] = true, -- Ragglesnout
    [7358] = true, -- Amnennar the Coldbringer
    -------------------------------------------------------------------------------
    -- Razorfen Kraul
    -------------------------------------------------------------------------------
    [4421] = true, -- Charlga Razorflank
    [4420] = true, -- Overlord Ramtusk
    [4422] = true, -- Agathelos the Raging
    [4428] = true, -- Death Speaker Jargba
    [4424] = true, -- Aggem Thorncurse
    [6168] = true, -- Roogug
    [4425] = true, -- Blind Hunter
    [4842] = true, -- Earthcaller Halmgar
    -------------------------------------------------------------------------------
    -- Ruby Sanctum
    -------------------------------------------------------------------------------
    [39746] = true, -- Zarithrian
    [39747] = true, -- Saviana
    [39751] = true, -- Baltharus
    [39863] = true, -- Halion
    [39899] = true, -- Baltharus (Copy has an own id apparently)
    [40142] = true, -- Halion (twilight realm)
    -------------------------------------------------------------------------------
    -- Ruins of Ahn'Qiraj
    -------------------------------------------------------------------------------
    [15348] = true, -- Kurinnaxx
    [15341] = true, -- General Rajaxx
    [15340] = true, -- Moam
    [15370] = true, -- Buru the Gorger
    [15369] = true, -- Ayamiss the Hunter
    [15339] = true, -- Ossirian the Unscarred
    -------------------------------------------------------------------------------
    -- Scarlet Monastery: Armory
    -------------------------------------------------------------------------------
    [3975] = true, -- Herod
    -------------------------------------------------------------------------------
    -- Scarlet Monastery: Cathedral
    -------------------------------------------------------------------------------
    [4542] = true, -- High Inquisitor Fairbanks
    [3976] = true, -- Scarlet Commander Mograine
    [3977] = true, -- High Inquisitor Whitemane
    -------------------------------------------------------------------------------
    -- Scarlet Monastery: Graveyard
    -------------------------------------------------------------------------------
    [3983] = true, -- Interrogator Vishas
    [6488] = true, -- Fallen Champion
    [6490] = true, -- Azshir the Sleepless
    [6489] = true, -- Ironspine
    [14693] = true, -- Scorn (Scourge invasion only)
    [4543] = true, -- Bloodmage Thalnos
    [23682] = true, -- Headless Horseman
    [23800] = true, -- Headless Horseman
    -------------------------------------------------------------------------------
    -- Scarlet Monastery: Library
    -------------------------------------------------------------------------------
    [3974] = true, -- Houndmaster Loksey
    [6487] = true, -- Arcanist Doan
    -------------------------------------------------------------------------------
    -- Scholomance
    -------------------------------------------------------------------------------
    [14861] = true, -- Blood Steward of Kirtonos
    [10506] = true, -- Kirtonos the Herald
    [14695] = true, -- Lord Blackwood (Scourge Invasion)
    [10503] = true, -- Jandice Barov
    [11622] = true, -- Rattlegore
    [14516] = true, -- Death Knight Darkreaver
    [10433] = true, -- Marduk Blackpool
    [10432] = true, -- Vectus
    [16118] = true, -- Kormok
    [10508] = true, -- Ras Frostwhisper
    [10505] = true, -- Instructor Malicia
    [11261] = true, -- Doctor Theolen Krastinov
    [10901] = true, -- Lorekeeper Polkelt
    [10507] = true, -- The Ravenian
    [10504] = true, -- Lord Alexei Barov
    [10502] = true, -- Lady Illucia Barov
    [1853] = true, -- Darkmaster Gandling
    [58633] = true, -- Instructor Chillheart (MoP Heroic)
    [59200] = true, -- Lilian Voss (MoP Heroic)
    -------------------------------------------------------------------------------
    -- Searing Gorge
    -------------------------------------------------------------------------------
    [9026] = true, -- Overmaster Pyron
    -------------------------------------------------------------------------------
    -- Shadowfang Keep
    -------------------------------------------------------------------------------
    [3914] = true, -- Rethilgore
    [3886] = true, -- Razorclaw the Butcher
    [4279] = true, -- Odo the Blindwatcher
    [3887] = true, -- Baron Silverlaine
    [4278] = true, -- Commander Springvale
    [4274] = true, -- Fenrus the Devourer
    [3927] = true, -- Wolf Master Nandos
    [14682] = true, -- Sever (Scourge invasion only)
    [4275] = true, -- Archmage Arugal
    [3872] = true, -- Deathsworn Captain
    [46962] = true, -- Baron Ashbury
    [46963] = true, -- Lord Walden
    [46964] = true, -- Lord Godfrey
    -------------------------------------------------------------------------------
    -- Shadowmoon Valley
    -------------------------------------------------------------------------------
    [17711] = true, -- Doomwalker
    -------------------------------------------------------------------------------
    -- Silithus
    -------------------------------------------------------------------------------
    [15205] = true, -- Baron Kazum <Abyssal High Council>
    [15204] = true, -- High Marshal Whirlaxis <Abyssal High Council>
    [15305] = true, -- Lord Skwol <Abyssal High Council>
    [15203] = true, -- Prince Skaldrenox <Abyssal High Council>
    [14454] = true, -- The Windreaver
    -------------------------------------------------------------------------------
    -- Stormwind Stockade
    -------------------------------------------------------------------------------
    [1716] = true, -- Bazil Thredd
    [1663] = true, -- Dextren Ward
    [1717] = true, -- Hamhock
    [1666] = true, -- Kam Deepfury
    [1696] = true, -- Targorr the Dread
    [1720] = true, -- Bruegal Ironknuckle
    -- Cata:
    [46383] = true, -- Randolph Moloch
    [46264] = true, -- Lord Overheat
    [46254] = true, -- Hogger
    -------------------------------------------------------------------------------
    -- Stratholme: Scarlet Stratholme
    -------------------------------------------------------------------------------
    [10393] = true, -- Skul
    [14684] = true, -- Balzaphon (Scourge Invasion)
    -- [11082]	= true,	-- Stratholme Courier
    [11058] = true, -- Fras Siabi
    [10558] = true, -- Hearthsinger Forresten
    [10516] = true, -- The Unforgiven
    [16387] = true, -- Atiesh
    [11143] = true, -- Postmaster Malown
    [10808] = true, -- Timmy the Cruel
    [11032] = true, -- Malor the Zealous
    [11120] = true, -- Crimson Hammersmith
    [10997] = true, -- Cannon Master Willey
    [10811] = true, -- Archivist Galford
    [10813] = true, -- Balnazzar
    [16101] = true, -- Jarien
    [16102] = true, -- Sothos
    -------------------------------------------------------------------------------
    -- Stratholme: Defenders of the Chapel
    -------------------------------------------------------------------------------
    [17913] = true, -- Aelmar the Vanquisher
    [17911] = true, -- Cathela the Seeker
    [17910] = true, -- Gregor the Justiciar
    [17914] = true, -- Vicar Hieronymus
    [17912] = true, -- Nemas the Arbiter
    -------------------------------------------------------------------------------
    -- Stratholme: Undead Stratholme
    -------------------------------------------------------------------------------
    [10809] = true, -- Stonespine
    [10437] = true, -- Nerub'enkan
    [10436] = true, -- Baroness Anastari
    [11121] = true, -- Black Guard Swordsmith
    [10438] = true, -- Maleki the Pallid
    [10435] = true, -- Magistrate Barthilas
    [10439] = true, -- Ramstein the Gorger
    [10440] = true, -- Baron Rivendare (Stratholme)
    -------------------------------------------------------------------------------
    -- Sunwell Plateau
    -------------------------------------------------------------------------------
    [24891] = true, -- Kalecgos
    [25319] = true, -- Kalecgos
    [24850] = true, -- Kalecgos
    [24882] = true, -- Brutallus
    [25038] = true, -- Felmyst
    [25165] = true, -- Lady Sacrolash
    [25166] = true, -- Grand Warlock Alythess
    [25741] = true, -- M'uru
    [25315] = true, -- Kil'jaeden
    [25840] = true, -- Entropius
    [24892] = true, -- Sathrovarr the Corruptor
    -------------------------------------------------------------------------------
    -- Tempest Keep: The Arcatraz
    -------------------------------------------------------------------------------
    [20870] = true, -- Zereketh the Unbound
    [20886] = true, -- Wrath-Scryer Soccothrates
    [20885] = true, -- Dalliah the Doomsayer
    [20912] = true, -- Harbinger Skyriss
    [20904] = true, -- Warden Mellichar
    -------------------------------------------------------------------------------
    -- Tempest Keep: The Botanica
    -------------------------------------------------------------------------------
    [17976] = true, -- Commander Sarannis
    [17975] = true, -- High Botanist Freywinn
    [17978] = true, -- Thorngrin the Tender
    [17980] = true, -- Laj
    [17977] = true, -- Warp Splinter
    -------------------------------------------------------------------------------
    -- Tempest Keep: The Eye
    -------------------------------------------------------------------------------
    [19514] = true, -- Al'ar
    [19516] = true, -- Void Reaver
    [18805] = true, -- High Astromancer Solarian
    [19622] = true, -- Kael'thas Sunstrider
    [20064] = true, -- Thaladred the Darkener
    [20060] = true, -- Lord Sanguinar
    [20062] = true, -- Grand Astromancer Capernian
    [20063] = true, -- Master Engineer Telonicus
    [21270] = true, -- Cosmic Infuser
    [21269] = true, -- Devastation
    [21271] = true, -- Infinity Blades
    [21268] = true, -- Netherstrand Longbow
    [21273] = true, -- Phaseshift Bulwark
    [21274] = true, -- Staff of Disintegration
    [21272] = true, -- Warp Slicer
    -------------------------------------------------------------------------------
    -- Tempest Keep: The Mechanar
    -------------------------------------------------------------------------------
    [19218] = true, -- Gatewatcher Gyro-Kill
    [19710] = true, -- Gatewatcher Iron-Hand
    [19219] = true, -- Mechano-Lord Capacitus
    [19221] = true, -- Nethermancer Sepethrea
    [19220] = true, -- Pathaleon the Calculator
    -------------------------------------------------------------------------------
    -- Temple of Ahn'Qiraj
    -------------------------------------------------------------------------------
    [15263] = true, -- The Prophet Skeram
    [15511] = true, -- Lord Kri
    [15543] = true, -- Princess Yauj
    [15544] = true, -- Vem
    [15516] = true, -- Battleguard Sartura
    [15510] = true, -- Fankriss the Unyielding
    [15299] = true, -- Viscidus
    [15509] = true, -- Princess Huhuran
    [15276] = true, -- Emperor Vek'lor
    [15275] = true, -- Emperor Vek'nilash
    [15517] = true, -- Ouro
    [15727] = true, -- C'Thun
    [15589] = true, -- Eye of C'Thun
    -------------------------------------------------------------------------------
    -- Temple of Atal'Hakkar
    -------------------------------------------------------------------------------
    [1063] = true, -- Jade
    [5400] = true, -- Zekkis
    [5713] = true, -- Gasher
    [5715] = true, -- Hukku
    [5714] = true, -- Loro
    [5717] = true, -- Mijan
    [5712] = true, -- Zolo
    [5716] = true, -- Zul'Lor
    [5399] = true, -- Veyzhak the Cannibal
    [5401] = true, -- Kazkaz the Unholy
    [8580] = true, -- Atal'alarion
    [8443] = true, -- Avatar of Hakkar
    [5711] = true, -- Ogom the Wretched
    [5710] = true, -- Jammal'an the Prophet
    [5721] = true, -- Dreamscythe
    [5720] = true, -- Weaver
    [5719] = true, -- Morphaz
    [5722] = true, -- Hazzas
    [5709] = true, -- Shade of Eranikus
    -------------------------------------------------------------------------------
    -- The Deadmines
    -------------------------------------------------------------------------------
    [642] = true, -- Sneed's Shredder
    [643] = true, -- Sneed
    [644] = true, -- Rhahk'Zor
    [645] = true, -- Cookie
    [646] = true, -- Mr. Smite
    [647] = true, -- Captain Greenskin
    [3586] = true, -- Miner Johnson
    [1763] = true, -- Gilnid
    [639] = true, -- Edwin VanCleef
    [596] = true, -- Brainwashed Noble, outside
    [626] = true, -- Foreman Thistlenettle, outside
    [599] = true, -- Marisa du'Paige, outside
    [47162] = true, -- Glubtok
    [47296] = true, -- Helix Gearbreaker
    [43778] = true, -- Foe Reaper 5000
    [47626] = true, -- Admiral Ripsnarl
    [47739] = true, -- "Captain" Cookie
    [49541] = true, -- Vanessa VanCleef
    -------------------------------------------------------------------------------
    -- The Everbloom
    -------------------------------------------------------------------------------
    [81522] = true, -- Witherbark
    [83892] = true, -- Ancient Protectors - Life Warden Gola
    [83893] = true, -- Ancient Protectors - Earthshaper Telu
    [83894] = true, -- Ancient Protectors - Dulhu
    [84550] = true, -- Xeri'tac
    [82682] = true, -- Archmage Sol
    [83846] = true, -- Yalnu
    -------------------------------------------------------------------------------
    -- The Eye of Eternity
    -------------------------------------------------------------------------------
    [28859] = true, -- Malygos
    -------------------------------------------------------------------------------
    -- The Nexus
    -------------------------------------------------------------------------------
    [26798] = true, -- Commander Kolurg (Heroic)
    [26796] = true, -- Commander Stoutbeard (Heroic)
    [26731] = true, -- Grand Magus Telestra
    [26832] = true, -- Grand Magus Telestra
    [26928] = true, -- Grand Magus Telestra
    [26929] = true, -- Grand Magus Telestra
    [26930] = true, -- Grand Magus Telestra
    [26763] = true, -- Anomalus
    [26794] = true, -- Ormorok the Tree-Shaper
    [26723] = true, -- Keristrasza
    -------------------------------------------------------------------------------
    -- The Oculus
    -------------------------------------------------------------------------------
    [27654] = true, -- Drakos the Interrogator
    [27447] = true, -- Varos Cloudstrider
    [27655] = true, -- Mage-Lord Urom
    [27656] = true, -- Ley-Guardian Eregos
    -------------------------------------------------------------------------------
    -- The Stonecore
    -------------------------------------------------------------------------------
    [43438] = true, -- Corborus
    [43214] = true, -- Slabhide
    [42188] = true, -- Ozruk
    [42333] = true, -- High Priestess Azil
    -------------------------------------------------------------------------------
    -- The Violet Hold
    -------------------------------------------------------------------------------
    [29315] = true, -- Erekem
    [29313] = true, -- Ichoron
    [29312] = true, -- Lavanthor
    [29316] = true, -- Moragg
    [29266] = true, -- Xevozz
    [29314] = true, -- Zuramat the Obliterator
    [31134] = true, -- Cyanigosa
    -------------------------------------------------------------------------------
    -- Trial of the Champion
    -------------------------------------------------------------------------------
    -- Alliance
    [35617] = true, -- Deathstalker Visceri <Grand Champion of Undercity>
    [35569] = true, -- Eressea Dawnsinger <Grand Champion of Silvermoon>
    [35572] = true, -- Mokra the Skullcrusher <Grand Champion of Orgrimmar>
    [35571] = true, -- Runok Wildmane <Grand Champion of the Thunder Bluff>
    [35570] = true, -- Zul'tore <Grand Champion of Sen'jin>
    -- Horde
    [34702] = true, -- Ambrose Boltspark <Grand Champion of Gnomeregan>
    [34701] = true, -- Colosos <Grand Champion of the Exodar>
    [34705] = true, -- Marshal Jacob Alerius <Grand Champion of Stormwind>
    [34657] = true, -- Jaelyne Evensong <Grand Champion of Darnassus>
    [34703] = true, -- Lana Stouthammer <Grand Champion of Ironforge>
    -- Neutral
    [34928] = true, -- Argent Confessor Paletress
    [35119] = true, -- Eadric the Pure
    [35451] = true, -- The Black Knight
    -------------------------------------------------------------------------------
    -- Trial of the Crusader
    -------------------------------------------------------------------------------
    [34796] = true, -- Gormok
    [35144] = true, -- Acidmaw
    [34799] = true, -- Dreadscale
    [34797] = true, -- Icehowl
    [34780] = true, -- Jaraxxus
    [34461] = true, -- Tyrius Duskblade <Death Knight>
    [34460] = true, -- Kavina Grovesong <Druid>
    [34469] = true, -- Melador Valestrider <Druid>
    [34467] = true, -- Alyssia Moonstalker <Hunter>
    [34468] = true, -- Noozle Whizzlestick <Mage>
    [34465] = true, -- Velanaa <Paladin>
    [34471] = true, -- Baelnor Lightbearer <Paladin>
    [34466] = true, -- Anthar Forgemender <Priest>
    [34473] = true, -- Brienna Nightfell <Priest>
    [34472] = true, -- Irieth Shadowstep <Rogue>
    [34470] = true, -- Saamul <Shaman>
    [34463] = true, -- Shaabad <Shaman>
    [34474] = true, -- Serissa Grimdabbler <Warlock>
    [34475] = true, -- Shocuul <Warrior>
    [34458] = true, -- Gorgrim Shadowcleave <Death Knight>
    [34451] = true, -- Birana Stormhoof <Druid>
    [34459] = true, -- Erin Misthoof <Druid>
    [34448] = true, -- Ruj'kah <Hunter>
    [34449] = true, -- Ginselle Blightslinger <Mage>
    [34445] = true, -- Liandra Suncaller <Paladin>
    [34456] = true, -- Malithas Brightblade <Paladin>
    [34447] = true, -- Caiphus the Stern <Priest>
    [34441] = true, -- Vivienne Blackwhisper <Priest>
    [34454] = true, -- Maz'dinah <Rogue>
    [34444] = true, -- Thrakgar	<Shaman>
    [34455] = true, -- Broln Stouthorn <Shaman>
    [34450] = true, -- Harkzog <Warlock>
    [34453] = true, -- Narrhok Steelbreaker <Warrior>
    [35610] = true, -- Cat <Ruj'kah's Pet / Alyssia Moonstalker's Pet>
    [35465] = true, -- Zhaagrym <Harkzog's Minion / Serissa Grimdabbler's Minion>
    [34497] = true, -- Fjola Lightbane
    [34496] = true, -- Eydis Darkbane
    [34564] = true, -- Anub'arak (Trial of the Crusader)
    -------------------------------------------------------------------------------
    -- Uldaman
    -------------------------------------------------------------------------------
    [7057] = true, -- Digmaster Shovelphlange
    [6910] = true, -- Revelosh
    [7228] = true, -- Ironaya
    [7023] = true, -- Obsidian Sentinel
    [7206] = true, -- Ancient Stone Keeper
    [7291] = true, -- Galgann Firehammer
    [4854] = true, -- Grimlok
    [2748] = true, -- Archaedas
    [6906] = true, -- Baelog
    -------------------------------------------------------------------------------
    -- Ulduar: The Antechamber of Ulduar
    -------------------------------------------------------------------------------
    [32867] = true, -- Steelbreaker
    [32927] = true, -- Runemaster Molgeim
    [32857] = true, -- Stormcaller Brundir
    [32930] = true, -- Kologarn
    [33515] = true, -- Auriaya
    [34035] = true, -- Feral Defender
    [32933] = true, -- Left Arm
    [32934] = true, -- Right Arm
    [33524] = true, -- Saronite Animus
    -------------------------------------------------------------------------------
    -- Ulduar: The Celestial Planetarium
    -------------------------------------------------------------------------------
    [32871] = true, -- Algalon the Observer
    -------------------------------------------------------------------------------
    -- Ulduar: The Descent into Madness
    -------------------------------------------------------------------------------
    [33271] = true, -- General Vezax
    [33890] = true, -- Brain of Yogg-Saron
    [33136] = true, -- Guardian of Yogg-Saron
    [33288] = true, -- Yogg-Saron
    [32915] = true, -- Elder Brightleaf
    [32913] = true, -- Elder Ironbranch
    [32914] = true, -- Elder Stonebark
    [32882] = true, -- Jormungar Behemoth
    [33432] = true, -- Leviathan Mk II
    [34014] = true, -- Sanctum Sentry
    -------------------------------------------------------------------------------
    -- Ulduar: The Keepers of Ulduar
    -------------------------------------------------------------------------------
    [33350] = true, -- Mimiron
    [32906] = true, -- Freya
    [32865] = true, -- Thorim
    [32845] = true, -- Hodir
    -------------------------------------------------------------------------------
    -- Ulduar: The Siege of Ulduar
    -------------------------------------------------------------------------------
    [33113] = true, -- Flame Leviathan
    [33118] = true, -- Ignis the Furnace Master
    [33186] = true, -- Razorscale
    [33293] = true, -- XT-002 Deconstructor
    [33670] = true, -- Aerial Command Unit
    [33329] = true, -- Heart of the Deconstructor
    [33651] = true, -- VX-001
    -------------------------------------------------------------------------------
    -- Un'Goro Crater
    -------------------------------------------------------------------------------
    [14461] = true, -- Baron Charr
    -------------------------------------------------------------------------------
    -- Upper Blackrock Spire
    -------------------------------------------------------------------------------
    [76413] = true, -- Orebender Gor'ashan
    [76021] = true, -- Kyrak
    [79912] = true, -- Commander Tharbek
    [76585] = true, -- Ragewing the Untamed
    [77120] = true, -- Warlord Zaela
    -------------------------------------------------------------------------------
    -- Utgarde Keep: Main Bosses
    -------------------------------------------------------------------------------
    [23953] = true, -- Prince Keleseth (Utgarde Keep)
    [27390] = true, -- Skarvald the Constructor
    [24200] = true, -- Skarvald the Constructor
    [23954] = true, -- Ingvar the Plunderer
    [23980] = true, -- Ingvar the Plunderer
    -------------------------------------------------------------------------------
    -- Utgarde Keep: Secondary Bosses
    -------------------------------------------------------------------------------
    [27389] = true, -- Dalronn the Controller
    [24201] = true, -- Dalronn the Controller
    -------------------------------------------------------------------------------
    -- Utgarde Pinnacle
    -------------------------------------------------------------------------------
    [26668] = true, -- Svala Sorrowgrave
    [26687] = true, -- Gortok Palehoof
    [26693] = true, -- Skadi the Ruthless
    [26861] = true, -- King Ymiron
    -------------------------------------------------------------------------------
    -- Wailing Caverns
    -------------------------------------------------------------------------------
    [5775] = true, -- Verdan the Everliving
    [3670] = true, -- Lord Pythas
    [3673] = true, -- Lord Serpentis
    [3669] = true, -- Lord Cobrahn
    [3654] = true, -- Mutanus the Devourer
    [3674] = true, -- Skum
    [3653] = true, -- Kresh
    [3671] = true, -- Lady Anacondra
    [5912] = true, -- Deviate Faerie Dragon
    [3672] = true, -- Boahn, outside
    [3655] = true, -- Mad Magglish, outside
    [3652] = true, -- Trigore the Lasher, outside
    -------------------------------------------------------------------------------
    -- Vault of Archavon
    -------------------------------------------------------------------------------
    [31125] = true, -- Archavon the Stone Watcher
    [33993] = true, -- Emalon the Storm Watcher
    [35013] = true, -- Koralon the Flamewatcher
    [38433] = true, -- Toravon the Ice Watcher
    -------------------------------------------------------------------------------
    -- Winterspring
    -------------------------------------------------------------------------------
    [14457] = true, -- Princess Tempestria
    -------------------------------------------------------------------------------
    -- World Dragons
    -------------------------------------------------------------------------------
    [14889] = true, -- Emeriss
    [14888] = true, -- Lethon
    [14890] = true, -- Taerar
    [14887] = true, -- Ysondre
    -------------------------------------------------------------------------------
    -- Zul'Farrak
    -------------------------------------------------------------------------------
    [7267] = true, -- Chief Ukorz Sandscalp
    [7271] = true, -- Witch Doctor Zum'rah
    [7272] = true, -- Theka the Martyr
    [7273] = true, -- Gahz'rilla
    [7274] = true, -- Sandfury Executioner
    [7275] = true, -- Shadowpriest Sezz'ziz
    [7604] = true, -- Sergeant Bly
    [7605] = true, -- Raven
    [7606] = true, -- Oro Eyegouge
    [7608] = true, -- Murta Grimgut
    [7795] = true, -- Hydromancer Velratha
    [7796] = true, -- Nekrum Gutchewer
    [7797] = true, -- Ruuzlu
    [8127] = true, -- Antu'sul
    [10080] = true, -- Sandarr Dunereaver
    [10082] = true, -- Zerillis
    [10081] = true -- Dustwraith
}

Statics.DownloadLocation = "https://www.curseforge.com/wow/addons/guild-loot-tracker"

StaticPopupDialogs["GLT_UPDATE_AVAILABLE"] = {
    text = L["Guild Loot Tracker is out of date. You can download the newest version from"] ..
        " " .. Statics.DownloadLocation,
    hasEditBox = 1,
    OnShow = function(self)
        self.editBox:SetAutoFocus(false)
        self.editBox:SetWidth(220)
        self.editBox:SetText(Statics.DownloadLocation)
        self.editBox:HighlightText()
        ChatEdit_FocusActiveWindow()
    end,
    OnHide = function(self)
        self.editBox:SetWidth(self.editBox.width or 50)
    end,
    hideOnEscape = 1,
    button1 = OKAY,
    EditBoxOnEnterPressed = function(self)
        ChatEdit_FocusActiveWindow()
        self:GetParent():Hide()
    end,
    EditBoxOnEscapePressed = function(self)
        ChatEdit_FocusActiveWindow()
        self:GetParent():Hide()
    end,
    EditBoxOnTextChanged = function(self)
        if (self:GetText() ~= Statics.DownloadLocation) then
            self:SetText(Statics.DownloadLocation)
        end
        self:HighlightText()
        self:ClearFocus()
        ChatEdit_FocusActiveWindow()
    end,
    OnEditFocusGained = function(self)
        self:HighlightText()
    end,
    showAlert = 1
}
