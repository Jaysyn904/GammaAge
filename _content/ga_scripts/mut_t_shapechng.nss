//::////////////////////////////////////////////////////////////////////////////
//:: Name		Shapechange template test script
//:: FileName	mut_t_shapechng.nss
//:: Copyright	(c) 2022 NWNDS
//::////////////////////////////////////////////////////////////////////////////
/*
Shapechange (Physical / Plant)
The mutant is able to assume the form of any living creature (PSH, altered human, new animal or plant) of his size category that he has
seen. If the form has any of the following abilities, you gain that ability: climb, fly, swim, natural attack. The mutant does not get any
special abilities of the creature he imitates. For example, he can duplicate quills, but is not able to fire them. He can fly, but not do fancy
aerial maneuvers. The character retains his attributes, saving throws, attack and skill bonuses, as well as physical and mental
mutations not affected by the change. Clothing or equipment is never affected or duplicated. The change lasts for 20 minutes +5
min/MPS modifier. Afterward the mutant can't shape change for another three hours.


As Metamrophosis but ranged, 20 + WIS Bonus * 5 minutes & can only use every 3 hours.


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
	if(GetHasTemplate(MUT_SHAPECHANGE, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}