//::///////////////////////////////////////////////////////////////////////////
//:: Name		Invisibility template test script
//:: FileName	mut_t_invis.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Invisibility (Mental)
S
The character can mentally force all living creatures within range (25 feet plus 5’ per MPS mod.) to be unaware of his presence. This
includes friends or foes. When the power is active, any creature within range or that enters range, must make a Will save
against a DC of 10 + 1/2 HD + WIS modifier + ½ character level (round down) or be unable to sense the mutant in any way
(including using mutation powers). Any creature that was aware of the mutant before activation or entering range gets a +4 bonus on
their saving throw. If the mutant makes a successful physical attack on a target, the effect is negated for that creature. It is a standard
action to activate the power, and a swift action to continue it each round. The power can be used a number of times a day equal to 3
plus 1 per WIS mod.

[Sanctuary,  3 + WIS Bonus uses per day, DC = 10 + 1/2 HD + WIS Bonus] TODO figure out a good duration.

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
	if(GetHasTemplate(MUT_INVISIBILITY, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}