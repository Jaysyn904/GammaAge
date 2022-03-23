//::///////////////////////////////////////////////////////////////////////////
//:: Name		Repulsion template test script
//:: FileName	mut_t_repulsion.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Repulsion  (Mental)
The mutant has the ability to project a beam of force that attempts to repulse all things along a line from the mutant. The line extends
up to 20 feet, plus 5 feet per MPS modifier. All creatures (and unattended objects) not more than one size category larger than the
mutant are subjected to a bull rush. A roll of 1d20 + BA + MS mod + MPS mod (instead of the mutant’s CMB), is compared against the
CMD of each opponent. If the “attack” is successful, a target is pushed back 5 feet. For every 5 by which the attack exceeds the
opponent’s CMD, the target is pushed back an additional 5 feet. Any opponent that strikes a solid object (or is hit by one) takes 1d6
non-lethal damage per 10’ of movement. The power can be used a number of times a day equal to 3 + MPS modifier


[Ranged Bull Rush, see notes]

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
	if(GetHasTemplate(MUT_REPULSION, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}