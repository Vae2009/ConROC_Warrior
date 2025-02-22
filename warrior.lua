ConROC.Warrior = {};

local ConROC_Warrior, ids = ...;

function ConROC:EnableRotationModule()
	self.Description = 'Warrior';
	self.NextSpell = ConROC.Warrior.Damage;

	self:RegisterEvent('UNIT_SPELLCAST_SUCCEEDED');
	self.lastSpellId = 0;

	if ConROCSpellmenuClass == nil then
		ConROC:SpellmenuClass();
	end
end

function ConROC:EnableDefenseModule()
	self.NextDef = ConROC.Warrior.Defense;
end

function ConROC:UNIT_SPELLCAST_SUCCEEDED(event, unitID, lineID, spellID)
	if unitID == 'player' then
		self.lastSpellId = spellID;
	end

	ConROC:JustSundered(spellID);
end

local Racial, Spec, Stance, Ability, Rank, Arms_Talent, Fury_Talent, Prot_Talent, Engrave, Runes, Buff, Debuff = ids.Racial, ids.Spec, ids.Stance, ids.Ability, ids.Rank, ids.Arms_Talent, ids.Fury_Talent, ids.Protection_Talent, ids.Engrave, ids.Runes, ids.Buff, ids.Debuff;
local sArmorEXP = 0;

local _AutoAttack, _AutoAttack_RDY = ConROC:AbilityReady(6603, timeShift);

--Info
local _Player_Spec, _Player_Spec_ID = ConROC:currentSpec();
local _Player_Level = UnitLevel("player");
local _Player_Percent_Health = ConROC:PercentHealth('player');
local _is_PvP = ConROC:IsPvP();
local _in_combat = UnitAffectingCombat('player');
local _party_size = GetNumGroupMembers();
local _is_PC = UnitPlayerControlled("target");
local _is_Enemy = ConROC:TarHostile();
local _Target_Health = UnitHealth('target');
local _Target_Percent_Health = ConROC:PercentHealth('target');

--Resources
local _Rage, _Rage_Max = ConROC:PlayerPower('Rage');

--Conditions
local _Queue = 0;
local _is_moving = ConROC:PlayerSpeed();
local _enemies_in_melee, _target_in_melee = ConROC:Targets("Melee");
local _enemies_in_10yrds, _target_in_10yrds = ConROC:Targets("10");
local _enemies_in_20yrds, _target_in_20yrds = ConROC:Targets("20");
local _enemies_in_40yrds, _target_in_40yrds = ConROC:Targets("40");
local _can_Execute = _Target_Percent_Health < 20;

--Racials
local _Berserking, _Berserking_RDY = _, _;

function ConROC:Stats()
	_AutoAttack, _AutoAttack_RDY = ConROC:AbilityReady(6603, timeShift);

	_Player_Spec, _Player_Spec_ID = ConROC:currentSpec();
	_Player_Level = UnitLevel("player");
	_Player_Percent_Health = ConROC:PercentHealth('player');
	_is_PvP = ConROC:IsPvP();
	_in_combat = UnitAffectingCombat('player');
	_party_size = GetNumGroupMembers();
	_is_PC = UnitPlayerControlled("target");
	_is_Enemy = ConROC:TarHostile();
	_Target_Health = UnitHealth('target');
	_Target_Percent_Health = ConROC:PercentHealth('target');

	_Rage, _Rage_Max = ConROC:PlayerPower('Rage');

	_Queue = 0;
	_is_moving = ConROC:PlayerSpeed();
	_enemies_in_melee, _target_in_melee = ConROC:Targets("Melee");
	_enemies_in_10yrds, _target_in_10yrds = ConROC:Targets("10");
	_enemies_in_20yrds, _target_in_20yrds = ConROC:Targets("20");
	_enemies_in_40yrds, _target_in_40yrds = ConROC:Targets("40");
	_can_Execute = _Target_Percent_Health < 20;

	_Berserking, _Berserking_RDY = ConROC:AbilityReady(Racial.Berserking, timeShift);
end

function ConROC.Warrior.Damage(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	wipe(ConROC.SuggestedSpells);
	ConROC:Stats();

--Abilities
	local _BattleShout, _BattleShout_RDY = ConROC:AbilityReady(Ability.BattleShout, timeShift);
		local _, _, _, _BattleShout_BUFF = ConROC:Aura(_BattleShout, timeShift);
	local _BerserkerRage, _BerserkerRage_RDY = ConROC:AbilityReady(Ability.BerserkerRage, timeShift);
	local _Bloodrage, _Bloodrage_RDY = ConROC:AbilityReady(Ability.Bloodrage, timeShift);
		local _Bloodrage_BUFF = ConROC:Aura(Buff.Bloodrage, timeShift);
	local _Bloodthirst, _Bloodthirst_RDY, _Bloodthirst_CD = ConROC:AbilityReady(Ability.Bloodthirst, timeShift);
		local _Bloodthirst_BUFF	= ConROC:Aura(Buff.Bloodthirst, timeShift);
	local _Charge, _Charge_RDY = ConROC:AbilityReady(Ability.Charge, timeShift);
		local _, _Charge_RANGE = ConROC:Targets(Ability.Charge);
	local _Cleave, _Cleave_RDY = ConROC:AbilityReady(Ability.Cleave, timeShift);
	local _DeathWish, _DeathWish_RDY = ConROC:AbilityReady(Ability.DeathWish, timeShift);
		local _DeathWish_BUFF = ConROC:Aura(Buff.DeathWish, timeShift);
	local _DemoralizingShout, _DemoralizingShout_RDY = ConROC:AbilityReady(Ability.DemoralizingShout, timeShift);
		local _, _, _, _DemoralizingShout_UP = ConROC:TargetAura(_DemoralizingShout);
	local _Execute, _Execute_RDY = ConROC:AbilityReady(Ability.Execute, timeShift);
	local _Hamstring, _Hamstring_RDY = ConROC:AbilityReady(Ability.Hamstring, timeShift);
		local _Hamstring_DEBUFF	= ConROC:TargetAura(_Hamstring, timeShift);
	local _HeroicStrike, _HeroicStrike_RDY = ConROC:AbilityReady(Ability.HeroicStrike, timeShift);
	local _Intercept, _Intercept_RDY = ConROC:AbilityReady(Ability.Intercept, timeShift);
		local _Intercept_RANGE = ConROC:Targets(Ability.Intercept);
	local _IntimidatingShout, _IntimidatingShout_RDY = ConROC:AbilityReady(Ability.IntimidatingShout, timeShift);
	local _MortalStrike, _MortalStrike_RDY = ConROC:AbilityReady(Ability.MortalStrike, timeShift);
	local _Overpower, _Overpower_RDY = ConROC:AbilityReady(Ability.Overpower, timeShift);
		local _Overpower_BUFF, _, _Overpower_DUR = ConROC:Aura(Buff.Overpower, timeshift)
	local _PiercingHowl, _PiercingHowl_RDY = ConROC:AbilityReady(Ability.PiercingHowl, timeShift);
		local _PiercingHowl_DEBUFF = ConROC:TargetAura(_PiercingHowl, timeShift);
	local _Pummel, _Pummel_RDY = ConROC:AbilityReady(Ability.Pummel, timeShift);
	local _Recklessness, _Recklessness_RDY = ConROC:AbilityReady(Ability.Recklessness, timeShift);
	local _Rend, _Rend_RDY = ConROC:AbilityReady(Ability.Rend, timeShift);
		local _Rend_DEBUFF, _, _Rend_DUR = ConROC:TargetAura(_Rend, timeShift);
	local _Slam, _Slam_RDY = ConROC:AbilityReady(Ability.Slam, timeShift);
		local _Slam_BUFF, _, _Slam_DUR = ConROC:Aura(Buff.Slam, timeShift)
	local _SweepingStrikes, _SweepingStrikes_RDY = ConROC:AbilityReady(Ability.SweepingStrikes, timeShift);
	local _ThunderClap, _ThunderClap_RDY = ConROC:AbilityReady(Ability.ThunderClap, timeShift);
		local _ThunderClap_DEBUFF = ConROC:TargetAura(_ThunderClap, timeShift);
	local _Whirlwind, _Whirlwind_RDY = ConROC:AbilityReady(Ability.Whirlwind, timeShift);

	local _SuddenDeath_BUFF = ConROC:Aura(Buff.SuddenDeath, timeShift)

	local _ConcussionBlow, _ConcussionBlow_RDY = ConROC:AbilityReady(Ability.ConcussionBlow, timeShift);
	local _Revenge, _Revenge_RDY = ConROC:AbilityReady(Ability.Revenge, timeShift);
	local _ShieldBlock, _ShieldBlock_RDY = ConROC:AbilityReady(Ability.ShieldBlock, timeShift);
		local _ShieldBlock_BUFF = ConROC:Aura(Buff.ShieldBlock, timeShift);
	local _ShieldBash, _ShieldBash_RDY = ConROC:AbilityReady(Ability.ShieldBash, timeShift);
	local _ShieldSlam, _ShieldSlam_RDY = ConROC:AbilityReady(Ability.ShieldSlam, timeShift);
	local _SunderArmor, _SunderArmor_RDY = ConROC:AbilityReady(Ability.SunderArmor, timeShift);
		local _, _SunderArmor_COUNT, _SunderArmor_DUR, _SunderArmor_DEBUFF = ConROC:TargetAura(_SunderArmor, timeShift);
	local sWaveRDY = false;

	local _ThunderClap, _ThunderClap_RDY = ConROC:AbilityReady(Ability.ThunderClap, timeShift);
		local _ThunderClap_DEBUFF = ConROC:TargetAura(Debuff.ThunderClap, timeShift);

	local _BattleStance, _BattleStance_RDY = ConROC:AbilityReady(Ability.BattleStance, timeShift);
	local _DefensiveStance, _DefensiveStance_RDY = ConROC:AbilityReady(Ability.DefensiveStance, timeShift);
	local _BerserkerStance, _BerserkerStance_RDY = ConROC:AbilityReady(Ability.BerserkerStance, timeShift);

	local _, _, _, _ExposeArmor_UP = ConROC:TargetAura(Debuff.ExposeArmor, timeShift);
	local _, _, _, _Degrade_UP = ConROC:TargetAura(Debuff.Degrade, timeShift);

--Runes
	local _CommandingShout, _CommandingShout_RDY = ConROC:AbilityReady(Runes.CommandingShout, timeShift);
	local _RagingBlow, _RagingBlow_RDY = ConROC:AbilityReady(Runes.RagingBlow, timeShift);
	local _Rampage, _Rampage_RDY = ConROC:AbilityReady(Runes.Rampage, timeShift);
		local _Enrage_BUFF = ConROC:Aura(Buff.Enrage, timeShift);
		local _BloodSurge_BUFF = ConROC:Aura(Buff.BloodSurge, timeShift);

	local _VictoryRush, _VictoryRush_RDY = ConROC:AbilityReady(Runes.VictoryRush, timeShift);
	local _QuickStrike, _QuickStrike_RDY = ConROC:AbilityReady(Runes.QuickStrike, timeShift);

--Conditions
	local _in_stance = GetShapeshiftForm();
	local _Enraged = false;

	local twohandIDs = {1,5,6,8,10} --Two-Handed Axes, Two-Handed Maces, Polearms, Two-Handed Swords, Saves
	local twoHand = ConROC:Equipped(twohandIDs, "MAINHANDSLOT")
	local dualWielding = ConROC:Equipped("wpn", "MAINHANDSLOT") and ConROC:Equipped("wpn", "SECONDARYHANDSLOT")

	if _DeathWish_BUFF or _Enrage_BUFF or _Bloodrage_BUFF then
		_Enraged = true;
	end

	local _Execute_COST = 15
	if ConROC:TalentChosen(Spec.Fury, Fury_Talent.ImprovedExecute) then
		if select(2, ConROC:TalentChosen(Spec.Fury, Fury_Talent.ImprovedExecute)) == 1 then
			_Execute_COST = 12
		elseif select(2, ConROC:TalentChosen(Spec.Fury, Fury_Talent.ImprovedExecute)) == 2 then
			_Execute_COST = 10
		end
	end

--print("dualWielding", dualWielding)
--Indicators		
	ConROC:AbilityMovement(_Charge, _Charge_RDY and _Charge_RANGE and ((ConROC:RuneEquipped(Engrave.Warbringer, "chest") or (not _in_combat and _in_stance == Stance.Battle))));
	ConROC:AbilityMovement(_Intercept, _Intercept_RDY and _Intercept_RANGE and _in_stance == Stance.Berserker);
	ConROC:AbilityTaunt(_HeroicStrike, ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and _HeroicStrike_RDY and not IsCurrentSpell(_HeroicStrike) and _Rage >= 30 and ((_enemies_in_melee >= 1 and not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or (_enemies_in_melee == 1 and ConROC:CheckBox(ConROC_SM_Rage_Cleave)))); --Felt looks better then Burst.
	ConROC:AbilityTaunt(_Cleave, ConROC:CheckBox(ConROC_SM_Rage_Cleave) and _Cleave_RDY and not IsCurrentSpell(_Cleave) and _Rage >= 40 and _enemies_in_melee >= 2);

	ConROC:AbilityBurst(_SweepingStrikes, _SweepingStrikes_RDY and _in_stance == Stance.Battle and _enemies_in_melee >= 2);
	ConROC:AbilityBurst(_DeathWish, _DeathWish_RDY and _in_combat and not ConROC:TarYou());
	ConROC:AbilityBurst(_Recklessness, _Recklessness_RDY and _in_combat and not ConROC:TarYou() and ((not ConROC:TalentChosen(Spec.Fury, Fury_Talent.DeathWish)) or (ConROC:TalentChosen(Spec.Fury, Fury_Talent.DeathWish) and _DeathWish_RDY)));
	ConROC:AbilityBurst(_BerserkerRage, _BerserkerRage_RDY and _Rage <= 30 and _in_stance == Stance.Berserker);

	ConROC:AbilityRaidBuffs(_CommandingShout, ConROC:CheckBox(ConROC_SM_Shout_CommandingShout) and _CommandingShout_RDY and not ConROC:RaidBuff(Runes.CommandingShout));
    ConROC:AbilityInterrupt(_Pummel, _Pummel_RDY and ConROC:Interrupt())

--Warnings

--Rotations
	repeat
		while(true) do
			if ConROC.Seasons.IsSoD then
				if ConROC:CheckBox(ConROC_SM_Role_Tank) or _in_stance == Stance.Defensive then
					if ConROC_AoEButton:IsVisible() then
						if ConROC:CheckBox(ConROC_SM_Debuff_ThunderClap) and _ThunderClap_RDY and _Rage >= 20 and not _ThunderClap_DEBUFF and _in_stance == Stance.Battle then
							tinsert(ConROC.SuggestedSpells, _ThunderClap);
							_ThunderClap_RDY = false;
							_ThunderClap_DEBUFF = true;
							_Rage = _Rage - 20;
							_Queue = _Queue + 1;
							break;
						end
					end

					if _Revenge_RDY and _Rage >= 5 then
						tinsert(ConROC.SuggestedSpells, _Revenge);
						_Revenge_RDY = false;
						_Rage = _Rage - 5;
						_Queue = _Queue + 1;
						break;
					end

					if _ShieldBlock_RDY and _Rage >= 10 and not _ShieldBlock_BUFF then
						tinsert(ConROC.SuggestedSpells, _ShieldBlock);
						_ShieldBlock_RDY = false;
						_Rage = _Rage - 10;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and _HeroicStrike_RDY and not IsCurrentSpell(_HeroicStrike) and _Rage >= 15 and _Rage > 95 then
						tinsert(ConROC.SuggestedSpells, _HeroicStrike);
						_HeroicStrike_RDY = false;
						_Rage = _Rage - 15;
						_Queue = _Queue + 1;
						break;
					end

					if _in_stance == Stance.Defensive and _SunderArmor_RDY and _Rage >= 15 then
						tinsert(ConROC.SuggestedSpells, _SunderArmor);
						_Rage = _Rage - 15;
						_SunderArmor_DEBUFF = true;
						_SunderArmor_COUNT = _SunderArmor_COUNT + 1;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Debuff_SunderArmor) and _SunderArmor_RDY and _Rage >= 15 and (not _SunderArmor_DEBUFF or _SunderArmor_COUNT < ConROC_SM_Debuff_SunderArmorCount:GetNumber()) and not (_ExposeArmor_UP or _Degrade_UP) then
						tinsert(ConROC.SuggestedSpells, _SunderArmor);
						_Rage = _Rage - 15;
						_SunderArmor_DEBUFF = true;
						_SunderArmor_COUNT = _SunderArmor_COUNT + 1;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Debuff_ThunderClap) and _ThunderClap_RDY and _Rage >= 20 and not _ThunderClap_DEBUFF and _in_stance == Stance.Battle then
						tinsert(ConROC.SuggestedDefSpells, _ThunderClap);
						_ThunderClap_RDY = false;
						_Rage = _Rage - 20;
						_ThunderClap_DEBUFF = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Shout_DemoralizingShout) and _DemoralizingShout_RDY and _Rage >= 10 and not _DemoralizingShout_UP then
						tinsert(ConROC.SuggestedDefSpells, _DemoralizingShout);
						_Rage = _Rage - 10;
						_DemoralizingShout_UP = true;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rage_Cleave) and _Cleave_RDY and not IsCurrentSpell(_Cleave) and _Rage >= 20 and _Rage > 95 and _enemies_in_melee >= 2 then
						tinsert(ConROC.SuggestedSpells, _Cleave);
						_Cleave_RDY = false;
						_Rage = _Rage - 20;
						_Queue = _Queue + 1;
						break;
					end

					if ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and _HeroicStrike_RDY and not IsCurrentSpell(_HeroicStrike) and _Rage >= 15 and _Rage > 95 and ((_enemies_in_melee >= 1 and not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or (_enemies_in_melee == 1 and ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) then
						tinsert(ConROC.SuggestedSpells, _HeroicStrike);
						_HeroicStrike_RDY = false;
						_Rage = _Rage - 15;
						_Queue = _Queue + 1;
						break;
					end

					tinsert(ConROC.SuggestedSpells, _AutoAttack); --Waiting Spell Icon
					_Queue = _Queue + 3;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Shout_Bloodrage) and _Bloodrage_RDY and _Rage <= 75 and _Player_Percent_Health >= 70 and _in_combat then
					tinsert(ConROC.SuggestedSpells, _Bloodrage);
					_Bloodrage_RDY = false;
					_Rage = _Rage + 10;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Debuff_SunderArmor) and _SunderArmor_RDY and _Rage >= 15 and not (_ExposeArmor_UP or _Degrade_UP) and ((_SunderArmor_DEBUFF and _SunderArmor_DUR <= 6) or not _SunderArmor_DEBUFF or _SunderArmor_COUNT < ConROC_SM_Debuff_SunderArmorCount:GetNumber()) then
					tinsert(ConROC.SuggestedSpells, _SunderArmor);
					_Rage = _Rage - 15;
					_SunderArmor_DEBUFF = true;
					_SunderArmor_COUNT = _SunderArmor_COUNT + 1;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Shout_BattleShout) and _BattleShout_RDY and _Rage >= 10 and not _BattleShout_BUFF then
					tinsert(ConROC.SuggestedSpells, _BattleShout);
					_BattleShout_BUFF = true;
					_Rage = _Rage - 10;
					_Queue = _Queue + 1;
					break;
				end

				if _Whirlwind_RDY and _Rage >= 25 and _enemies_in_melee >= 3 and _in_stance == Stance.Berserker then
					tinsert(ConROC.SuggestedSpells, _Whirlwind);
					_Whirlwind_RDY = false;
					_Rage = _Rage - 25;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Rage_Execute) and _Execute_RDY and _Rage >= _Execute_COST and (_Target_Percent_Health <= 20 or _SuddenDeath_BUFF) and _enemies_in_melee == 1 and (_in_stance == Stance.Battle or _in_stance == Stance.Berserker) then
					tinsert(ConROC.SuggestedSpells, _Execute);
					_SuddenDeath_BUFF = false;
					_Rage = _Rage - _Execute_COST;
					_Queue = _Queue + 1;
					break;
				end

				if _Slam_RDY and (_BloodSurge_BUFF or (_Rage >= 15 and ConROC:RuneEquipped(Engrave.PreciseTiming, "waist"))) then
					tinsert(ConROC.SuggestedSpells, _Slam);
					if ConROC:RuneEquipped(Engrave.PreciseTiming, "waist") then
						_Slam_RDY = false;
					end
					if not _BloodSurge_BUFF then
						_Rage = _Rage - 15;
					end
					_BloodSurge_BUFF = false;
					_Queue = _Queue + 1;
					break;
				end

				if _DeathWish_RDY and _Rage >= 10 and _in_combat and not ConROC:TarYou() then
					tinsert(ConROC.SuggestedSpells, _DeathWish);
					_DeathWish_RDY = false;
					_Rage = _Rage - 10;
					_Queue = _Queue + 1;
					break;
				end

				if _Rampage_RDY and _Enraged then
					tinsert(ConROC.SuggestedSpells, _Rampage);
					_Rampage_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Bloodthirst_RDY and _Rage >= 30 then
					tinsert(ConROC.SuggestedSpells, _Bloodthirst);
					_Bloodthirst_RDY = false;
					_Rage = _Rage - 30;
					_Queue = _Queue + 1;
					break;
				end

				if _Overpower_RDY and _Rage >= 5 and _in_stance == Stance.Battle then
					tinsert(ConROC.SuggestedSpells, _Overpower);
					_Overpower_RDY = false;
					_Rage = _Rage - 5;
					_Queue = _Queue + 1;
					break;
				end

				if _MortalStrike_RDY and _Rage >= 30 then
					tinsert(ConROC.SuggestedSpells, _MortalStrike);
					_MortalStrike_RDY = false;
					_Rage = _Rage - 30;
					_Queue = _Queue + 1;
					break;
				end

				if _Whirlwind_RDY and _Rage >= 25 and _in_stance == Stance.Berserker then
					tinsert(ConROC.SuggestedSpells, _Whirlwind);
					_Whirlwind_RDY = false;
					_Rage = _Rage - 25;
					_Queue = _Queue + 1;
					break;
				end

				if _RagingBlow_RDY and _Enraged then
					tinsert(ConROC.SuggestedSpells, _RagingBlow);
					_RagingBlow_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Debuff_Rend) and _Rend_RDY and _Rage >= 10 and not _Rend_DEBUFF and _in_stance == (Stance.Battle or Stance.Defensive) and not (ConROC:CreatureType('Mechanical') or ConROC:CreatureType('Elemental') or ConROC:CreatureType('Undead')) then
					tinsert(ConROC.SuggestedSpells, _Rend);
					_Rend_DEBUFF = true;
					_Rage = _Rage - 10;
					_Queue = _Queue + 1;
					break;
				end

				if dualWielding and _Hamstring_RDY and _Rage >= 10 and ConROC:HasWindfury() and (_in_stance == Stance.Battle or _in_stance == Stance.Berserker) then
					tinsert(ConROC.SuggestedSpells, _Hamstring);
					_Hamstring_DEBUFF = true;
					_Rage = _Rage - 10;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Stun_PiercingHowl) and _PiercingHowl_RDY and _Rage >= 10 and not _PiercingHowl_DEBUFF and not _Hamstring_DEBUFF and _enemies_in_melee >= 2 then
					tinsert(ConROC.SuggestedSpells, _PiercingHowl);
					_PiercingHowl_DEBUFF = true;
					_Rage = _Rage - 10;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Stun_Hamstring) and _Hamstring_RDY and _Rage >= 10 and not _Hamstring_DEBUFF and not _PiercingHowl_DEBUFF and _in_stance == (Stance.Battle or Stance.Berserker) then
					tinsert(ConROC.SuggestedSpells, _Hamstring);
					_Hamstring_DEBUFF = true;
					_Rage = _Rage - 10;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Stun_ConcussionBlow) and _ConcussionBlow_RDY then
					tinsert(ConROC.SuggestedSpells, _ConcussionBlow);
					_ConcussionBlow_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if twoHand and _QuickStrike_RDY and _Rage >= 20 and (_Rage > 80 or _Enrage_BUFF) then
					tinsert(ConROC.SuggestedSpells, _QuickStrike);
					_Rage = _Rage - 20;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Debuff_ThunderClap) and _ThunderClap_RDY and _Rage >= 20 and not _ThunderClap_DEBUFF and _in_stance == Stance.Battle then
					tinsert(ConROC.SuggestedDefSpells, _ThunderClap);
					_ThunderClap_RDY = false;
					_Rage = _Rage - 20;
					_ThunderClap_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Shout_DemoralizingShout) and _DemoralizingShout_RDY and _Rage >= 10 and not _DemoralizingShout_UP then
					tinsert(ConROC.SuggestedDefSpells, _DemoralizingShout);
					_Rage = _Rage - 10;
					_DemoralizingShout_UP = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Rage_Cleave) and _Cleave_RDY and not IsCurrentSpell(_Cleave) and (_Rage > 80 or _Enrage_BUFF) and _enemies_in_melee >= 2 then
					tinsert(ConROC.SuggestedSpells, _Cleave);
					_Cleave_RDY = false;
					_Rage = _Rage - 20;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and _HeroicStrike_RDY and not IsCurrentSpell(_HeroicStrike) and _Rage >= 15 and (_Rage > 80 or _Enrage_BUFF) then
					tinsert(ConROC.SuggestedSpells, _HeroicStrike);
					_HeroicStrike_RDY = false;
					_Rage = _Rage - 15;
					_Queue = _Queue + 1;
					break;
				end

				tinsert(ConROC.SuggestedSpells, _AutoAttack); --Waiting Spell Icon
				_Queue = _Queue + 3;
				break;
			else --not SoD
				if ConROC:CheckBox(ConROC_SM_Shout_BattleShout) and _BattleShout_RDY and _Rage >= 10 and not _BattleShout_BUFF then
					tinsert(ConROC.SuggestedSpells, _BattleShout);
					_BattleShout_BUFF = true;
					_Rage = _Rage - 10;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Shout_Bloodrage) and _Bloodrage_RDY and _Rage <= 75 and _Player_Percent_Health >= 70 and _in_combat then
					tinsert(ConROC.SuggestedSpells, _Bloodrage);
					_Bloodrage_RDY = false;
					_Rage = _Rage + 10;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Debuff_SunderArmor) and _SunderArmor_RDY and _Rage >= 15 and _SunderArmor_DEBUFF and _SunderArmor_DUR <= 6 and not (_ExposeArmor_UP or _Degrade_UP) then
					tinsert(ConROC.SuggestedSpells, _SunderArmor);
					_Rage = _Rage - 15;
					_SunderArmor_DEBUFF = true;
					_SunderArmor_COUNT = _SunderArmor_COUNT + 1;
					_Queue = _Queue + 1;
					break;
				end

				if _Whirlwind_RDY and _Rage >= 25 and _enemies_in_melee >= 3 and _in_stance == Stance.Berserker then
					tinsert(ConROC.SuggestedSpells, _Whirlwind);
					_Whirlwind_RDY = false;
					_Rage = _Rage - 25;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Rage_Execute) and _Execute_RDY and _Rage >= _Execute_COST and _Target_Percent_Health <= 20 and _enemies_in_melee == 1 and (_in_stance == Stance.Battle or _in_stance == Stance.Berserker) then
					tinsert(ConROC.SuggestedSpells, _Execute);
					_Rage = _Rage - _Execute_COST;
					_Queue = _Queue + 1;
					break;
				end

				if _Overpower_RDY and _Rage >= 5 and _in_stance == Stance.Battle then
					tinsert(ConROC.SuggestedSpells, _Overpower);
					_Overpower_RDY = false;
					_Rage = _Rage - 5;
					_Queue = _Queue + 1;
					break;
				end

				if _Revenge_RDY and _in_stance == Stance.Defensive then
					tinsert(ConROC.SuggestedSpells, _Revenge);
					_Revenge_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if _Bloodthirst_RDY and _Rage >= 30 then
					tinsert(ConROC.SuggestedSpells, _Bloodthirst);
					_Bloodthirst_RDY = false;
					_Rage = _Rage - 30;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:TalentChosen(Spec.Fury, Fury_Talent.Bloodthirst) then
					if _Whirlwind_RDY and _Rage >= 25 and _Bloodthirst_CD > 2 and _in_stance == Stance.Berserker then
						tinsert(ConROC.SuggestedSpells, _Whirlwind);
						_Whirlwind_RDY = false;
						_Rage = _Rage - 25;
						_Queue = _Queue + 1;
						break;
					end
				else
					if _Whirlwind_RDY and _Rage >= 25 and _in_stance == Stance.Berserker then
						tinsert(ConROC.SuggestedSpells, _Whirlwind);
						_Whirlwind_RDY = false;
						_Rage = _Rage - 25;
						_Queue = _Queue + 1;
						break;
					end
				end

				if _ShieldSlam_RDY and _Rage >= 20 and ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
					tinsert(ConROC.SuggestedSpells, _ShieldSlam);
					_ShieldSlam_RDY = false;
					_Rage = _Rage - 20;
					_Queue = _Queue + 1;
					break;
				end

				if _MortalStrike_RDY and _Rage >= 30 then
					tinsert(ConROC.SuggestedSpells, _MortalStrike);
					_MortalStrike_RDY = false;
					_Rage = _Rage - 30;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Debuff_Rend) and _Rend_RDY and _Rage >= 10 and not _Rend_DEBUFF and (_in_stance == Stance.Battle or _in_stance == Stance.Defensive) and not (ConROC:CreatureType('Mechanical') or ConROC:CreatureType('Elemental') or ConROC:CreatureType('Undead')) then
					tinsert(ConROC.SuggestedSpells, _Rend);
					_Rend_DEBUFF = true;
					_Rage = _Rage - 10;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Debuff_SunderArmor) and _SunderArmor_RDY and _Rage >= 15 and not _ExposeArmor_UP and (not _SunderArmor_DEBUFF or _SunderArmor_COUNT < ConROC_SM_Debuff_SunderArmorCount:GetNumber()) and _Rage >= 30 then
					tinsert(ConROC.SuggestedSpells, _SunderArmor);
					_Rage = _Rage - 15;
					_SunderArmor_DEBUFF = true;
					_SunderArmor_COUNT = _SunderArmor_COUNT + 1;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Stun_PiercingHowl) and _PiercingHowl_RDY and _Rage >= 10 and not _PiercingHowl_DEBUFF and not _Hamstring_DEBUFF and _enemies_in_melee >= 2 then
					tinsert(ConROC.SuggestedSpells, _PiercingHowl);
					_PiercingHowl_DEBUFF = true;
					_Rage = _Rage - 10;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Stun_Hamstring) and _Hamstring_RDY and _Rage >= 10 and not _Hamstring_DEBUFF and not _PiercingHowl_DEBUFF and (_in_stance == Stance.Battle or _in_stance == Stance.Berserker) then
					tinsert(ConROC.SuggestedSpells, _Hamstring);
					_Hamstring_DEBUFF = true;
					_Rage = _Rage - 10;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Stun_ConcussionBlow) and _ConcussionBlow_RDY then
					tinsert(ConROC.SuggestedSpells, _ConcussionBlow);
					_ConcussionBlow_RDY = false;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Debuff_ThunderClap) and _ThunderClap_RDY and _Rage >= 20 and not _ThunderClap_DEBUFF and _in_stance == Stance.Battle then
					tinsert(ConROC.SuggestedDefSpells, _ThunderClap);
					_ThunderClap_RDY = false;
					_Rage = _Rage - 20;
					_ThunderClap_DEBUFF = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Shout_DemoralizingShout) and _DemoralizingShout_RDY and _Rage >= 10 and not _DemoralizingShout_UP then
					tinsert(ConROC.SuggestedDefSpells, _DemoralizingShout);
					_Rage = _Rage - 10;
					_DemoralizingShout_UP = true;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Rage_Cleave) and _Cleave_RDY and not IsCurrentSpell(_Cleave) and _Rage >= 85 and _enemies_in_melee >= 2 then
					tinsert(ConROC.SuggestedSpells, _Cleave);
					_Cleave_RDY = false;
					_Rage = _Rage - 20;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Rage_Slam) and _Slam_RDY and _Rage >= 15 and not ConROC:TarYou() then
					tinsert(ConROC.SuggestedSpells, _Slam);
					_Rage = _Rage - 15;
					_Queue = _Queue + 1;
					break;
				end

				if ConROC:CheckBox(ConROC_SM_Rage_HeroicStrike) and _HeroicStrike_RDY and not IsCurrentSpell(_HeroicStrike) and _Rage >= 85 and ((_enemies_in_melee >= 1 and not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or (_enemies_in_melee == 1 and ConROC:CheckBox(ConROC_SM_Rage_Cleave)) or not ConROC:CheckBox(ConROC_SM_Rage_Cleave)) then
					tinsert(ConROC.SuggestedSpells, _HeroicStrike);
					_HeroicStrike_RDY = false;
					_Rage = _Rage - 15;
					_Queue = _Queue + 1;
					break;
				end

				tinsert(ConROC.SuggestedSpells, _AutoAttack); --Waiting Spell Icon
				_Queue = _Queue + 3;
				break;
			end
		end
	until _Queue >= 3;
return nil;
end

function ConROC.Warrior.Defense(_, timeShift, currentSpell, gcd)
	ConROC:UpdateSpellID();
	wipe(ConROC.SuggestedDefSpells);
	ConROC:Stats();

--Abilities	
	local _MockingBlow, _MockingBlow_RDY = ConROC:AbilityReady(Ability.MockingBlow, timeShift);
	local _Retaliation, _Retaliation_RDY = ConROC:AbilityReady(Ability.Retaliation, timeShift);

	local _ChallengingShout, _ChallengingShout_RDY = ConROC:AbilityReady(Ability.ChallengingShout, timeShift);

	local _Disarm, _Disarm_RDY = ConROC:AbilityReady(Ability.Disarm, timeShift);
	local _LastStand, _LastStand_RDY = ConROC:AbilityReady(Ability.LastStand, timeShift);
	local _ShieldBlock, _ShieldBlock_RDY = ConROC:AbilityReady(Ability.ShieldBlock, timeShift);
		local _ShieldBlock_BUFF	= ConROC:Aura(_ShieldBlock, timeShift);
	local _ShieldWall, _ShieldWall_RDY = ConROC:AbilityReady(Ability.ShieldWall, timeShift);
	local _Taunt, _Taunt_RDY = ConROC:AbilityReady(Ability.Taunt, timeShift);

--Conditions	
	local _in_stance = GetShapeshiftForm();

--Indicators
	ConROC:AbilityTaunt(_Taunt, ConROC:CheckBox(ConROC_SM_Role_Tank) and _Taunt_RDY and _in_stance == Stance.Defensive and not ConROC:TarYou());
	ConROC:AbilityTaunt(_MockingBlow, ConROC:CheckBox(ConROC_SM_Role_Tank) and _MockingBlow_RDY and _in_stance == Stance.Battle);
	ConROC:AbilityTaunt(_ChallengingShout, ConROC:CheckBox(ConROC_SM_Role_Tank) and _ChallengingShout_RDY and _enemies_in_melee >= 3);

--Rotations	
	if _LastStand_RDY and _in_combat and _Player_Percent_Health <= 35 then
		tinsert(ConROC.SuggestedDefSpells, _LastStand);
	end

	if _ShieldWall_RDY and _in_stance == Stance.Defensive and _Player_Percent_Health <= 25 and ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
		tinsert(ConROC.SuggestedDefSpells, _ShieldWall);
	end

	if _ShieldBlock_RDY and not _ShieldBlock_BUFF and _in_stance == Stance.Defensive then
		tinsert(ConROC.SuggestedDefSpells, _ShieldBlock);
	end

	if _Retaliation_RDY and _in_combat and _in_stance == Stance.Battle and not ConROC:Equipped('Shields', 'SECONDARYHANDSLOT') then
		tinsert(ConROC.SuggestedDefSpells, _Retaliation);
	end
return nil;
end

function ConROC:JustSundered(spellID)
	if spellID == Ability.SunderArmor then
		local expTime = GetTime() + 30;
		sArmorEXP = expTime;
	end
end

function ConROC:HasWindfury()
	local _Windfury_Present = false;
	local _Windfury_IDs = {2636,3785,3786,3787,7141};
	local _has_Imbue, _, _, _Imbuement = GetWeaponEnchantInfo();
	if _has_Imbue then
		for _, v in pairs(_Windfury_IDs) do
			if _Imbuement == v then
				_Windfury_Present = true;
			end
		end
	end

	return _Windfury_Present;
end
