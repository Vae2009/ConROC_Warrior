local printTalentsMode = false

-- Slash command for printing talent tree with talent names and ID numbers
SLASH_CONROCPRINTTALENTS1 = "/ConROCPT"
SlashCmdList["CONROCPRINTTALENTS"] = function()
    printTalentsMode = not printTalentsMode
    ConROC:PopulateTalentIDs()
end

ConROC.Warrior = {};

local ConROC_Warrior, ids = ...;
local optionMaxIds = ...;
local currentSpecName;
local currentSpecID;

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Warrior.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end
	
	ConROC:JustSundered(spellID);
end

function ConROC:PopulateTalentIDs()
    local numTabs = GetNumTalentTabs()
    
    for tabIndex = 1, numTabs do
        local tabName = GetTalentTabInfo(tabIndex)
        tabName = string.gsub(tabName, "[^%w]", "") .. "_Talent" -- Remove spaces from tab name
        print("ids."..tabName.." = {")
        local numTalents = GetNumTalents(tabIndex)

        for talentIndex = 1, numTalents do
            local name, _, _, _, _ = GetTalentInfo(tabIndex, talentIndex)

            if name then
                local talentID = string.gsub(name, "[^%w]", "") -- Remove spaces from talent name
                    print(talentID .." = ", talentIndex ..",")
            end
        end
        print("}")
    end
end

local Racial, Spec, Stance, Arms_Ability, Arms_Talent, Fury_Ability, Fury_Talent, Prot_Ability, Prot_Talent, Player_Buff, Player_Debuff, Target_Debuff = ids.Racial, ids.Spec, ids.Stance, ids.Arms_Ability, ids.Arms_Talent, ids.Fury_Ability, ids.Fury_Talent, ids.Prot_Ability, ids.Protection_Talent, ids.Player_Buff, ids.Player_Debuff, ids.Target_Debuff;	

function ConROC:SpecUpdate()
	currentSpecName = ConROC:currentSpec()
    currentSpecID = ConROC:currentSpec("ID")

	if currentSpecName then
	   ConROC:Print(self.Colors.Info .. "Current spec:", self.Colors.Success ..  currentSpecName)
	else
	   ConROC:Print(self.Colors.Error .. "You do not currently have a spec.")
	end
end
ConROC:SpecUpdate()

--Arms
local _BattleStance = Arms_Ability.BattleStance;
local _Charge = Arms_Ability.ChargeRank1;
local _Hamstring = Arms_Ability.HamstringRank1;
local _HeroicStrike = Arms_Ability.HeroicStrikeRank1;
local _MockingBlow = Arms_Ability.MockingBlowRank1;
local _MortalStrike = Arms_Ability.MortalStrikeRank1;
local _Overpower = Arms_Ability.OverpowerRank1;
local _SweepingStrikes = Arms_Ability.SweepingStrikes;--new
local _Rend = Arms_Ability.RendRank1;
local _Retaliation = Arms_Ability.Retaliation;--new
local _ThunderClap = Arms_Ability.ThunderClapRank1;--new

--Fury
local _BattleShout = Fury_Ability.BattleShoutRank1;
local _BerserkerRage = Fury_Ability.BerserkerRage;--new
local _BerserkerStance = Fury_Ability.BerserkerStance;
local _Bloodthirst = Fury_Ability.BloodthirstRank1;
local _ChallengingShout = Fury_Ability.ChallengingShout;
local _Cleave = Fury_Ability.CleaveRank1;
local _DeathWish = Fury_Ability.DeathWish;--new
local _DemoralizingShout = Fury_Ability.DemoralizingShoutRank1;
local _Execute = Fury_Ability.ExecuteRank1;
local _HeroicFury = Fury_Ability.HeroicFury;--new
local _Intercept = Fury_Ability.InterceptRank1;
local _IntimidatingShout = Fury_Ability.IntimidatingShout;--new
local _PiercingHowl = Fury_Ability.PiercingHowl;--new
local _Pummel = Fury_Ability.PummelRank1;
local _Recklessness = Fury_Ability.Recklessness;--new
local _Slam = Fury_Ability.SlamRank1;
local _Whirlwind = Fury_Ability.Whirlwind;--new

--Protection
local _Bloodrage = Prot_Ability.Bloodrage;
local _ConcussionBlow = Prot_Ability.ConcussionBlow;
local _DefensiveStance = Prot_Ability.DefensiveStance;
local _Disarm = Prot_Ability.Disarm;
local _LastStand = Prot_Ability.LastStand;
local _Revenge = Prot_Ability.RevengeRank1;
local _ShieldBash = Prot_Ability.ShieldBashRank1;
local _ShieldBlock = Prot_Ability.ShieldBlock;
local _ShieldSlam = Prot_Ability.ShieldSlamRank1;
local _ShieldWall = Prot_Ability.ShieldWall;
local _SpellReflection = Prot_Ability.SpellReflection;
local _SunderArmor = Prot_Ability.SunderArmorRank1;
local _Taunt = Prot_Ability.Taunt;
local sArmorEXP = 0;

--runes
local _VictoryRush = ids.Runes.VictoryRush;
local _RagingBlow = ids.Runes.RagingBlow;
local _QuickStrike = ids.Runes.QuickStrike;
local _Devastate = ids.Runes.Devastate;

function ConROC:UpdateSpellID()
--Ranks
--Arms
if IsSpellKnown(Arms_Ability.ChargeRank3) then _Charge = Arms_Ability.ChargeRank3;
elseif IsSpellKnown(Arms_Ability.ChargeRank2) then _Charge = Arms_Ability.ChargeRank2; end

if IsSpellKnown(Arms_Ability.HamstringRank3) then _Hamstring = Arms_Ability.HamstringRank3;
elseif IsSpellKnown(Arms_Ability.HamstringRank2) then _Hamstring = Arms_Ability.HamstringRank2; end	

if IsSpellKnown(Arms_Ability.HeroicStrikeRank9) then _HeroicStrike = Arms_Ability.HeroicStrikeRank9;
elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank8) then _HeroicStrike = Arms_Ability.HeroicStrikeRank8;
elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank7) then _HeroicStrike = Arms_Ability.HeroicStrikeRank7;
elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank6) then _HeroicStrike = Arms_Ability.HeroicStrikeRank6;
elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank5) then _HeroicStrike = Arms_Ability.HeroicStrikeRank5;
elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank4) then _HeroicStrike = Arms_Ability.HeroicStrikeRank4;
elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank3) then _HeroicStrike = Arms_Ability.HeroicStrikeRank3;
elseif IsSpellKnown(Arms_Ability.HeroicStrikeRank2) then _HeroicStrike = Arms_Ability.HeroicStrikeRank2; end

if IsSpellKnown(Arms_Ability.MockingBlowRank5) then _MockingBlow = Arms_Ability.MockingBlowRank5;
elseif IsSpellKnown(Arms_Ability.MockingBlowRank4) then _MockingBlow = Arms_Ability.MockingBlowRank4;
elseif IsSpellKnown(Arms_Ability.MockingBlowRank3) then _MockingBlow = Arms_Ability.MockingBlowRank3;
elseif IsSpellKnown(Arms_Ability.MockingBlowRank2) then _MockingBlow = Arms_Ability.MockingBlowRank2; end

if IsSpellKnown(Arms_Ability.MortalStrikeRank4) then _MortalStrike = Arms_Ability.MortalStrikeRank4;
elseif IsSpellKnown(Arms_Ability.MortalStrikeRank3) then _MortalStrike = Arms_Ability.MortalStrikeRank3;
elseif IsSpellKnown(Arms_Ability.MortalStrikeRank2) then _MortalStrike = Arms_Ability.MortalStrikeRank2; end

if IsSpellKnown(Arms_Ability.OverpowerRank4) then _Overpower = Arms_Ability.OverpowerRank4;
elseif IsSpellKnown(Arms_Ability.OverpowerRank3) then _Overpower = Arms_Ability.OverpowerRank3;
elseif IsSpellKnown(Arms_Ability.OverpowerRank2) then _Overpower = Arms_Ability.OverpowerRank2; end

if IsSpellKnown(Arms_Ability.RendRank7) then _Rend = Arms_Ability.RendRank7;
elseif IsSpellKnown(Arms_Ability.RendRank6) then _Rend = Arms_Ability.RendRank6;
elseif IsSpellKnown(Arms_Ability.RendRank5) then _Rend = Arms_Ability.RendRank5;
elseif IsSpellKnown(Arms_Ability.RendRank4) then _Rend = Arms_Ability.RendRank4;
elseif IsSpellKnown(Arms_Ability.RendRank3) then _Rend = Arms_Ability.RendRank3;
elseif IsSpellKnown(Arms_Ability.RendRank2) then _Rend = Arms_Ability.RendRank2; end

if IsSpellKnown(Arms_Ability.ThunderClapRank6) then _ThunderClap = Arms_Ability.ThunderClapRank6;
elseif IsSpellKnown(Arms_Ability.ThunderClapRank5) then _ThunderClap = Arms_Ability.ThunderClapRank5;
elseif IsSpellKnown(Arms_Ability.ThunderClapRank4) then _ThunderClap = Arms_Ability.ThunderClapRank4;
elseif IsSpellKnown(Arms_Ability.ThunderClapRank3) then _ThunderClap = Arms_Ability.ThunderClapRank3;
elseif IsSpellKnown(Arms_Ability.ThunderClapRank2) then _ThunderClap = Arms_Ability.ThunderClapRank2; end

--Fury
if IsSpellKnown(Fury_Ability.BattleShoutRank7) then _BattleShout = Fury_Ability.BattleShoutRank7;
elseif IsSpellKnown(Fury_Ability.BattleShoutRank6) then _BattleShout = Fury_Ability.BattleShoutRank6;
elseif IsSpellKnown(Fury_Ability.BattleShoutRank5) then _BattleShout = Fury_Ability.BattleShoutRank5;
elseif IsSpellKnown(Fury_Ability.BattleShoutRank4) then _BattleShout = Fury_Ability.BattleShoutRank4;
elseif IsSpellKnown(Fury_Ability.BattleShoutRank3) then _BattleShout = Fury_Ability.BattleShoutRank3;
elseif IsSpellKnown(Fury_Ability.BattleShoutRank2) then _BattleShout = Fury_Ability.BattleShoutRank2; end	

if IsSpellKnown(Fury_Ability.BloodthirstRank4) then _Bloodthirst = Fury_Ability.BloodthirstRank4;
elseif IsSpellKnown(Fury_Ability.BloodthirstRank3) then _Bloodthirst = Fury_Ability.BloodthirstRank3;
elseif IsSpellKnown(Fury_Ability.BloodthirstRank2) then _Bloodthirst = Fury_Ability.BloodthirstRank2; end	

if IsSpellKnown(Fury_Ability.CleaveRank5) then _Cleave = Fury_Ability.CleaveRank5;
elseif IsSpellKnown(Fury_Ability.CleaveRank4) then _Cleave = Fury_Ability.CleaveRank4;
elseif IsSpellKnown(Fury_Ability.CleaveRank3) then _Cleave = Fury_Ability.CleaveRank3;
elseif IsSpellKnown(Fury_Ability.CleaveRank2) then _Cleave = Fury_Ability.CleaveRank2; end

--if IsSpellKnown(Fury_Ability.CommandingShoutRank3) then _CommandingShout = Fury_Ability.CommandingShoutRank3;
--elseif IsSpellKnown(Fury_Ability.CommandingShoutRank2) then _CommandingShout = Fury_Ability.CommandingShoutRank2; end

if IsSpellKnown(Fury_Ability.ExecuteRank5) then _Execute = Fury_Ability.ExecuteRank5;
elseif IsSpellKnown(Fury_Ability.ExecuteRank4) then _Execute = Fury_Ability.ExecuteRank4;
elseif IsSpellKnown(Fury_Ability.ExecuteRank3) then _Execute = Fury_Ability.ExecuteRank3;
elseif IsSpellKnown(Fury_Ability.ExecuteRank2) then _Execute = Fury_Ability.ExecuteRank2; end

if IsSpellKnown(Fury_Ability.InterceptRank3) then _Intercept = Fury_Ability.InterceptRank3;
elseif IsSpellKnown(Fury_Ability.InterceptRank2) then _Intercept = Fury_Ability.InterceptRank2; end

if IsSpellKnown(Fury_Ability.PummelRank2) then _Pummel = Fury_Ability.PummelRank2; end

if IsSpellKnown(Fury_Ability.SlamRank4) then _Slam = Fury_Ability.SlamRank4;
elseif IsSpellKnown(Fury_Ability.SlamRank3) then _Slam = Fury_Ability.SlamRank3;
elseif IsSpellKnown(Fury_Ability.SlamRank2) then _Slam = Fury_Ability.SlamRank2; end

--Protection
if IsSpellKnown(Prot_Ability.RevengeRank6) then _Revenge = Prot_Ability.RevengeRank6;
elseif IsSpellKnown(Prot_Ability.RevengeRank5) then _Revenge = Prot_Ability.RevengeRank5;
elseif IsSpellKnown(Prot_Ability.RevengeRank4) then _Revenge = Prot_Ability.RevengeRank4;
elseif IsSpellKnown(Prot_Ability.RevengeRank3) then _Revenge = Prot_Ability.RevengeRank3;
elseif IsSpellKnown(Prot_Ability.RevengeRank2) then _Revenge = Prot_Ability.RevengeRank2; end

if IsSpellKnown(Prot_Ability.ShieldBashRank3) then _ShieldBash = Prot_Ability.ShieldBashRank3;
elseif IsSpellKnown(Prot_Ability.ShieldBashRank2) then _ShieldBash = Prot_Ability.ShieldBashRank2; end

if IsSpellKnown(Prot_Ability.ShieldSlamRank4) then _ShieldSlam = Prot_Ability.ShieldSlamRank4;
elseif IsSpellKnown(Prot_Ability.ShieldSlamRank3) then _ShieldSlam = Prot_Ability.ShieldSlamRank3;
elseif IsSpellKnown(Prot_Ability.ShieldSlamRank2) then _ShieldSlam = Prot_Ability.ShieldSlamRank2; end

if IsSpellKnown(Prot_Ability.SunderArmorRank5) then _SunderArmor = Prot_Ability.SunderArmorRank5;
elseif IsSpellKnown(Prot_Ability.SunderArmorRank4) then _SunderArmor = Prot_Ability.SunderArmorRank4;
elseif IsSpellKnown(Prot_Ability.SunderArmorRank3) then _SunderArmor = Prot_Ability.SunderArmorRank3;
elseif IsSpellKnown(Prot_Ability.SunderArmorRank2) then _SunderArmor = Prot_Ability.SunderArmorRank2; end


ids.optionMaxIds = {
	--Arms
	Charge = _Charge,
	Hamstring = _Hamstring,
	HeroicStrike = _HeroicStrike,
	MockingBlow = _MockingBlow,
	MortalStrike = _MortalStrike,
	Overpower = _Overpower,
	SweepingStrikes = _SweepingStrikes,
	Rend = _Rend,
	Retaliation = _Retaliation,
	ThunderClap = _ThunderClap,
	--Fury
	BattleShout = _BattleShout,
	BerserkerRage = _BerserkerRage,
	Bloodthirst = _Bloodthirst,
	ChallengingShout = _ChallengingShout,
	Cleave = _Cleave,
	DeathWish = _DeathWish,
	DemoralizingShout = _DemoralizingShout,
	Execute = _Execute,
	HeroicFury = _HeroicFury,
	Intercept = _Intercept,
	IntimidatingShout = _IntimidatingShout,
	PiercingHowl = _PiercingHowl,
	Pummel = _Pummel,
	Slam = _Slam,
	--Protection
	Bloodrage = _Bloodrage,
	ConcussionBlow = _ConcussionBlow,
	Disarm = _Disarm,
	LastStand = _LastStand,
	Revenge = _Revenge,
	ShieldBash = _ShieldBash,
	ShieldBlock = _ShieldBlock,
	ShieldSlam = _ShieldSlam,
	ShieldWall = _ShieldWall,
	SpellReflection = _SpellReflection,
	SunderArmor = _SunderArmor,
	Taunt = _Taunt,
	--runes
	VictoryRush = _VictoryRush,
	RagingBlow = _RagingBlow,
	QuickStrike = _QuickStrike,
	Devastate = _Devastate,
}
end
ConROC:UpdateSpellID()
function ConROC:EnableRotationModule()
	self.Description = 'Warrior';
	self.NextSpell = ConROC.Warrior.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self:RegisterEvent("PLAYER_TALENT_UPDATE");
	self.lastSpellId = 0;	
	
	ConROC:SpellmenuClass();
end
function ConROC:PLAYER_TALENT_UPDATE()
	ConROC:SpecUpdate();
    ConROC:closeSpellmenu();
end

function ConROC.Warrior.Damage(_, timeShift, currentSpell, gcd)
ConROC:UpdateSpellID()
--Character
	local plvl 												= UnitLevel('player');
	
--Racials

--Resources	
	local rage 												= UnitPower('player', Enum.PowerType.Rage);
	local rageMax 											= UnitPowerMax('player', Enum.PowerType.Rage);

--Abilities
	local chargeRDY		 									= ConROC:AbilityReady(_Charge, timeShift);
		local inChRange 										= ConROC:IsSpellInRange(_Charge, 'target');
	local hstringRDY		 								= ConROC:AbilityReady(_Hamstring, timeShift);
		local hstringDEBUFF		 								= ConROC:DebuffName(_Hamstring, timeShift);	
	local hStrikeRDY		 								= ConROC:AbilityReady(_HeroicStrike, timeShift);
	local mStrikeRDY		 								= ConROC:AbilityReady(_MortalStrike, timeShift);
	local oPowerRDY											= ConROC:AbilityReady(_Overpower, timeShift);	
		local oPowerBUFF, oPowerBuffDUR							= ConROC:BuffName(ids.Player_Buff.Overpower, timeshift)
	local sStrikesRDY										= ConROC:AbilityReady(_SweepingStrikes, timeShift);	
	local rendRDY											= ConROC:AbilityReady(_Rend, timeShift);
		local rendDEBUFF		 								= ConROC:TargetDebuff(_Rend, timeShift);

	local batShoutRDY		 								= ConROC:AbilityReady(_BattleShout, timeShift);	
		local batShoutBUFF		 								= ConROC:BuffName(_BattleShout, timeShift);
	local bThirstRDY, bthirstCD								= ConROC:AbilityReady(_Bloodthirst, timeShift);
		local bThirstBUFF										= ConROC:Buff(_Bloodthirst, timeShift);
	local cleaveRDY											= ConROC:AbilityReady(_Cleave, timeShift);
--	local comShoutRDY										= ConROC:AbilityReady(_CommandingShout, timeShift);
--		local comShoutBUFF, comShoutBuffDUR						= ConROC:BuffName(_CommandingShout, timeShift);
	local dWishRDY											= ConROC:AbilityReady(_DeathWish, timeShift);
		local dWishBUFF											= ConROC:BuffName(_DeathWish, timeShift);
	local exeRDY											= ConROC:AbilityReady(_Execute, timeShift);
	local interRDY											= ConROC:AbilityReady(_Intercept, timeShift);
		local interRange 										= ConROC:IsSpellInRange(_Intercept, 'target');
	local iShoutRDY											= ConROC:AbilityReady(_IntimidatingShout, timeShift);
	local pHowlRDY											= ConROC:AbilityReady(_PiercingHowl, timeShift);
		local pHowlDEBUFF		 								= ConROC:DebuffName(_PiercingHowl, timeShift);	
	local pummelRDY											= ConROC:AbilityReady(_Pummel, timeShift);
	local reckRDY											= ConROC:AbilityReady(_Recklessness, timeShift);
	local slamRDY											= ConROC:AbilityReady(_Slam, timeShift);
		local slamBUFF, slamBuffDUR								= ConROC:BuffName(ids.Player_Buff.Slam, timeShift)
	local sDeathBUFF											= ConROC:BuffName(ids.Player_Buff.Slam, timeShift)
	local wwRDY												= ConROC:AbilityReady(_Whirlwind, timeShift);
	
	local bRageRDY											= ConROC:AbilityReady(_Bloodrage, timeShift);
		local bRageBUFF 										= ConROC:Buff(_Bloodrage, timeShift);
	local cBlowRDY											= ConROC:AbilityReady(_ConcussionBlow, timeShift);
	--local devastateRDY										= ConROC:AbilityReady(_Devastate, timeShift);
	local revengeRDY										= ConROC:AbilityReady(_Revenge, timeShift);
	local sBlockRDY											= ConROC:AbilityReady(_ShieldBlock, timeShift);
		local sBlockBUFF										= ConROC:Buff(_ShieldBlock, timeShift);
	local sBashRDY											= ConROC:AbilityReady(_ShieldBash, timeShift);	
	local sSlamRDY											= ConROC:AbilityReady(_ShieldSlam, timeShift);	
	local sArmorRDY											= ConROC:AbilityReady(_SunderArmor, timeShift);
		local sArmorDEBUFF, sArmorCount							= ConROC:TargetDebuff(_SunderArmor, timeShift);	
		local sArmorDEBUFF2		 								= ConROC:DebuffName(_SunderArmor, timeShift);	
		local sArmorDUR											= sArmorEXP - GetTime();
	local sWaveRDY = false;
	
	local tclapRDY											= ConROC:AbilityReady(_ThunderClap, timeShift);	
		local tclapDEBUFF		 								= ConROC:TargetDebuff(_ThunderClap, timeShift);	
	
	local batStanceRDY 										= ConROC:AbilityReady(_BattleStance, timeShift);
	local defStanceRDY 										= ConROC:AbilityReady(_DefensiveStance, timeShift);
	local berStanceRDY 										= ConROC:AbilityReady(_BerserkerStance, timeShift);

	local expArmorDEBUFF		 							= ConROC:TargetDebuff(ids.Target_Debuff.ExposeArmor, timeShift);
	local degradeDEBUFF		 								= ConROC:TargetDebuff(ids.Target_Debuff.Degrade, timeShift);

--runes
	local vRushRDY = ConROC:AbilityReady(_VictoryRush, timeShift);
	local ragingBlowRDY = ConROC:AbilityReady(_RagingBlow, timeShift);
	--local devastateRDY = ConROC:AbilityReady(_Devastate, timeShift);
	local qStrikeRDY = ConROC:AbilityReady(_QuickStrike, timeShift);
	local cbyRageBUFF, cbyRageDUR = ConROC:BuffName(ids.Player_Buff.ConsumedbyRage);

--Conditions
	local inStance											= GetShapeshiftForm();
	local incombat 											= UnitAffectingCombat('player');	
	local playerPh 											= ConROC:PercentHealth('player');
	local targetPh 											= ConROC:PercentHealth('target');
	local Close 											= IsSpellInRange(select(1,GetSpellInfo(_HeroicStrike)), "target")--CheckInteractDistance("target", 3);
	local tarInMelee										= 0;
	local tarInAoe											= 0;
	local twohandIDs = {1,5,6,8,10} --Two-Handed Axes, Two-Handed Maces, Polearms, Two-Handed Swords, Saves
	local twoHand = ConROC:Equipped(twohandIDs, "MAINHANDSLOT")
	local dualWielding = ConROC:Equipped("wpn", "MAINHANDSLOT") and ConROC:Equipped("wpn", "SECONDARYHANDSLOT")

	--print("dualWielding", dualWielding)

	if IsSpellKnown(_Rend) then
		tarInMelee = ConROC:Targets(_Rend);
	end
	if ConROC_AoEButton:IsVisible() and IsSpellKnown(_ThunderClap) then
		tarInAoe = ConROC:Targets(_ThunderClap);
	end
--print(sArmorDUR); -- Still Testing Sunder Refresh Misses.
--Indicators		
	ConROC:AbilityMovement(_Charge, chargeRDY and inChRange and not incombat and inStance == Stance.Battle);
	ConROC:AbilityMovement(_Intercept, interRDY and interRange and inStance == Stance.Berserker);
	ConROC:AbilityTaunt(_HeroicStrike, ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and hStrikeRDY and rage >= 30 and ((tarInMelee >= 1 and not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or (tarInMelee == 1 and ConROC:CheckBox(ConROC_SM_Rage_Cleave)))); --Felt looks better then Burst.
	ConROC:AbilityTaunt(_Cleave, ConROC:CheckBox(ConROC_SM_Rage_Cleave) and cleaveRDY and rage >= 40 and tarInMelee >= 2);
	
	ConROC:AbilityBurst(_SweepingStrikes, sStrikesRDY and inStance == Stance.Battle and tarInMelee >= 2);
	ConROC:AbilityBurst(_DeathWish, dWishRDY and incombat and not ConROC:TarYou());
	ConROC:AbilityBurst(_Recklessness, reckRDY and incombat and not ConROC:TarYou() and ((not ConROC:TalentChosen(Spec.Fury, Fury_Talent.DeathWish)) or (ConROC:TalentChosen(Spec.Fury, Fury_Talent.DeathWish) and dWishRDY)));
    
    ConROC:AbilityInterrupt(_Pummel, ConROC:Interrupt() and pummelRDY)
	
--Warnings
	--Rotations
	if ConROC.Seasons.IsSoD then
		if vRushRDY and ConROC:Targets(_HeroicStrike) >= 1 then
			return _VictoryRush
		end
		if plvl < 10 or ConROC:CheckBox(ConROC_SM_Role_Melee) and not inStance == Stance.Defensive then
			if ConROC:CheckBox(ConROC_SM_Shout_Bloodrage) and bRageRDY and rage <= 75 and playerPh >= 70 and incombat then
				return _Bloodrage;
			end

			if ConROC:CheckBox(ConROC_SM_Shout_BattleShout) and batShoutRDY and not batShoutBUFF then
				return _BattleShout;
			end
			if inStance == Stance.Defensive and IsSpellKnownOrOverridesKnown(_Devastate) and sArmorRDY then
				return _SunderArmor;
			end
			if ConROC:CheckBox(ConROC_SM_Debuff_SunderArmor) and not IsSpellKnownOrOverridesKnown(_Devastate) and sArmorRDY and sArmorDEBUFF and sArmorCount < ConROC_SM_Debuff_SunderArmorCount:GetNumber() and not (expArmorDEBUFF or degradeDEBUFF) then
				return _SunderArmor;
			end
			if ragingBlowRDY and (bRageBUFF or cbyRageBUFF) then
				return _RagingBlow
			end
			if oPowerRDY and inStance == Stance.Battle then
				return _Overpower;
			end
			if twoHand and qStrikeRDY and (rage > 80 or cbyRageBUFF)  then
				return _QuickStrike;
			end			
			if ConROC:CheckBox(ConROC_SM_Rage_Cleave) and cleaveRDY and tarInMelee >= 2 then
				return _Cleave;
			end	
			if ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and hStrikeRDY and ((tarInMelee >= 1 and not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or (tarInMelee == 1 and ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) then
				return _HeroicStrike;
			end
			if dualWielding and ConROC:CheckBox(ConROC_SM_Stun_Hamstring) and hstringRDY and not hstringDEBUFF and not pHowlDEBUFF and inStance == (Stance.Battle or Stance.Berserker) then
				return _Hamstring;
			end
		end
		if ConROC:CheckBox(ConROC_SM_Role_Tank) or inStance == Stance.Defensive then
			--print("sArmorCount", sArmorCount, "sArmorCount setting:", ConROC_SM_Debuff_SunderArmorCount:GetNumber())
			--print("IsSpellKnownOrOverridesKnown(_Devastate)", IsSpellKnownOrOverridesKnown(_Devastate))
			if ConROC_AoEButton:IsVisible() then
				if ConROC:CheckBox(ConROC_SM_Debuff_ThunderClap) and tclapRDY and not tclapDEBUFF and inStance == Stance.Battle then
					return _ThunderClap;
				end 
			end
			if revengeRDY then
				return _Revenge
			end
			if sBlockRDY and not sBlockBUFF then
				return _ShieldBlock
			end
			if ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and hStrikeRDY and rage > 95 then
				return _HeroicStrike;
			end
			if inStance == Stance.Defensive and IsSpellKnownOrOverridesKnown(_Devastate) and sArmorRDY then
				return _SunderArmor;
			end
			if ConROC:CheckBox(ConROC_SM_Debuff_SunderArmor) and not IsSpellKnownOrOverridesKnown(_Devastate) and sArmorRDY and (not sArmorDEBUFF or sArmorCount < ConROC_SM_Debuff_SunderArmorCount:GetNumber()) and not (expArmorDEBUFF or degradeDEBUFF) then
				return _SunderArmor;
			end
			if ConROC:CheckBox(ConROC_SM_Rage_Cleave) and rage > 95 and cleaveRDY and tarInMelee >= 2 then
				return _Cleave;
			end
			if ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and rage > 95 and hStrikeRDY and ((tarInMelee >= 1 and not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or (tarInMelee == 1 and ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) then
				return _HeroicStrike;
			end
		end
		return nil;
	else --not SoD
		if ConROC:CheckBox(ConROC_SM_Shout_BattleShout) and batShoutRDY and not batShoutBUFF then
			return _BattleShout;
		end
		
		if ConROC:CheckBox(ConROC_SM_Shout_Bloodrage) and bRageRDY and rage <= 75 and playerPh >= 70 and incombat then
			return _Bloodrage;
		end
		
		if ConROC:CheckBox(ConROC_SM_Debuff_SunderArmor) and sArmorRDY and sArmorDEBUFF and sArmorDUR <= 6 and not (expArmorDEBUFF or degradeDEBUFF) then
			return _SunderArmor;
		end

		if wwRDY and tarInMelee >= 3 and inStance == Stance.Berserker then
			return _Whirlwind;
		end	
		
		if exeRDY and targetPh <= 20 and inStance == (Stance.Battle or Stance.Berserker) then
			return _Execute;
		end
		
		if oPowerRDY and inStance == Stance.Battle then
			return _Overpower;
		end
		
		if revengeRDY and inStance == Stance.Defensive then
			return _Revenge;
		end	
		
		if bThirstRDY then
			return _Bloodthirst;
		end		
		
		if ConROC:TalentChosen(Spec.Fury, Fury_Talent.Bloodthirst) then
			if wwRDY and bthirstCD > 2 and inStance == Stance.Berserker then
				return _Whirlwind;
			end	
		else
			if wwRDY and inStance == Stance.Berserker then
				return _Whirlwind;
			end
		end

		if sSlamRDY and ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
			return _ShieldSlam;
		end
		
		if mStrikeRDY then
			return _MortalStrike;
		end
		
		if ConROC:CheckBox(ConROC_SM_Debuff_Rend) and rendRDY and not rendDEBUFF and inStance == (Stance.Battle or Stance.Defensive) and not (ConROC:CreatureType('Mechanical') or ConROC:CreatureType('Elemental') or ConROC:CreatureType('Undead')) then
			return _Rend;
		end
		
		if ConROC:CheckBox(ConROC_SM_Debuff_SunderArmor) and sArmorRDY and not expArmorDEBUFF  and (not sArmorDEBUFF2 or sArmorCount < ConROC_SM_Debuff_SunderArmorCount:GetNumber()) and rage >= 30 then
			return _SunderArmor;
		end
		
		if ConROC:CheckBox(ConROC_SM_Stun_PiercingHowl) and pHowlRDY and not pHowlDEBUFF and not hstringDEBUFF and tarInMelee >= 2 then
			return _PiercingHowl;
		end
		
		if ConROC:CheckBox(ConROC_SM_Stun_Hamstring) and hstringRDY and not hstringDEBUFF and not pHowlDEBUFF and inStance == (Stance.Battle or Stance.Berserker) then
			return _Hamstring;
		end
		
		if ConROC:CheckBox(ConROC_SM_Stun_ConcussionBlow) and cBlowRDY then
			return _ConcussionBlow;
		end

		if ConROC:CheckBox(ConROC_SM_Rage_Cleave) and cleaveRDY and rage >= 85 and tarInMelee >= 2 then
			return _Cleave;
		end	
		
		if ConROC:CheckBox(ConROC_SM_Rage_Slam) and slamRDY and not ConROC:TarYou() then
			return _Slam;
		end		

		if ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and hStrikeRDY and rage >= 85 and ((tarInMelee >= 1 and not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or (tarInMelee == 1 and ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) then
			return _HeroicStrike;
		end
		return nil;
		--if currentSpecID == ids.Spec.Arms then
		--elseif currentSpecID == ids.Spec.Fury then
		--elseif currentSpecID == ids.Spec.Protection then
		--end
	end
end

function ConROC.Warrior.Defense(_, timeShift, currentSpell, gcd, tChosen)
--Character
	local plvl 												= UnitLevel('player');
	
--Racials

--Ranks
	--Arms
	local _MockingBlow = Arms_Ability.MockingBlowRank1;
	local _ThunderClap = Arms_Ability.ThunderClapRank1;
	
	--if IsSpellKnown(Arms_Ability.MockingBlowRank5) then _MockingBlow = Arms_Ability.MockingBlowRank5;
	--elseif IsSpellKnown(Arms_Ability.MockingBlowRank4) then _MockingBlow = Arms_Ability.MockingBlowRank4;
	--elseif IsSpellKnown(Arms_Ability.MockingBlowRank3) then _MockingBlow = Arms_Ability.MockingBlowRank3;
	--elseif IsSpellKnown(Arms_Ability.MockingBlowRank2) then _MockingBlow = Arms_Ability.MockingBlowRank2; end	

	if IsSpellKnown(Arms_Ability.ThunderClapRank6) then _ThunderClap = Arms_Ability.ThunderClapRank6;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank5) then _ThunderClap = Arms_Ability.ThunderClapRank5;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank4) then _ThunderClap = Arms_Ability.ThunderClapRank4;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank3) then _ThunderClap = Arms_Ability.ThunderClapRank3;
	elseif IsSpellKnown(Arms_Ability.ThunderClapRank2) then _ThunderClap = Arms_Ability.ThunderClapRank2; end

	--Fury

	if IsSpellKnown(Fury_Ability.DemoralizingShoutRank5) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank5;
	elseif IsSpellKnown(Fury_Ability.DemoralizingShoutRank4) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank4;
	elseif IsSpellKnown(Fury_Ability.DemoralizingShoutRank3) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank3;
	elseif IsSpellKnown(Fury_Ability.DemoralizingShoutRank2) then _DemoralizingShout = Fury_Ability.DemoralizingShoutRank2; end
	
--Resources	
	local rage 												= UnitPower('player', Enum.PowerType.Rage);
	local rageMax 											= UnitPowerMax('player', Enum.PowerType.Rage);
	
--Abilities	
	local mBlowRDY		 									= ConROC:AbilityReady(_MockingBlow, timeShift);
	local retalRDY											= ConROC:AbilityReady(Arms_Ability.Retaliation, timeShift);
	local tclapRDY											= ConROC:AbilityReady(_ThunderClap, timeShift);	
		local tclapDEBUFF		 								= ConROC:TargetDebuff(_ThunderClap, timeShift);	
		
	local berRageRDY										= ConROC:AbilityReady(_BerserkerRage, timeShift);
	local cShoutRDY											= ConROC:AbilityReady(_ChallengingShout, timeShift);
	local dShoutRDY											= ConROC:AbilityReady(_DemoralizingShout, timeShift);
		local dShoutDEBUFF										= ConROC:DebuffName(_DemoralizingShout);
		local dRoarDEBUFF										= ConROC:DebuffName(99); --Demoralizing Roar
		
	local disarmRDY											= ConROC:AbilityReady(_Disarm, timeShift);
	local lStandRDY											= ConROC:AbilityReady(_LastStand, timeShift);
	local sBlockRDY											= ConROC:AbilityReady(_ShieldBlock, timeShift);
		local sBlockBUFF										= ConROC:Buff(_ShieldBlock, timeShift);
	local sWallRDY											= ConROC:AbilityReady(_ShieldWall, timeShift);
	local tauntRDY											= ConROC:AbilityReady(_Taunt, timeShift);
			
--Conditions	
	local playerPh 											= ConROC:PercentHealth('player');
	local inStance											= GetShapeshiftForm();
	local tarInMelee										= 0;
	local incombat 											= UnitAffectingCombat('player');
	
	if IsSpellKnown(Prot_Ability.Taunt) then
		tarInMelee = ConROC:Targets(Prot_Ability.Taunt);
	end
	
--Indicators	
	ConROC:AbilityTaunt(_Taunt, ConROC:CheckBox(ConROC_SM_Role_Tank) and tauntRDY and inStance == Stance.Defensive and not ConROC:TarYou());
	ConROC:AbilityTaunt(_MockingBlow, ConROC:CheckBox(ConROC_SM_Role_Tank) and mBlowRDY and inStance == Stance.Battle);
	ConROC:AbilityTaunt(_ChallengingShout, ConROC:CheckBox(ConROC_SM_Role_Tank) and cShoutRDY and tarInMelee >= 3);
	
--Rotations	
	if lStandRDY and incombat and playerPh <= 35 then
		return Prot_Ability.LastStand;
	end

	if sWallRDY and inStance == Stance.Defensive and playerPh <= 25 and ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
		return Prot_Ability.ShieldWall;
	end
	
	if sBlockRDY and not sBlockBUFF and inStance == Stance.Defensive then
		return Prot_Ability.ShieldBlock;
	end
	
	if ConROC:CheckBox(ConROC_SM_Debuff_ThunderClap) and tclapRDY and not tclapDEBUFF and inStance == Stance.Battle then
		return _ThunderClap;
	end

	if berRageRDY and inStance == Stance.Berserker then
		return Fury_Ability.BerserkerRage;
	end
	
	if ConROC:CheckBox(ConROC_SM_Shout_DemoralizingShout) and dShoutRDY and not (dShoutDEBUFF or dRoarDEBUFF) then
		return _DemoralizingShout;
	end
	
	if retalRDY and incombat and inStance == Stance.Battle and not ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
		return Arms_Ability.Retaliation;
	end
	
	return nil;
end

function ConROC:JustSundered(spellID)
	if spellID == _SunderArmor then
		local expTime = GetTime() + 30;
		sArmorEXP = expTime;
	end
end
