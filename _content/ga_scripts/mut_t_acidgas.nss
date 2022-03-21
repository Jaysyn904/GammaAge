//::////////////////////////////////////////////////////////////////////////////
//:: Name           Gas Generation, Caustic template test script
//:: FileName       mut_t_acidgas.nss
//:: Copyright (c) 2022 NWNDS
//::////////////////////////////////////////////////////////////////////////////
/*
Gas Generation, Caustic (Physical / Plant)
The character has the ability to produce a visible gas from a specific place on his body (hands, mouth, nose, etc.) chosen by the player,
in a cone up to 25 feet + 5’/ CON mod. Any creature within the area of effect must make a Health save (DC equals 10 + MPS mod + ½
char level) or suffer the effects of the gas. Effects last for 1d6 rounds + 1 round per MPS modifier. After release it takes the mutant an
hour to build up a new supply. Roll 1d6 and consult the table below to determine the gas effects. The mutant is immune to his or her
own gas.

[2d6 + CON Bonus Acid Damage, 15' Cone, Reflex save for 1/2 Damage,  DC = 10 + 1/2 HD + CON Bonus]

*/
//::////////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/21
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
	if(GetHasTemplate(MUT_GAS_GENERATION_CAUSTIC, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}