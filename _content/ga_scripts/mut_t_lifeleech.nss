//::///////////////////////////////////////////////////////////////////////////
//:: Name		Life-leech template test script
//:: FileName	mut_t_lifeleech.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Life-leech (Mental)
The mutant is able to drain the life force out of any living creature, except normal plants. The character drains 5+ MPS modifier hit
points from all targets within 30 feet each round. As a swift action, the mutant can make a DC20 Concentration check to alter the radius
of the effect to be anything between 10 and 30 feet. Once activated, it can be kept active as a move action, for a maximum of 5+ MPS
modifier rounds. It requires two hours before it can be activated again. Any hit points drained from nearby creatures are first used to
heal any damage taken, with additional points granting temporary hit points to a maximum of 5 Hp’s per MPS. Temporary HP’s
remaining after one hour are lost.


*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/21
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
	if(GetHasTemplate(MUT_LIFE_LEECH, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}