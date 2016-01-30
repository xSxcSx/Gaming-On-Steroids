-- motify from noddy sivir
local Version = 1

CC = {
-- Aatrox
["AatroxQ"] 					= 	{ slot = _Q , champName = "Aatrox"				, spellType = "circular" 	, projectileSpeed = 450			, spellDelay = 250	, spellRange = 650		, spellRadius = 285		, collision = false	}, 
["AatroxE"] 					= 	{ slot = _E , champName = "Aatrox"				, spellType = "line" 		, projectileSpeed = 1200		, spellDelay = 250	, spellRange = 1075		, spellRadius = 100		, collision = false	}, 
-- Ahri
["AhriSeduce"] 					= 	{ slot = _E , champName = "Ahri"				, spellType = "line" 	 	, projectileSpeed = 1550		, spellDelay = 250	, spellRange = 1000		, spellRadius = 60		, collision = true	}, 
-- Alistar
["Pulverize"] 					= 	{ slot = _Q , champName = "Alistar"				, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 365		, spellRadius = 365		, collision = false	},
-- Amumu
["BandageToss"] 				= 	{ slot = _Q , champName = "Amumu"				, spellType = "line" 	 	, projectileSpeed = 2000		, spellDelay = 250	, spellRange = 1100		, spellRadius = 80		, collision = true	}, 
["CurseoftheSadMummy"] 			= 	{ slot = _R , champName = "Amumu"				, spellType = "aoe" 	 	, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 560		, spellRadius = 560		, collision = false	},
-- Anivia
["FlashFrostSpell"] 			= 	{ slot = _Q , champName = "Anivia"				, spellType = "line" 	 	, projectileSpeed = 850			, spellDelay = 250	, spellRange = 1250		, spellRadius = 110		, collision = false	}, 
-- Ashe
["EnchantedCrystalArrow"] 		= 	{ slot = _R , champName = "Ashe"				, spellType = "line" 	 	, projectileSpeed = 1600		, spellDelay = 250	, spellRange = 20000	, spellRadius = 130		, collision = false	},
-- Bard
["BardQ"] 						= 	{ slot = _Q , champName = "Bard"				, spellType = "line" 	 	, projectileSpeed = 1600		, spellDelay = 250	, spellRange = 950		, spellRadius = 60		, collision = true	},
-- Blitzcrank
["RocketGrab"] 					= 	{ slot = _Q , champName = "Blitzcrank"			, spellType = "line" 	 	, projectileSpeed = 1800		, spellDelay = 250	, spellRange = 1050		, spellRadius = 70		, collision = true	},
-- Braum
["BraumQ"] 						= 	{ slot = _Q , champName = "Braum"				, spellType = "line" 	 	, projectileSpeed = 1200		, spellDelay = 250	, spellRange = 1000		, spellRadius = 100		, collision = true	},
["BraumRWrapper"] 				= 	{ slot = _R , champName = "Braum"				, spellType = "line" 	 	, projectileSpeed = 1125		, spellDelay = 500	, spellRange = 1250		, spellRadius = 100		, collision = false	},
-- Cassiopeia
["CassiopeiaPetrifyingGaze"]	= 	{ slot = _R , champName = "Cassiopeia"			, spellType = "line" 	 	, projectileSpeed = math.huge	, spellDelay = 500	, spellRange = 825		, spellRadius = 150		, collision = false	},
-- Chogath
["Rupture"] 					= 	{ slot = _Q , champName = "Chogath"				, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 1200	, spellRange = 950		, spellRadius = 250		, collision = false },
-- Darius
["DariusAxeGrabCone"] 			= 	{ slot = _E , champName = "Darius"				, spellType = "line" 		, projectileSpeed = math.huge	, spellDelay = 320	, spellRange = 570		, spellRadius = 150		, collision = false },
-- Diana
["DianaVortex"] 				= 	{ slot = _E , champName = "Diana"				, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 350		, spellRadius = 350		, collision = false	},
-- DrMundo
["InfectedCleaverMissileCast"] 	= 	{ slot = _Q , champName = "DrMundo"				, spellType = "line" 		, projectileSpeed = 2000		, spellDelay = 250	, spellRange = 1050		, spellRadius = 60		, collision = true	},
-- Draven
["DravenDoubleShot"] 			= 	{ slot = _E , champName = "Draven"				, spellType = "line" 		, projectileSpeed = 1400		, spellDelay = 250	, spellRange = 1100		, spellRadius = 130		, collision = false	},
-- Elise
["EliseHumanE"] 				= 	{ slot = _E , champName = "Elise"				, spellType = "line" 		, projectileSpeed = 1600		, spellDelay = 250	, spellRange = 1100		, spellRadius = 70		, collision = true	},
-- Evelynn
["EvelynnR"] 					= 	{ slot = _R , champName = "Evelynn"				, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 650		, spellRadius = 350		, collision = false },
-- FiddleSticks
["Terrify"] 					= 	{ slot = _Q , champName = "FiddleSticks"		, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 575		, spellRadius = 0		, collision = false },
-- Fizz
["FizzMarinerDoom"] 			= 	{ slot = _R , champName = "Fizz"				, spellType = "line" 		, projectileSpeed = 1350		, spellDelay = 250	, spellRange = 1275		, spellRadius = 120		, collision = false },
-- Galio
["GalioResoluteSmite"] 			= 	{ slot = _Q , champName = "Galio"				, spellType = "circular" 	, projectileSpeed = 1200		, spellDelay = 250	, spellRange = 1040		, spellRadius = 235		, collision = false },
["GalioIdolOfDurand"] 			= 	{ slot = _R , champName = "Galio"				, spellType = "aoe" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 600		, spellRadius = 600		, collision = false },
-- Gnar
["gnarbigq"] 					= 	{ slot = _Q , champName = "Gnar"				, spellType = "line" 		, projectileSpeed = 2000		, spellDelay = 500	, spellRange = 1150		, spellRadius = 90		, collision = true  },
["GnarQ"] 						= 	{ slot = _Q , champName = "Gnar"				, spellType = "line" 		, projectileSpeed = 2400		, spellDelay = 250	, spellRange = 1185		, spellRadius = 60		, collision = true  },
["gnarbigw"] 					= 	{ slot = _W , champName = "Gnar"				, spellType = "line" 		, projectileSpeed = math.huge	, spellDelay = 600	, spellRange = 600		, spellRadius = 100		, collision = false },
["GnarR"] 						= 	{ slot = _R , champName = "Gnar"				, spellType = "aoe" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 500		, spellRadius = 500		, collision = false },
-- Gragas
["GragasE"] 					= 	{ slot = _E , champName = "Gragas"				, spellType = "line" 		, projectileSpeed = 1200		, spellDelay = 0	, spellRange = 950		, spellRadius = 200		, collision = true  },
["GragasR"] 					= 	{ slot = _R , champName = "Gragas"				, spellType = "circular" 	, projectileSpeed = 1750		, spellDelay = 250	, spellRange = 1050		, spellRadius = 350		, collision = false },
-- Hecarim
["HecarimUlt"] 					= 	{ slot = _R , champName = "Hecarim"				, spellType = "circular" 	, projectileSpeed = 1100		, spellDelay = 10	, spellRange = 1500		, spellRadius = 300		, collision = false },
-- Heimerdinger
["HeimerdingerE"] 				= 	{ slot = _E , champName = "Heimerdinger"		, spellType = "circular" 	, projectileSpeed = 1750		, spellDelay = 350	, spellRange = 925		, spellRadius = 135		, collision = false },
-- Irelia
["IreliaEquilibriumStrike"] 	= 	{ slot = _E , champName = "Irelia"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 425		, spellRadius = 0		, collision = false },
-- Janna
["HowlingGale"] 				= 	{ slot = _Q , champName = "Janna"				, spellType = "line" 		, projectileSpeed = 900			, spellDelay = 0	, spellRange = 1700		, spellRadius = 120		, collision = false },
["SowTheWind"] 					= 	{ slot = _W , champName = "Janna"				, spellType = "target" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 600		, spellRadius = 0		, collision = false },
-- JarvanIV
["JarvanIVDragonStrike2"] 		= 	{ slot = _Q , champName = "JarvanIV"			, spellType = "line" 		, projectileSpeed = 1800		, spellDelay = 250	, spellRange = 845		, spellRadius = 120		, collision = false	},
-- Jayce
["JayceToTheSkies"] 			= 	{ slot = _Q , champName = "Jayce"				, spellType = "target" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 600		, spellRadius = 100		, collision = false	},
["JayceThunderingBlow"] 		= 	{ slot = _E , champName = "Jayce"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 240		, spellRadius = 0		, collision = false	},
-- Karma
["KarmaQMissileMantra"] 		= 	{ slot = _Q , champName = "Karma"				, spellType = "line" 		, projectileSpeed = 1700		, spellDelay = 250	, spellRange = 1050		, spellRadius = 90		, collision = true	},
["KarmaQ"] 						= 	{ slot = _Q , champName = "Karma"				, spellType = "line" 		, projectileSpeed = 1700		, spellDelay = 250	, spellRange = 1050		, spellRadius = 90		, collision = true	},
["KarmaW"] 						= 	{ slot = _W , champName = "Karma"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 1000		, spellRadius = 0		, collision = false	}, -- Check spellname
-- Kassadin
["ForcePulse"] 					= 	{ slot = _E , champName = "Kassadin"			, spellType = "line" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 700		, spellRadius = 100		, collision = false	},
-- Kayle
["JudicatorReckoning"] 			= 	{ slot = _Q , champName = "Kayle"				, spellType = "target" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 650		, spellRadius = 0		, collision = false	},
-- KhaZix
["KhazixW"] 					= 	{ slot = _W , champName = "KhaZix"				, spellType = "line" 		, projectileSpeed = 1700		, spellDelay = 250	, spellRange = 1100		, spellRadius = 70		, collision = true	},
["khazixwlong"] 				= 	{ slot = _W , champName = "KhaZix"				, spellType = "line" 		, projectileSpeed = 1700		, spellDelay = 250	, spellRange = 1025		, spellRadius = 70		, collision = true	},
-- KogMaw
["KogMawVoidOoze"] 				= 	{ slot = _E , champName = "KogMaw"				, spellType = "line" 		, projectileSpeed = 1400		, spellDelay = 250	, spellRange = 1360		, spellRadius = 120		, collision = false	},
-- LeBlanc
["LeblancSoulShackle"] 			= 	{ slot = _E , champName = "Leblanc"				, spellType = "line" 		, projectileSpeed = 1600		, spellDelay = 250	, spellRange = 960		, spellRadius = 70		, collision = true	},
["LeblancSoulShackleM"] 		= 	{ slot = _R , champName = "Leblanc"				, spellType = "line" 		, projectileSpeed = 1600		, spellDelay = 250	, spellRange = 960		, spellRadius = 70		, collision = true	},
-- LeeSin
["BlindMonkQOne"] 				= 	{ slot = _Q , champName = "LeeSin"				, spellType = "line" 		, projectileSpeed = 1800		, spellDelay = 250	, spellRange = 1100		, spellRadius = 60		, collision = true	},
["BlindMonkRKick"] 				= 	{ slot = _R , champName = "LeeSin"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 375		, spellRadius = 0		, collision = false	},
-- Leona
["LeonaSolarFlare"] 			= 	{ slot = _R , champName = "Leona"				, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 1000	, spellRange = 1200		, spellRadius = 300		, collision = false	},
-- Lissandra
["LissandraW"] 					= 	{ slot = _W , champName = "Lissandra"			, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 450		, spellRadius = 450		, collision = false	},
["LissandraR"] 					= 	{ slot = _R , champName = "Lissandra"			, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 550		, spellRadius = 550		, collision = false	},
-- Lulu
["LuluQ"] 						= 	{ slot = _Q , champName = "Lulu"				, spellType = "line" 		, projectileSpeed = 1450		, spellDelay = 250	, spellRange = 925		, spellRadius = 80		, collision = false	},
["LuluW"] 						= 	{ slot = _W , champName = "Lulu"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 925		, spellRadius = 450		, collision = false	}, -- check spellname
-- Lux
["LuxLightBinding"] 			= 	{ slot = _Q , champName = "Lux"					, spellType = "line" 		, projectileSpeed = 1200		, spellDelay = 250	, spellRange = 1300		, spellRadius = 70		, collision = true	},
-- Malphite
["SeismicShard"] 				= 	{ slot = _Q , champName = "Malphite"			, spellType = "target" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 625		, spellRadius = 0		, collision = false	},
["UFSlash"] 					= 	{ slot = _R , champName = "Malphite"			, spellType = "circular" 	, projectileSpeed = 2000		, spellDelay = 0	, spellRange = 1000		, spellRadius = 300		, collision = false	},
-- Malzahar
["AlZaharNetherGrasp"] 			= 	{ slot = _R , champName = "Malzahar"			, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 700		, spellRadius = 0		, collision = false	},
-- Maokai
["MaokaiTrunkLine"] 			= 	{ slot = _Q , champName = "Maokai"				, spellType = "line" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 600		, spellRadius = 100		, collision = false	},
["MaokaiW"] 					= 	{ slot = _W , champName = "Maokai"				, spellType = "target" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 600		, spellRadius = 0		, collision = false	}, -- check spellname
-- Morgana
["DarkBindingMissile"] 			= 	{ slot = _Q , champName = "Morgana"				, spellType = "line" 		, projectileSpeed = 1200		, spellDelay = 250	, spellRange = 1300		, spellRadius = 80		, collision = true	},
["SoulShackles"] 				= 	{ slot = _R , champName = "Morgana"				, spellType = "aoe" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 600		, spellRadius = 600		, collision = false	},
-- Nami
["NamiQ"] 						= 	{ slot = _Q , champName = "Nami"				, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 1000	, spellRange = 875		, spellRadius = 200		, collision = false	},
["NamiR"] 						= 	{ slot = _R , champName = "Nami"				, spellType = "line" 		, projectileSpeed = 850			, spellDelay = 500	, spellRange = 2750		, spellRadius = 250		, collision = false	},
-- Nasus
["NasusW"] 						= 	{ slot = _W , champName = "Nasus"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 600		, spellRadius = 0		, collision = false	},
-- Nautilus
["NautilusAnchorDrag"] 			= 	{ slot = _Q , champName = "Nautilus"			, spellType = "line" 		, projectileSpeed = 2000		, spellDelay = 250	, spellRange = 1250		, spellRadius = 90		, collision = true	},
["NautilusR"] 					= 	{ slot = _R , champName = "Nautilus"			, spellType = "target" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 825		, spellRadius = 0		, collision = false	}, -- check spellname
-- Nocturne
["NocturneUnspeakableHorror"]	= 	{ slot = _E , champName = "Nocturne"			, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 425		, spellRadius = 0		, collision = false	},
-- Nunu
["IceBlast"]					= 	{ slot = _E , champName = "Nunu"				, spellType = "target" 		, projectileSpeed = 1000		, spellDelay = 400	, spellRange = 425		, spellRadius = 0		, collision = false	},
-- Olaf
["OlafAxeThrowCast"]			= 	{ slot = _Q , champName = "Olaf"				, spellType = "line" 		, projectileSpeed = 1600		, spellDelay = 250	, spellRange = 100		, spellRadius = 90		, collision = false	},
-- Orianna
--0
-- Pantheon
["PantheonW"]					= 	{ slot = _W , champName = "Pantheon"			, spellType = "target" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 600		, spellRadius = 0		, collision = false	}, -- check spellname
-- Poppy
["PoppyHeroicCharge"]			= 	{ slot = _E , champName = "Poppy"				, spellType = "target" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 600		, spellRadius = 0		, collision = false	},
-- Quinn
["QuinnQ"]						= 	{ slot = _Q , champName = "Quinn"				, spellType = "line" 		, projectileSpeed = 1550		, spellDelay = 250	, spellRange = 1050		, spellRadius = 80		, collision = true	},
["QuinnE"]						= 	{ slot = _E , champName = "Quinn"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 700		, spellRadius = 0		, collision = false	},
-- Rammus
["PuncturingTaunt"]				= 	{ slot = _E , champName = "Rammus"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 325		, spellRadius = 0		, collision = false	},
-- Rengar
["RengarE"]						= 	{ slot = _E , champName = "Rengar"				, spellType = "line" 		, projectileSpeed = 1500		, spellDelay = 250	, spellRange = 1000		, spellRadius = 70		, collision = true	},
-- Riven
["RivenMartyr"]					= 	{ slot = _W , champName = "Riven"				, spellType = "aoe" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 280		, spellRadius = 280		, collision = false	},
-- Rumble
["RumbleGrenade"]				= 	{ slot = _E , champName = "Rumble"				, spellType = "line" 		, projectileSpeed = 2000		, spellDelay = 250	, spellRange = 950		, spellRadius = 90		, collision = true	},
-- Ryze
["RyzeW"]						= 	{ slot = _W , champName = "Ryze"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 600		, spellRadius = 0		, collision = false	},
-- Sejuani
["SejuaniArcticAssault"]		= 	{ slot = _Q , champName = "Sejuani"				, spellType = "line" 		, projectileSpeed = 1600		, spellDelay = 0	, spellRange = 900		, spellRadius = 70		, collision = false	},
["SejuaniGlacialPrisonCast"]	= 	{ slot = _R , champName = "Sejuani"				, spellType = "line" 		, projectileSpeed = 1600		, spellDelay = 250	, spellRange = 1200		, spellRadius = 110		, collision = false	},
-- Shaco
["TwoShivPoison"]				= 	{ slot = _E , champName = "Shaco"				, spellType = "target" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 625		, spellRadius = 0		, collision = false	},
-- Shen
["ShenShadowDash"]				= 	{ slot = _E , champName = "Shen"				, spellType = "line" 		, projectileSpeed = 1250		, spellDelay = 0	, spellRange = 700		, spellRadius = 75		, collision = false	},
-- Shyvana
["ShyvanaTransformCast"]		= 	{ slot = _R , champName = "Shyvana"				, spellType = "line" 		, projectileSpeed = 1100		, spellDelay = 10	, spellRange = 1000		, spellRadius = 160		, collision = false	},
-- Singed
["Fling"]						= 	{ slot = _E , champName = "Singed"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 125		, spellRadius = 0		, collision = false	},
-- Skarner
["SkarnerFracture"]				= 	{ slot = _E , champName = "Skarner"				, spellType = "line" 		, projectileSpeed = 1400		, spellDelay = 250	, spellRange = 1000		, spellRadius = 60		, collision = false	},
["SkarnerImpale"]				= 	{ slot = _R , champName = "Skarner"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 350		, spellRadius = 0		, collision = false	}, -- check spellname
-- Sona
["SonaR"]						= 	{ slot = _R , champName = "Sona"				, spellType = "line" 		, projectileSpeed = 2400		, spellDelay = 250	, spellRange = 1000		, spellRadius = 140		, collision = false	},
-- Swain
["SwainQ"]						= 	{ slot = _Q , champName = "Swain"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 625		, spellRadius = 0		, collision = false	}, -- check spellname
["SwainShadowGrasp"]			= 	{ slot = _W , champName = "Swain"				, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 1100	, spellRange = 900		, spellRadius = 250		, collision = false	},
-- Syndra
["syndrawcast"]					= 	{ slot = _W , champName = "Syndra"				, spellType = "circular" 	, projectileSpeed = 1450		, spellDelay = 250	, spellRange = 925		, spellRadius = 220		, collision = false	},
["SyndraE"]						= 	{ slot = _E , champName = "Syndra"				, spellType = "line" 		, projectileSpeed = 1500		, spellDelay = 250	, spellRange = 800		, spellRadius = 150		, collision = false	},
-- TahmKench
["TahmKenchQ"]					= 	{ slot = _Q , champName = "TahmKench"			, spellType = "line" 		, projectileSpeed = 2000		, spellDelay = 250	, spellRange = 950		, spellRadius = 90		, collision = true	},
["TahmKenchE"]					= 	{ slot = _E , champName = "TahmKench"			, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 0		, collision = false	}, -- check spellname
-- Taric
["Dazzle"]						= 	{ slot = _E , champName = "Taric"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 625		, spellRadius = 0		, collision = false	}, -- check spellname
-- Teemo
["BlindingDart"]				= 	{ slot = _Q , champName = "Teemo"				, spellType = "target" 		, projectileSpeed = 2000		, spellDelay = 250	, spellRange = 580		, spellRadius = 0		, collision = false	},
-- Thresh
["ThreshQ"]						= 	{ slot = _Q , champName = "Thresh"				, spellType = "line" 		, projectileSpeed = 1900		, spellDelay = 500	, spellRange = 1100		, spellRadius = 70		, collision = true	},
["ThreshE"]						= 	{ slot = _E , champName = "Thresh"				, spellType = "line" 		, projectileSpeed = 2000		, spellDelay = 0	, spellRange = 1075/2	, spellRadius = 110		, collision = false	},
-- Tristana
["TristanaR"]					= 	{ slot = _R , champName = "Tristana"			, spellType = "target" 		, projectileSpeed = 2000		, spellDelay = 250	, spellRange = 669		, spellRadius = 0		, collision = false	},
-- Tryndamere
["MockingShout"] 				= 	{ slot = _W , champName = "Tryndamere"			, spellType = "aoe" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 400		, spellRadius = 400		, collision = false	},
-- Urgot
["UrgotR"]						= 	{ slot = _R , champName = "Urgot"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 850		, spellRadius = 0		, collision = false	}, -- check spellName
-- Varus
["VarusR"]						= 	{ slot = _R , champName = "Varus"				, spellType = "line" 		, projectileSpeed = 1950		, spellDelay = 250	, spellRange = 1200		, spellRadius = 100		, collision = false	},
-- Vayne
["VayneCondemn"]				= 	{ slot = _E , champName = "Vayne"				, spellType = "target" 		, projectileSpeed = 2000		, spellDelay = 250	, spellRange = 550		, spellRadius = 0		, collision = false	},
-- Veigar
["VeigarEventHorizon"]			= 	{ slot = _E , champName = "Veigar"				, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 500	, spellRange = 700		, spellRadius = 425		, collision = false	},
-- VelKoz
["VelkozQMissile"]				= 	{ slot = _Q , champName = "Velkoz"				, spellType = "line" 		, projectileSpeed = 1300		, spellDelay = 250	, spellRange = 1250		, spellRadius = 50		, collision = true	},
["VelkozQMissileSplit"]			= 	{ slot = _Q , champName = "Velkoz"				, spellType = "line" 		, projectileSpeed = 2100		, spellDelay = 0	, spellRange = 1100		, spellRadius = 45		, collision = true	},
["VelkozE"]						= 	{ slot = _E , champName = "Velkoz"				, spellType = "circular" 	, projectileSpeed = 1500		, spellDelay = 0	, spellRange = 950		, spellRadius = 225		, collision = false	},
-- Vi
["ViQMissile"]					= 	{ slot = _Q , champName = "Vi"					, spellType = "line" 		, projectileSpeed = 1500		, spellDelay = 0	, spellRange = 725		, spellRadius = 90		, collision = false	},
["ViR"]							= 	{ slot = _R , champName = "Vi"					, spellType = "line" 		, projectileSpeed = 1000		, spellDelay = 250	, spellRange = 800		, spellRadius = 0		, collision = false	}, -- check spellname
-- Viktor
["ViktorGravitonField"]			= 	{ slot = _W , champName = "Viktor"				, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 1500	, spellRange = 625		, spellRadius = 300		, collision = false	},
-- Warwick
["InfiniteDuress"]				= 	{ slot = _R , champName = "Warwick"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 0	, spellRange = 700		, spellRadius = 0		, collision = false	}, -- check spellname
-- Xerath
["XerathArcaneBarrage2"]		= 	{ slot = _W , champName = "Xerath"				, spellType = "circular" 	, projectileSpeed = 1600		, spellDelay = 250	, spellRange = 1125		, spellRadius = 60		, collision = true	},
["XerathMageSpear"]				= 	{ slot = _E , champName = "Xerath"				, spellType = "line" 		, projectileSpeed = math.huge	, spellDelay = 750	, spellRange = 1100		, spellRadius = 280		, collision = false	},
-- Yasou
["yasuoq3w"]					= 	{ slot = _Q , champName = "Yasou"				, spellType = "line" 		, projectileSpeed = 1200		, spellDelay = 250	, spellRange = 1025		, spellRadius = 90		, collision = false	},
-- Zac
["ZacQ"]						= 	{ slot = _Q , champName = "Zac"					, spellType = "line" 		, projectileSpeed = math.huge	, spellDelay = 500	, spellRange = 550		, spellRadius = 120		, collision = false	},
["ZacE"]						= 	{ slot = _E , champName = "Zac"					, spellType = "circular" 	, projectileSpeed = 1500		, spellDelay = 0	, spellRange = 1800		, spellRadius = 300		, collision = false	}, -- check spellname, projectileSpeed
-- Ziggs
["ZiggsW"]						= 	{ slot = _W , champName = "Ziggs"				, spellType = "circular" 	, projectileSpeed = 3000		, spellDelay = 250	, spellRange = 2000		, spellRadius = 275		, collision = false	},
-- Zilean
["ZileanQ"]						= 	{ slot = _Q , champName = "Zilean"				, spellType = "circular" 	, projectileSpeed = 2000		, spellDelay = 300	, spellRange = 900		, spellRadius = 250		, collision = false	},
["TimeWarp"]					= 	{ slot = _E , champName = "Zilean"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 0	, spellRange = 550		, spellRadius = 0		, collision = false	},
-- Zyra
["ZyraGraspingRoots"]			= 	{ slot = _E , champName = "Zyra"				, spellType = "line" 		, projectileSpeed = 1400		, spellDelay = 250	, spellRange = 1150		, spellRadius = 70		, collision = false	},
["ZyraBrambleZone"]				= 	{ slot = _R , champName = "Zyra"				, spellType = "circular" 	, projectileSpeed = math.huge	, spellDelay = 500	, spellRange = 700		, spellRadius = 525		, collision = false	},

--danger spell list
["InfernalGuardian"] 						= 	{ slot = _R , champName = "Annie"				, spellType = "circular" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 450		, collision = false	},
["Feast"] 						= 	{ slot = _R , champName = "Chogath"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 450		, collision = false	},
["DariusExecute"] 						= 	{ slot = _R , champName = "Darius"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 450		, collision = false	},
["GarenR"] 						= 	{ slot = _R , champName = "Garen"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 450		, collision = false	},
["SkarnerImpale"] 						= 	{ slot = _R , champName = "Skarner"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 450		, collision = false	},
["LissandraR"] 						= 	{ slot = _R , champName = "Lissandra"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 450		, collision = false	},
["BlindMonkR"] 						= 	{ slot = _R , champName = "LeeSin"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 450		, collision = false	},
["zedult"] 						= 	{ slot = _R , champName = "Zed"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 450		, collision = false	},
["infiniteduresschannel"] 						= 	{ slot = _R , champName = "Warwick"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 450		, collision = false	},

--AA
["RenektonExecute"] 						= 	{ slot = _W , champName = "Renekton"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 250		, collision = false	},
["RenektonSuperExecute"] 						= 	{ slot = _W , champName = "Renekton"				, spellType = "target" 		, projectileSpeed = math.huge	, spellDelay = 250	, spellRange = 250		, spellRadius = 250		, collision = false	}
}

local debug = false

d = require 'DLib'
local IsInDistance = d.IsInDistance
local GetDistance = d.GetDistance
local myHero = GetMyHero()


-- local	WayOnTime, startTime, stargingPos, endingPos, radius, CCSpellTimeNeed
local detectedSkillshots = {}

local callbackList = {}
local function callback(unit, spellProc)
	for _,callbackFunc in pairs(callbackList) do
		callbackFunc(unit, spellProc)
	end
end

-- test only
if debug then
	table.insert(callbackList, function()
		if CanUseSpell(myHero,_E) == READY then
			CastSpell(_E)
		end
	end)
end

function addAntiCCCallback( callback )
	table.insert(callbackList, callback)
end

-- local m_unit, m_spellProc
function OnProcessSpellCallback(unit, spellProc)
	local CCSpell = CC[spellProc.name]
	if CCSpell and (GetTeam(unit) ~= GetTeam(myHero) or debug) then

		if CCSpell.spellType == "target" and spellProc.target == myHero then
			if callback then callback(unit, spellProc) end
		end
	
		if CCSpell.spellType == "line" and IsInDistance(unit, CCSpell.spellRange + GetMoveSpeed(myHero)) then
			local pred = GetPredictionForPlayer(GetOrigin(unit),myHero,GetMoveSpeed(myHero),CCSpell.projectileSpeed,CCSpell.spellDelay,CCSpell.spellRange,CCSpell.spellRadius,CCSpell.collision,true)
			if pred.HitChance == 1 then
				local CCVector = Vector(Vector(spellProc.endPos)-Vector(spellProc.startPos)):normalized()*CCSpell.spellRange
				
				local CCSpellTimeNeed = CCSpell.spellRange / (CCSpell.projectileSpeed+50) * 1000 + CCSpell.spellDelay				
				local WayOnTime = CCVector/CCSpellTimeNeed
				local startTime = GetTickCount()
				local stargingPos = spellProc.startPos
				local endingPos = spellProc.startPos + CCVector
				local radius = CCSpell.spellRadius

				table.insert(detectedSkillshots, {
					CCSpellTimeNeed = CCSpellTimeNeed,
					WayOnTime = WayOnTime,
					startTime = startTime,
					stargingPos = stargingPos,
					endingPos = endingPos,
					radius = radius,
					m_unit = unit,
					m_spellProc = spellProc
					})

				if debug then
					local gg =  GetOrigin(myHero) + CCVector:perpendicular():normalized()* (radius + GetHitBox(myHero)*1.8 + 200)
					local gg2 =  GetOrigin(myHero) - CCVector:perpendicular():normalized()* (radius + GetHitBox(myHero)*1.8 + 200)
					if GetDistance(gg, stargingPos) > GetDistance(gg2, stargingPos) then
						MoveToXYZ(gg2)
					else
						MoveToXYZ(gg)
					end
				end				
			end
		end
		
		if CCSpell.spellType == "circular" and IsInDistance(unit, CCSpell.spellRange + GetMoveSpeed(myHero)) then
			local spellTime = GetDistance(GetOrigin(unit), spellProc.endPos) / CCSpell.projectileSpeed * 1000 + CCSpell.spellDelay
			delay(function()
				if GetDistance(spellProc.endPos) <= CCSpell.spellRadius then	
					if callback then callback(unit, spellProc) end
				end
			end, spellTime-200)
		end

		if CCSpell.spellType == "aoe"  and IsInDistance(unit, CCSpell.spellRange) then
			if callback then callback(unit, spellProc) end
		end	
	end

end

OnProcessSpell(OnProcessSpellCallback)

local lastcast = 0
OnDraw(function (myHero)
	if debug then
		local mousePos = GetMousePos()
		DrawCircle(mousePos, 100,0,0,0xffffffff)
		local mousePos2 = WorldToScreen(1, mousePos)
		DrawText("x:"..mousePos.x.." y:"..mousePos.y.." z:"..mousePos.z,24,mousePos2.x,mousePos2.y+50,ARGB(255,0,255,0))
	end


	-- dummy spell
	if debug and KeyIsDown(17) and lastcast + 300 < GetTickCount() then
		local spellProc = {}
		spellProc.name = "DarkBindingMissile"
		spellProc.startPos = GetMousePos()
		spellProc.endPos = GetOrigin(myHero)		
		OnProcessSpellCallback(myHero, spellProc)
		lastcast = GetTickCount()
	end	
	
	for index,skillshot in ipairs(detectedSkillshots) do
		local spellPos = skillshot.stargingPos + ( (GetTickCount() - skillshot.startTime) * skillshot.WayOnTime)

		DrawCircle(skillshot.endingPos, skillshot.radius,3,255,0xff0ffff0)
		DrawCircle(spellPos, skillshot.radius+GetHitBox(myHero)*1.8,1,255,0xffffffff)
		
		if debug then
			local s = WorldToScreen(1, skillshot.stargingPos)
			local e = WorldToScreen(1, skillshot.endingPos)
			DrawLine(s.x,s.y,e.x,e.y,10,ARGB(255,255,255,255))
		end

		if GetDistance(spellPos) <= skillshot.radius+GetHitBox(myHero)*1.8 then
			if callback then callback(skillshot.m_unit, skillshot.m_spellProc) end
		end

		if GetTickCount() >= (skillshot.startTime + skillshot.CCSpellTimeNeed) then
			skillshot = nil
			table.remove(detectedSkillshots, index)
		end
	end
	-- if startTime then
	-- 	local spellPos = stargingPos + ( (GetTickCount() - startTime) * WayOnTime)

	-- 	DrawCircle(endingPos, radius,3,255,0xff0ffff0)
	-- 	DrawCircle(spellPos, radius+GetHitBox(myHero)*1.8,1,255,0xffffffff)
		
	-- 	-- local s = WorldToScreen(1, stargingPos)
	-- 	-- local e = WorldToScreen(1, endingPos)
	-- 	-- DrawLine(s.x,s.y,e.x,e.y,10,ARGB(255,255,255,255))

	-- 	if GetDistance(spellPos) <= radius+GetHitBox(myHero)*1.8 then
	-- 		if callback then callback(m_unit, m_spellProc) end
	-- 	end

	-- 	if GetTickCount() >= (startTime + CCSpellTimeNeed) then
	-- 		startTime = nil
	-- 	end
	-- end
end)

PrintChat("anti CC loaded")
