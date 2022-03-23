//::///////////////////////////////////////////////////////////////////////////
//:: Name		Probability Shift template test script
//:: FileName	mut_t_probshift.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Probability Shift  (Mental)
The mutant is able to adjust the laws of probability. The mutant gains a pool of 5 points + 1 per MPS modifier that can be used to add
to any ability or skill checks, saving throw, or attack roll that he makes each day. The power is activated as a swift action, and must be
declared before the die roll is made. He cannot add more than 2 points to any roll.

Swift action to add +2 to all rolls for 3 + WIS Bonus rounds, 1 + WIS Bonus uses / day


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
	if(GetHasTemplate(MUT_PROBABILITY_SHIFT, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}