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
	SweepingStrikes = 12328,
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
	DeathWish = 12292,
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
	ChargeRank2 = 6178,
	ChargeRank3 = 11578,
	HamstringRank2 = 7372,
	HamstringRank3 = 7373,
	HeroicStrikeRank2 = 284,
	HeroicStrikeRank3 = 285,
	HeroicStrikeRank4 = 1608,
	HeroicStrikeRank5 = 11564,
	HeroicStrikeRank6 = 11565,
	HeroicStrikeRank7 = 11566,
	HeroicStrikeRank8 = 11567,
	HeroicStrikeRank9 = 25286,
	MockingBlowRank2 = 7400,
	MockingBlowRank3 = 7402,
	MockingBlowRank4 = 20559,
	MockingBlowRank5 = 20560,
	MortalStrikeRank2 = 21551,
	MortalStrikeRank3 = 21552,
	MortalStrikeRank4 = 21553,
	OverpowerRank2 = 7887,
	OverpowerRank3 = 11584,
	OverpowerRank4 = 11585,
	RendRank2 = 6546,
	RendRank3 = 6547,
	RendRank4 = 6548,
	RendRank5 = 11572,
	RendRank6 = 11573,
	RendRank7 = 11574,
	ThunderClapRank2 = 8198,
	ThunderClapRank3 = 8204,
	ThunderClapRank4 = 8205,
	ThunderClapRank5 = 11580,
	ThunderClapRank6 = 11581,
--Fury
	BattleShoutRank2 = 5242,
	BattleShoutRank3 = 6192,
	BattleShoutRank4 = 11549,
	BattleShoutRank5 = 11550,
	BattleShoutRank6 = 11551,
	BattleShoutRank7 = 25289,
	BloodthirstRank2 = 23892,
	BloodthirstRank3 = 23893,
	BloodthirstRank4 = 23894,
	CleaveRank2 = 7369,
	CleaveRank3 = 11608,
	CleaveRank4 = 11609,
	CleaveRank5 = 20569,
	DemoralizingShoutRank2 = 6190,
	DemoralizingShoutRank3 = 11554,
	DemoralizingShoutRank4 = 11555,
	DemoralizingShoutRank5 = 11556,
	ExecuteRank2 = 20658,
	ExecuteRank3 = 20660,
	ExecuteRank4 = 20661,
	ExecuteRank5 = 20662,
	InterceptRank2 = 20616,
	InterceptRank3 = 20617,
	PummelRank2 = 6554,
	SlamRank2 = 8820,
	SlamRank3 = 11604,
	SlamRank4 = 11605,
--Protection
	RevengeRank2 = 6574,
	RevengeRank3 = 7379,
	RevengeRank4 = 11600,
	RevengeRank5 = 11601,
	RevengeRank6 = 25288,
	ShieldBashRank2 = 1671,
	ShieldBashRank3 = 1672,
	ShieldSlamRank2 = 23923,
	ShieldSlamRank3 = 23924,
	ShieldSlamRank4 = 23925,
	SunderArmorRank2 = 7405,
	SunderArmorRank3 = 8380,
	SunderArmorRank4 = 11596,
	SunderArmorRank5 = 11597,
}
ids.Arms_Talent = {
	ImprovedHeroicStrike = 1,
	Defleciton = 2,
	ImprovedRend = 3,

	ImprovedCharge = 4,
	TacticalMastery = 5,
	ImprovedThunderClap = 6,

	ImprovedOverpower = 7,
	AngerManagement = 8,
	DeepWounds = 9,

	TwoHandedWeaponSpecialization = 10,
	Impale = 11,

	AxeSpecialization = 12,
	SweepingStrikes = 13,
	MaceSpecialization = 14,
	SwordSpecialization = 15,

	PolearmSpecialization = 16,
	ImprovedHamstring = 17,

	MortalStrike = 18,
}
ids.Fury_Talent = {
	BoomingVoice = 1,
	Cruelty = 2,

	ImprovedDemoralizingShout = 3,
	UnbridledWrath = 4,

	ImprovedCleave = 5,
	PiercingHowl = 6,
	BloodCraze = 7,
	ImprovedBattleShout = 8,

	DualWieldSpecialization = 9,
	ImprovedExecute = 10,
	Enrage = 11,

	ImprovedSlam = 12,
	DeathWish = 13,
	ImprovedIntercept = 14,

	ImprovedBerserkerRage = 15,
	Flurry = 16,

	Bloodthirst = 17,
}
ids.Protection_Talent = {
	ShieldSpecialization = 1,
	Anticipation = 2,

	ImprovedBloodrage = 3,
	Toughness = 4,
	IronWill = 5,

	LastStand = 6,
	ImprovedShieldBlock = 7,
	ImprovedRevenge = 8,
	Defiance = 9,

	ImprovedSunderArmor = 10,
	ImprovedDisarm = 11,
	ImprovedTaunt = 12,

	ImprovedShieldWall = 13,
	ConcussionBlow = 14,
	ImprovedShieldBash = 15,

	OneHandedWeaponSpecialization = 16,

	ShieldSlam = 17,
}
ids.Runes = {
	VictoryRush = 402927,
	ConsumedbyRage = 425440, -- or 425418
	--BloodFrenzy = , --passive
	--FlagellationBuff = 402906,
	RagingBlow = 402911,
	Devastate = 403195, --passive
	QuickStrike = 429765,
	BloodSurge = 413380, --Phase 2 -passive -buff
	RallyingCry = 426490, --Phase 2 -buff Health increased by 15% of maximum. for 10 sec
}
-- Auras
ids.Buff = {
	Slam = 46916,
	OverPower = 68051,
	SuddenDeath = 52437,
	Bloodrage = 29131,
	Warbringer = 425421,
	ConsumedbyRage = 425418,
	BloodSurge = 413399, --Phase 2 -Heroic Strike, Bloodthirst, and Whirlwind have a 30% chance to make your next Slam within 15 sec instant and cost no Rage.
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

	if IsSpellKnown(ids.Rank.ThunderClapRank6) then ids.Ability.ThunderClap = ids.Rank.ThunderClapRank6;
	elseif IsSpellKnown(ids.Rank.ThunderClapRank5) then ids.Ability.ThunderClap = ids.Rank.ThunderClapRank5;
	elseif IsSpellKnown(ids.Rank.ThunderClapRank4) then ids.Ability.ThunderClap = ids.Rank.ThunderClapRank4;
	elseif IsSpellKnown(ids.Rank.ThunderClapRank3) then ids.Ability.ThunderClap = ids.Rank.ThunderClapRank3;
	elseif IsSpellKnown(ids.Rank.ThunderClapRank2) then ids.Ability.ThunderClap = ids.Rank.ThunderClapRank2; end

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
end