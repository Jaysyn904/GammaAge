//::///////////////////////////////////////////////////////////////////////////
//:: Name           Force Barrier template test script
//:: FileName       mut_t_forcebarr.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Force Barrier (Mental)
The mutant is able to create an invisible wall (force field) at a distance of up to 25 feet away, plus 5 feet per MPS modifier point. The
maximum size (height and length) of the barrier is 100 cubic feet plus 50 cubic feet per MPS mod. The barrier is not more than 6” thick,
but has a Hardness and Energy Resistance of 10. It has a maximum of 50 HP’s plus 5 HP’s per MPS mod, and cannot be penetrated
until destroyed or cancelled. If the mutant cancels the barrier (or if destroyed), it regains 10 HP’s per hour, until reactivated. It cannot be
reactivated with less than 10 hp

[Wall of Force (3 + WIS Bonus / 2 uses per day)]

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

//:: Any living genotype except oozes, cyborgs & shapechangers
    int nRace = MyPRCGetRacialType(oPC);
	
    if(nRace == RACIAL_TYPE_CONSTRUCT
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
	if(GetHasTemplate(MUT_FORCE_BARRIER, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}