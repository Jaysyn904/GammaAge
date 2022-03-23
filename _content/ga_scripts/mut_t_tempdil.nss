//::///////////////////////////////////////////////////////////////////////////
//:: Name		Temporal Dilation template test script
//:: FileName	mut_t_tempdil.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Temporal Dilation (Mental)
The mutant can “dilute” time around himself, in effect, slowing down the affected individuals relative to those not affected. The mutant
can affect two creatures plus 1 per MPS modifier, each gaining the slowed condition. The mutant can maintain the power for 1d6
rounds plus 1 round per MPS modifier point, minimum 1 round. He can activate the power not more than twice in a period of 24 hours
and affected targets must be within 30 feet.

[Mass Slow, 2 + 1 creature per WIS Bonus, lasts 6 + WIS Bonus rounds, can use twice a day.]

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
	if(GetHasTemplate(MUT_TEMPORAL_DILATION, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}