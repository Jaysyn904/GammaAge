//::///////////////////////////////////////////////////////////////////////////
//:: Name           Force Field Generation template test script
//:: FileName       mut_t_forcefield.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Force Field Generation(Mental)
The mutant is able to create an invisible barrier of force around him that protects from physical damage. The force field forms a smooth
surface about one foot from the mutant's skin. The character cannot make physical attacks while the force field is up, but can use
mental powers. The force field grants the mutant both Damage Reduction and Energy Resistance of 5 points + 1 per MPS modifier. It
can be kept active until it has absorbed a total of 25 hit points of damage +5 points per MPS modifier. After that, the character must
drop the force field for an hour before using it again. If the field takes enough points of physical damage to destroy it, the character
must make a DC10 Health check or fall unconscious for 1d6 rounds.

[DR 25 + WIS Bonus  /2 * 5 & Energy Resistance 5 + WIS Bonus usable once per hour.  Can't attack physically while in use.]

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
	if(GetHasTemplate(MUT_FORCE_FIELD_GENERATION, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}