//::///////////////////////////////////////////////////////////////////////////
//:: Name           Immunity: Ability Drain template test script
//:: FileName       mut_t_im_drain.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Immunity: Ability Drain (Physical / Plant)
The mutant is immune to a particular form of damage or hazard.

[Immune to Ability Score damage]

*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/20
//:://////////////////////////////////////////////////////////////////////////


#include "prc_alterations"
#include "prc_inc_template"
#include "prc_racial_const"

void main()
{
    object oPC = OBJECT_SELF;
    SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_CONTINUE);	

//:: No pure strain humans, oozes, cyborgs, shapechangers or non-living genotypes
    int nRace = MyPRCGetRacialType(oPC);
    if(nRace == RACIAL_TYPE_CONSTRUCT
	|| nRace == RACIAL_TYPE_PSH
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
	if(GetHasTemplate(MUT_IMMUNITY_ABILITY_DRAIN, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}