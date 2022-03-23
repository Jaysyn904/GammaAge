//::///////////////////////////////////////////////////////////////////////////
//:: Name           Spines template test script
//:: FileName       mut_t_spines.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Spines (Physical)
Spines cannot be fired, but make the mutant a formidable unarmed combatant. In unarmed combat, he adds 1d6 piercing damage to
any successful strike, if small or medium sized. (1d8 if large.) When struck by an unarmed opponent (or one using a natural attack), the
opponent must make a DC 15 Reflex save or suffer 1d6 damage. If grappled, the opponent must make a DC 20 Reflex save or suffer
1d6 damage.

[Adds 1d6 Piercing to all natural attacks, 1d6 piercing damage DC:15 Reflex when hit & 1d6 piercing damage DC:20 in a grapple.]


*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/22
//:://////////////////////////////////////////////////////////////////////////


#include "prc_alterations"
#include "prc_inc_template"
#include "prc_racial_const"

void main()
{
    object oPC = OBJECT_SELF;
    SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_CONTINUE);	

//:: No pure strain humans, plants, oozes, cyborgs, shapechangers or non-living genotypes
    int nRace = MyPRCGetRacialType(oPC);
    if(nRace == RACIAL_TYPE_CONSTRUCT
	|| nRace == RACIAL_TYPE_PLANT
	|| nRace == RACIAL_TYPE_PSH
	|| nRace == RACIAL_TYPE_SHRUBO
	|| nRace == RACIAL_TYPE_BLOOM
	|| nRace == RACIAL_TYPE_MYCO
	|| nRace == RACIAL_TYPE_CULEN
	|| nRace == RACIAL_TYPE_ENT
	|| nRace == RACIAL_TYPE_CREEP
	|| nRace == RACIAL_TYPE_SMLBOT 
	|| nRace == RACIAL_TYPE_MEDBOT
	|| nRace == RACIAL_TYPE_LRGBOT
	|| nRace == RACIAL_TYPE_DROID
	|| nRace == RACIAL_TYPE_OOZE
	|| nRace == RACIAL_TYPE_SHAPECHANGER
	|| nRace == RACIAL_TYPE_CYBORG
	|| nRace == RACIAL_TYPE_ELEMENTAL 
	|| nRace == RACIAL_TYPE_UNDEAD)	   
    {
        SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
    }   
	
//:: Can't get this mutation twice.
	if(GetHasTemplate(MUT_SPINES, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}