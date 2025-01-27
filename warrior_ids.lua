local ConROC_Warrior, ids = ...;

--General
ids.Racial = {
	Berserking = 20554,
	Perception = 20600,
	Shadowmeld = 20580,
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
ids.Ability = {
--Arms
	BattleStance = 2457,
	Charge = 100,
	Hamstring = 1715,
	HeroicStrike = 78,
	MockingBlow = 694,
	MortalStrike = 12294,
	Overpower = 7384,
	SweepingStrikes = 12292,
	Rend = 772,
	Retaliation = 20230,
	ThunderClap = 6343,
--Fury
	BattleShout = 6673,
	BerserkerRage = 18499,
	BerserkerStance = 2458,
	Bloodthirst = 23881,
	ChallengingShout = 1161,
	Cleave = 845,
	DeathWish = 12328,
	DemoralizingShout = 1160,
	Execute = 5308,
	Intercept = 20252,
	IntimidatingShout = 5246,
	PiercingHowl = 12323,
	Pummel = 6552,
	Recklessness = 1719,
	Slam = 1464,
	Whirlwind = 1680, --lvl 36
--Protection
	Bloodrage = 2687,
	ConcussionBlow = 12809,
	DefensiveStance = 71,
	Disarm = 676,
	LastStand = 12975,
	Revenge = 6572,
	ShieldBash = 72,
	ShieldBlock = 2565,
	ShieldSlam = 23922,
	ShieldWall = 871,
	SunderArmor = 7386,
	Taunt = 355,
}
ids.Rank = {
--Arms
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
	RendRank1 = 772,
	RendRank2 = 6546,
	RendRank3 = 6547,
	RendRank4 = 6548,
	RendRank5 = 11572,
	RendRank6 = 11573,
	RendRank7 = 11574,
	ThunderClapRank1 = 6343,
	ThunderClapRank2 = 8198,
	ThunderClapRank3 = 8204,
	ThunderClapRank4 = 8205,
	ThunderClapRank5 = 11580,
	ThunderClapRank6 = 11581,
	ThunderClapSoDRank1 = 461830,
	ThunderClapSoDRank2 = 461829,
	ThunderClapSoDRank3 = 461828,
	ThunderClapSoDRank4 = 461827,
	ThunderClapSoDRank5 = 461826,
	ThunderClapSoDRank6 = 461810,
--Fury
	BattleShoutRank1 = 6673,
	BattleShoutRank2 = 5242,
	BattleShoutRank3 = 6192,
	BattleShoutRank4 = 11549,
	BattleShoutRank5 = 11550,
	BattleShoutRank6 = 11551,
	BattleShoutRank7 = 25289,
	BloodthirstRank1 = 23881,
	BloodthirstRank2 = 23892,
	BloodthirstRank3 = 23893,
	BloodthirstRank4 = 23894,
	CleaveRank1 = 845,
	CleaveRank2 = 7369,
	CleaveRank3 = 11608,
	CleaveRank4 = 11609,
	CleaveRank5 = 20569,
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
	PummelRank1 = 6552,
	PummelRank2 = 6554,
	SlamRank1 = 1464,
	SlamRank2 = 8820,
	SlamRank3 = 11604,
	SlamRank4 = 11605,
--Protection
	RevengeRank1 = 6572,
	RevengeRank2 = 6574,
	RevengeRank3 = 7379,
	RevengeRank4 = 11600,
	RevengeRank5 = 11601,
	RevengeRank6 = 25288,
	ShieldBashRank1 = 72,
	ShieldBashRank2 = 1671,
	ShieldBashRank3 = 1672,
	ShieldSlamRank1 = 23922,
	ShieldSlamRank2 = 23923,
	ShieldSlamRank3 = 23924,
	ShieldSlamRank4 = 23925,
	SunderArmorRank1 = 7386,
	SunderArmorRank2 = 7405,
	SunderArmorRank3 = 8380,
	SunderArmorRank4 = 11596,
	SunderArmorRank5 = 11597,
}
ids.Arms_Talent = {
	DeepWounds = 1,
	SwordSpecialization = 2,
	ImprovedHeroicStrike = 3,
	MaceSpecialization = 4,
	ImprovedCharge = 5,
	ImprovedRend = 6,
	ImprovedThunderClap = 7,
	ImprovedHamstring = 8,
	Deflection = 9,
	ImprovedOverpower = 10,
	AxeSpecialization = 11,
	SweepingStrikes = 12,
	PolearmSpecialization = 13,
	MortalStrike = 14,
	TwoHandedWeaponSpecialization = 15,
	AngerManagement = 16,
	TacticalMastery = 17,
	Impale = 18,
}
ids.Fury_Talent = {
	ImprovedBattleShout = 1,
	Enrage = 2,
	Flurry = 3,
	Cruelty = 4,
	BoomingVoice = 5,
	UnbridledWrath = 6,
	PiercingHowl = 7,
	ImprovedDemoralizingShout = 8,
	DeathWish = 9,
	ImprovedCleave = 10,
	Bloodthirst = 11,
	ImprovedSlam = 12,
	BloodCraze = 13,
	ImprovedBerserkerRage = 14,
	ImprovedExecute = 15,
	ImprovedIntercept = 16,
	DualWieldSpecialization = 17,
}
ids.Protection_Talent = {
	Anticipation = 1,
	Toughness = 2,
	IronWill = 3,
	ImprovedBloodrage = 4,
	ImprovedTaunt = 5,
	Defiance = 6,
	ImprovedShieldBlock = 7,
	ImprovedSunderArmor = 8,
	ImprovedRevenge = 9,
	ShieldSlam = 10,
	ImprovedShieldBash = 11,
	ImprovedShieldWall = 12,
	ImprovedDisarm = 13,
	ConcussionBlow = 14,
	LastStand = 15,
	OneHandedWeaponSpecialization = 16,
	ShieldSpecialization = 17,
}
ids.Engrave = {
	PreciseTiming = 6943, --waist
	Warbringer = 7035, --chest
}
ids.Runes = {
	CommandingShout = 403215,
	Intervene = 403338,
	RagingBlow = 402911,
	RallyingCry = 426490,
	Rampage = 426940,
	QuickStrike = 429765,

	VictoryRush = 402927,
	ConsumedbyRage = 425440, -- or 425418
	--BloodFrenzy = , --passive
	--FlagellationBuff = 402906,
	Devastate = 403195, --passive
	BloodSurge = 413380, --Phase 2 -passive -buff
}
-- Auras
ids.Buff = {
	BloodSurge = 413399, --Rune
	Bloodrage = 29131,
	Enrage = 425415, --Rune

	Slam = 46916,
	OverPower = 68051,
	SuddenDeath = 52437, -- Rune
	Warbringer = 425421,
}
ids.Debuff = {
	ExposeArmor = 8647,
	--SunderArmor = 58567,
	Degrade = 402818,
	DemoralizingRoar = 99,
}

function ConROC:UpdateSpellID()
--Ranks
	--Arms
	if IsSpellKnown(ids.Rank.ChargeRank3) then ids.Ability.Charge = ids.Rank.ChargeRank3;
	elseif IsSpellKnown(ids.Rank.ChargeRank2) then ids.Ability.Charge = ids.Rank.ChargeRank2; end

	if IsSpellKnown(ids.Rank.HamstringRank3) then ids.Ability.Hamstring = ids.Rank.HamstringRank3;
	elseif IsSpellKnown(ids.Rank.HamstringRank2) then ids.Ability.Hamstring = ids.Rank.HamstringRank2; end

	if IsSpellKnown(ids.Rank.HeroicStrikeRank9) then ids.Ability.HeroicStrike = ids.Rank.HeroicStrikeRank9;
	elseif IsSpellKnown(ids.Rank.HeroicStrikeRank8) then ids.Ability.HeroicStrike = ids.Rank.HeroicStrikeRank8;
	elseif IsSpellKnown(ids.Rank.HeroicStrikeRank7) then ids.Ability.HeroicStrike = ids.Rank.HeroicStrikeRank7;
	elseif IsSpellKnown(ids.Rank.HeroicStrikeRank6) then ids.Ability.HeroicStrike = ids.Rank.HeroicStrikeRank6;
	elseif IsSpellKnown(ids.Rank.HeroicStrikeRank5) then ids.Ability.HeroicStrike = ids.Rank.HeroicStrikeRank5;
	elseif IsSpellKnown(ids.Rank.HeroicStrikeRank4) then ids.Ability.HeroicStrike = ids.Rank.HeroicStrikeRank4;
	elseif IsSpellKnown(ids.Rank.HeroicStrikeRank3) then ids.Ability.HeroicStrike = ids.Rank.HeroicStrikeRank3;
	elseif IsSpellKnown(ids.Rank.HeroicStrikeRank2) then ids.Ability.HeroicStrike = ids.Rank.HeroicStrikeRank2; end

	if IsSpellKnown(ids.Rank.MockingBlowRank5) then ids.Ability.MockingBlow = ids.Rank.MockingBlowRank5;
	elseif IsSpellKnown(ids.Rank.MockingBlowRank4) then ids.Ability.MockingBlow = ids.Rank.MockingBlowRank4;
	elseif IsSpellKnown(ids.Rank.MockingBlowRank3) then ids.Ability.MockingBlow = ids.Rank.MockingBlowRank3;
	elseif IsSpellKnown(ids.Rank.MockingBlowRank2) then ids.Ability.MockingBlow = ids.Rank.MockingBlowRank2; end

	if IsSpellKnown(ids.Rank.MortalStrikeRank4) then ids.Ability.MortalStrike = ids.Rank.MortalStrikeRank4;
	elseif IsSpellKnown(ids.Rank.MortalStrikeRank3) then ids.Ability.MortalStrike = ids.Rank.MortalStrikeRank3;
	elseif IsSpellKnown(ids.Rank.MortalStrikeRank2) then ids.Ability.MortalStrike = ids.Rank.MortalStrikeRank2; end

	if IsSpellKnown(ids.Rank.OverpowerRank4) then ids.Ability.Overpower = ids.Rank.OverpowerRank4;
	elseif IsSpellKnown(ids.Rank.OverpowerRank3) then ids.Ability.Overpower = ids.Rank.OverpowerRank3;
	elseif IsSpellKnown(ids.Rank.OverpowerRank2) then ids.Ability.Overpower = ids.Rank.OverpowerRank2; end

	if IsSpellKnown(ids.Rank.RendRank7) then ids.Ability.Rend = ids.Rank.RendRank7;
	elseif IsSpellKnown(ids.Rank.RendRank6) then ids.Ability.Rend = ids.Rank.RendRank6;
	elseif IsSpellKnown(ids.Rank.RendRank5) then ids.Ability.Rend = ids.Rank.RendRank5;
	elseif IsSpellKnown(ids.Rank.RendRank4) then ids.Ability.Rend = ids.Rank.RendRank4;
	elseif IsSpellKnown(ids.Rank.RendRank3) then ids.Ability.Rend = ids.Rank.RendRank3;
	elseif IsSpellKnown(ids.Rank.RendRank2) then ids.Ability.Rend = ids.Rank.RendRank2; end

	if ConROC.Seasons.IsSoD then
		if IsSpellKnown(ids.Rank.ThunderClapRank6) then ids.Ability.ThunderClap = ids.Rank.ThunderClapSoDRank6;
		elseif IsSpellKnown(ids.Rank.ThunderClapRank5) then ids.Ability.ThunderClap = ids.Rank.ThunderClapSoDRank5;
		elseif IsSpellKnown(ids.Rank.ThunderClapRank4) then ids.Ability.ThunderClap = ids.Rank.ThunderClapSoDRank4;
		elseif IsSpellKnown(ids.Rank.ThunderClapRank3) then ids.Ability.ThunderClap = ids.Rank.ThunderClapSoDRank3;
		elseif IsSpellKnown(ids.Rank.ThunderClapRank2) then ids.Ability.ThunderClap = ids.Rank.ThunderClapSoDRank2;
		elseif IsSpellKnown(ids.Rank.ThunderClapRank1) then ids.Ability.ThunderClap = ids.Rank.ThunderClapSoDRank1; end
	else
		if IsSpellKnown(ids.Rank.ThunderClapRank6) then ids.Ability.ThunderClap = ids.Rank.ThunderClapRank6;
		elseif IsSpellKnown(ids.Rank.ThunderClapRank5) then ids.Ability.ThunderClap = ids.Rank.ThunderClapRank5;
		elseif IsSpellKnown(ids.Rank.ThunderClapRank4) then ids.Ability.ThunderClap = ids.Rank.ThunderClapRank4;
		elseif IsSpellKnown(ids.Rank.ThunderClapRank3) then ids.Ability.ThunderClap = ids.Rank.ThunderClapRank3;
		elseif IsSpellKnown(ids.Rank.ThunderClapRank2) then ids.Ability.ThunderClap = ids.Rank.ThunderClapRank2; end
	end

	--Fury
	if IsSpellKnown(ids.Rank.BattleShoutRank7) then ids.Ability.BattleShout = ids.Rank.BattleShoutRank7;
	elseif IsSpellKnown(ids.Rank.BattleShoutRank6) then ids.Ability.BattleShout = ids.Rank.BattleShoutRank6;
	elseif IsSpellKnown(ids.Rank.BattleShoutRank5) then ids.Ability.BattleShout = ids.Rank.BattleShoutRank5;
	elseif IsSpellKnown(ids.Rank.BattleShoutRank4) then ids.Ability.BattleShout = ids.Rank.BattleShoutRank4;
	elseif IsSpellKnown(ids.Rank.BattleShoutRank3) then ids.Ability.BattleShout = ids.Rank.BattleShoutRank3;
	elseif IsSpellKnown(ids.Rank.BattleShoutRank2) then ids.Ability.BattleShout = ids.Rank.BattleShoutRank2; end

	if IsSpellKnown(ids.Rank.BloodthirstRank4) then ids.Ability.Bloodthirst = ids.Rank.BloodthirstRank4;
	elseif IsSpellKnown(ids.Rank.BloodthirstRank3) then ids.Ability.Bloodthirst = ids.Rank.BloodthirstRank3;
	elseif IsSpellKnown(ids.Rank.BloodthirstRank2) then ids.Ability.Bloodthirst = ids.Rank.BloodthirstRank2; end

	if IsSpellKnown(ids.Rank.CleaveRank5) then ids.Ability.Cleave = ids.Rank.CleaveRank5;
	elseif IsSpellKnown(ids.Rank.CleaveRank4) then ids.Ability.Cleave = ids.Rank.CleaveRank4;
	elseif IsSpellKnown(ids.Rank.CleaveRank3) then ids.Ability.Cleave = ids.Rank.CleaveRank3;
	elseif IsSpellKnown(ids.Rank.CleaveRank2) then ids.Ability.Cleave = ids.Rank.CleaveRank2; end

	if IsSpellKnown(ids.Rank.ExecuteRank5) then ids.Ability.Execute = ids.Rank.ExecuteRank5;
	elseif IsSpellKnown(ids.Rank.ExecuteRank4) then ids.Ability.Execute = ids.Rank.ExecuteRank4;
	elseif IsSpellKnown(ids.Rank.ExecuteRank3) then ids.Ability.Execute = ids.Rank.ExecuteRank3;
	elseif IsSpellKnown(ids.Rank.ExecuteRank2) then ids.Ability.Execute = ids.Rank.ExecuteRank2; end

	if IsSpellKnown(ids.Rank.InterceptRank3) then ids.Ability.Intercept = ids.Rank.InterceptRank3;
	elseif IsSpellKnown(ids.Rank.InterceptRank2) then ids.Ability.Intercept = ids.Rank.InterceptRank2; end

	if IsSpellKnown(ids.Rank.PummelRank2) then ids.Ability.Pummel = ids.Rank.PummelRank2; end

	if IsSpellKnown(ids.Rank.SlamRank4) then ids.Ability.Slam = ids.Rank.SlamRank4;
	elseif IsSpellKnown(ids.Rank.SlamRank3) then ids.Ability.Slam = ids.Rank.SlamRank3;
	elseif IsSpellKnown(ids.Rank.SlamRank2) then ids.Ability.Slam = ids.Rank.SlamRank2; end

	--Protection
	if IsSpellKnown(ids.Rank.RevengeRank6) then ids.Ability.Revenge = ids.Rank.RevengeRank6;
	elseif IsSpellKnown(ids.Rank.RevengeRank5) then ids.Ability.Revenge = ids.Rank.RevengeRank5;
	elseif IsSpellKnown(ids.Rank.RevengeRank4) then ids.Ability.Revenge = ids.Rank.RevengeRank4;
	elseif IsSpellKnown(ids.Rank.RevengeRank3) then ids.Ability.Revenge = ids.Rank.RevengeRank3;
	elseif IsSpellKnown(ids.Rank.RevengeRank2) then ids.Ability.Revenge = ids.Rank.RevengeRank2; end

	if IsSpellKnown(ids.Rank.ShieldBashRank3) then ids.Ability.ShieldBash = ids.Rank.ShieldBashRank3;
	elseif IsSpellKnown(ids.Rank.ShieldBashRank2) then ids.Ability.ShieldBash = ids.Rank.ShieldBashRank2; end

	if IsSpellKnown(ids.Rank.ShieldSlamRank4) then ids.Ability.ShieldSlam = ids.Rank.ShieldSlamRank4;
	elseif IsSpellKnown(ids.Rank.ShieldSlamRank3) then ids.Ability.ShieldSlam = ids.Rank.ShieldSlamRank3;
	elseif IsSpellKnown(ids.Rank.ShieldSlamRank2) then ids.Ability.ShieldSlam = ids.Rank.ShieldSlamRank2; end

	if IsSpellKnown(ids.Rank.SunderArmorRank5) then ids.Ability.SunderArmor = ids.Rank.SunderArmorRank5;
	elseif IsSpellKnown(ids.Rank.SunderArmorRank4) then ids.Ability.SunderArmor = ids.Rank.SunderArmorRank4;
	elseif IsSpellKnown(ids.Rank.SunderArmorRank3) then ids.Ability.SunderArmor = ids.Rank.SunderArmorRank3;
	elseif IsSpellKnown(ids.Rank.SunderArmorRank2) then ids.Ability.SunderArmor = ids.Rank.SunderArmorRank2; end

	if IsSpellKnown(ids.Rank.DemoralizingShoutRank5) then ids.Ability.DemoralizingShout = ids.Rank.DemoralizingShoutRank5;
	elseif IsSpellKnown(ids.Rank.DemoralizingShoutRank4) then ids.Ability.DemoralizingShout = ids.Rank.DemoralizingShoutRank4;
	elseif IsSpellKnown(ids.Rank.DemoralizingShoutRank3) then ids.Ability.DemoralizingShout = ids.Rank.DemoralizingShoutRank3;
	elseif IsSpellKnown(ids.Rank.DemoralizingShoutRank2) then ids.Ability.DemoralizingShout = ids.Rank.DemoralizingShoutRank2; end
end