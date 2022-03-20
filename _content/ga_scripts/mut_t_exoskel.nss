//::////////////////////////////////////////////////////////////////////////////
//:: Name           Exoskeleton template test script
//:: FileName       mut_t_exoskel.nss
//:: Copyright (c) 2022 NWNDS
//::////////////////////////////////////////////////////////////////////////////
/*
Exoskeleton (Physical / Plant)
An exoskeleton is a rigid outer layer that protects and supports the mutant. It 
may be composed of bone, cartilage, chitin, calcium or silica. The structure 
protects the mutant's body like armour and usually covers the head and back, 
but can cover the entire body of the mutant. It provides a Natural Armour bonus 
equal to 2 points + CON modifier. This bonus stacks with other natural armour 
bonuses.  Plants generally have thick, tough bark instead of an actual 
exoskeleton.

[Natural AC equals 2 + 1/2 CON bonus.  Can't wear armor, clothing is fine.]

*/
//::////////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/20
//::////////////////////////////////////////////////////////////////////////////


#include "prc_alterations"
#include "prc_inc_template"
#include "prc_racial_const"

void main()
{
    object oPC = OBJECT_SELF;
    SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_CONTINUE);	

//:: Any living genotype except pure strain humans, oozes, cyborgs & shapechangers
    int nRace = MyPRCGetRacialType(oPC);
    if(nRace == RACIAL_TYPE_CONSTRUCT
	|| nRace == RACIAL_TYPE_SMLBOT 
	|| nRace == RACIAL_TYPE_MEDBOT
	|| nRace == RACIAL_TYPE_LRGBOT
	|| nRace == RACIAL_TYPE_DROID
	|| nRace == RACIAL_TYPE_OOZE
	|| nRace == RACIAL_TYPE_PSH
	|| nRace == RACIAL_TYPE_SHAPECHANGER
	|| nRace == RACIAL_TYPE_CYBORG
	|| nRace == RACIAL_TYPE_ELEMENTAL 
	|| nRace == RACIAL_TYPE_UNDEAD)	   
    {
        SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
    }    
	
//:: Can't get this mutation twice.
	if(GetHasTemplate(MUT_EXOSKELETON, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}