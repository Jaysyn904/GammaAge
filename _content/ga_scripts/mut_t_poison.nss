//::////////////////////////////////////////////////////////////////////////////
//:: Name		Poison template test script
//:: FileName	mut_t_poison.nss
//:: Copyright	(c) 2022 NWNDS
//::////////////////////////////////////////////////////////////////////////////
/*
Poison (Physical / Plant)
The mutant can generate a poison that is delivered by a natural attack, such as a bite, claws, horns, spit, sting, etc. The mutant can
store enough poison for three successful attacks. It takes three hours to regenerate one dose. The mutant is immune to his own
poison, and gains a +2 bonus on Health saves vs poison. The damage caused is either to Strength, Constitution or Dexterity,
determined randomly.

Type: Injury; Save: Health DC10 plus half the mutant’s level plus MPS modifier. Onset: 1 round; Frequency: 1/round for 4 rounds;
Effect: 1d4 damage; Cure: 2 consecutive saves.


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
	if(GetHasTemplate(MUT_POISON, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}