local ConROC_Warrior, ids = ...;
local ConROC_Warrior, optionMaxIds = ...;

--General
	ids.Racial = {
		Berserking = 20554,
		Perception = 20600,
	}
	ids.Spec = {
		Arms = 1,
		Fury = 2,
		Protection = 3,
	}	
	ids.Stance = {
		Battle = 1,
		Defensive = 2,
		Berserker = 3,	
	}
--Arms
	ids.Arms_Ability = {
		BattleStance = 2457,
		ChargeRank1 = 100,
		ChargeRank2 = 6178,
		ChargeRank3 = 11578,
		HamstringRank1 = 1715,
		HamstringRank2 = 7372,
		HamstringRank3 = 7373,
		HeroicStrikeRank1 = 78,
		HeroicStrikeRank2 = 284,
		HeroicStrikeRank3 = 285,
		HeroicStrikeRank4 = 1608,
		HeroicStrikeRank5 = 11564,
		HeroicStrikeRank6 = 11565,
		HeroicStrikeRank7 = 11566,
		HeroicStrikeRank8 = 11567,
		HeroicStrikeRank9 = 25286,
		MockingBlowRank1 = 694,
		MockingBlowRank2 = 7400,
		MockingBlowRank3 = 7402,
		MockingBlowRank4 = 20559,
		MockingBlowRank5 = 20560,
		MortalStrikeRank1 = 12294,
		MortalStrikeRank2 = 21551,
		MortalStrikeRank3 = 21552,
		MortalStrikeRank4 = 21553,
		OverpowerRank1 = 7384,
		OverpowerRank2 = 7887,
		OverpowerRank3 = 11584,
		OverpowerRank4 = 11585,
		SweepingStrikes = 12328,
		RendRank1 = 772,
		RendRank2 = 6546,
		RendRank3 = 6547,
		RendRank4 = 6548,
		RendRank5 = 11572,
		RendRank6 = 11573,
		RendRank7 = 11574,
		Retaliation = 20230,
		ThunderClapRank1 = 6343,
		ThunderClapRank2 = 8198,
		ThunderClapRank3 = 8204,
		ThunderClapRank4 = 8205,
		ThunderClapRank5 = 11580,
		ThunderClapRank6 = 11581,
	}	
--Fury
	ids.Fury_Ability = {
		BattleShoutRank1 = 6673,
		BattleShoutRank2 = 5242,
		BattleShoutRank3 = 6192,
		BattleShoutRank4 = 11549,
		BattleShoutRank5 = 11550,
		BattleShoutRank6 = 11551,
		BattleShoutRank7 = 25289,
		BerserkerRage = 18499,
		BerserkerStance = 2458,
		BloodthirstRank1 = 23881,
		BloodthirstRank2 = 23892,
		BloodthirstRank3 = 23893,
		BloodthirstRank4 = 23894,
		ChallengingShout = 1161,
		CleaveRank1 = 845,
		CleaveRank2 = 7369,
		CleaveRank3 = 11608,
		CleaveRank4 = 11609,
		CleaveRank5 = 20569,
		DeathWish = 12292,
		DemoralizingShoutRank1 = 1160,
		DemoralizingShoutRank2 = 6190,
		DemoralizingShoutRank3 = 11554,
		DemoralizingShoutRank4 = 11555,
		DemoralizingShoutRank5 = 11556,
		ExecuteRank1 = 5308,
		ExecuteRank2 = 20658,
		ExecuteRank3 = 20660,
		ExecuteRank4 = 20661,
		ExecuteRank5 = 20662,
		InterceptRank1 = 20252,
		InterceptRank2 = 20616,
		InterceptRank3 = 20617,
		IntimidatingShout = 5246,
		PiercingHowl = 12323,
		PummelRank1 = 6552,
		PummelRank2 = 6554,
		Recklessness = 1719,
		SlamRank1 = 1464,
		SlamRank2 = 8820,
		SlamRank3 = 11604,
		SlamRank4 = 11605,
		Whirlwind = 1680,
	}
--Protection
	ids.Prot_Ability = {
		Bloodrage = 2687,
		ConcussionBlow = 12809,
		DefensiveStance = 71,
		Disarm = 676,
		LastStand = 12975,
		RevengeRank1 = 6572,
		RevengeRank2 = 6574,
		RevengeRank3 = 7379,
		RevengeRank4 = 11600,
		RevengeRank5 = 11601,
		RevengeRank6 = 25288,
		ShieldBashRank1 = 72,
		ShieldBashRank2 = 1671,
		ShieldBashRank3 = 1672,
		ShieldBlock = 2565,
		ShieldSlamRank1 = 23922,
		ShieldSlamRank2 = 23923,
		ShieldSlamRank3 = 23924,
		ShieldSlamRank4 = 23925,
		ShieldWall = 871,
		SunderArmorRank1 = 7386,
		SunderArmorRank2 = 7405,
		SunderArmorRank3 = 8380,
		SunderArmorRank4 = 11596,
		SunderArmorRank5 = 11597,
		Taunt = 355,
	}
-- Auras
	ids.Player_Buff = {
		Slam = 46916,
		OverPower = 68051,
		SuddenDeath = 52437,
	
	}
	ids.Player_Debuff = {

	}
	ids.Target_Debuff = {
		ExposeArmor = 8647,
		SunderArmor = 58567,
	}
	ids.optionMaxIds = {
		
	}