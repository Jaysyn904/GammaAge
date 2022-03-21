//::///////////////////////////////////////////////////////////////////////////
//:: Name           Fear Generation template test script
//:: FileName       mut_t_feargen.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Fear Generation (Mental)
The character can instil fear in a living creature within a range of 25 feet plus 5’ per MPS modifier. If the target fails a Mental Defence
save, they become Shaken for 1d6 rounds + 1 round per MPS mod. A target that is already shaken becomes frightened, but the initial
duration does not change. A creature that makes its saving throw cannot be targeted again. This power can be used a number of times
per day equal to 3 plus the MPS mod.

[Fear (single target, 1d6 rounds, 3 + WIS bonus uses per day)]

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
	if(GetHasTemplate(MUT_FEAR_GENERATION, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}