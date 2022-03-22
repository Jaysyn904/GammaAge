//::///////////////////////////////////////////////////////////////////////////
//:: Name           Metamorphosis template test script
//:: FileName       mut_t_metamorph.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Metamorphosis (Physical)
The character can transform his body into a duplicate of any creature he touches. Against an unwilling target he must make a
successful touch attack to begin the transformation, which takes 1d6 rounds. The mutant transforms into an exact duplicate of the
creature touched and gains the size and physical attributes (Strength, Dexterity and Constitution) of the target, in place of his own. If
the form has any of the following abilities, he gains those abilities: climb, fly, swim, natural attack, darkvision, low-light vision, and/or
natural armour. The mutant does not get any other special abilities of the creature he copies. For example, he can duplicate quills, but
is not able to fire them. He can fly, but not do fancy aerial manoeuvres. The character retains his mental attributes, base saving throws,
base attack and skill bonuses, as well as physical and mental mutations not affected by the change. He does not copy any clothes,
armour or possessions. The transformation lasts up to 10 minutes plus 2 minutes per MPS modifier. Metamorphosis cannot be
activated more than once every two hours.

[Shifting via touch attack.  1d6 round delay, 10 + 2 / WIS Bonus minute duration, Can only be activated once every two hours]


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

//:: No pure strain humans, plants, oozes, cyborgs, shapechangers or non-living genotypes
    int nRace = MyPRCGetRacialType(oPC);
    if(nRace == RACIAL_TYPE_CONSTRUCT
	|| nRace == RACIAL_TYPE_PLANT
	|| nRace == RACIAL_TYPE_PSH
	|| nRace == RACIAL_TYPE_SHRUBO
	|| nRace == RACIAL_TYPE_BLOOM
	|| nRace == RACIAL_TYPE_MYCO
	|| nRace == RACIAL_TYPE_CULEN
	|| nRace == RACIAL_TYPE_ENT
	|| nRace == RACIAL_TYPE_CREEP
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
	if(GetHasTemplate(MUT_METAMORPHOSIS, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}