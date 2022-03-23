//::////////////////////////////////////////////////////////////////////////////
//:: Name		Total Healing template test script
//:: FileName	mut_t_totalheal.nss
//:: Copyright	(c) 2022 NWNDS
//::////////////////////////////////////////////////////////////////////////////
/*
Total Healing (Physical / Plant)
The character can heal lost hit points at a rate greater than normal, and even regrow lost or damaged body parts. The character heals
a number of hit points each minute equal to 2 + MPS modifier, minimum 1 point. A lost limb or body part is completely restored within
24 hours. The mutant also gains a +2 enhancement bonus on Health saves vs disease, poison and radiation.


[Regenerate 2 + 1/2 CON Bonus per turn, +2 saves vs disease, poison & radiation.]



*/
//::////////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/22
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
	if(GetHasTemplate(MUT_TOTAL_HEALING, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}