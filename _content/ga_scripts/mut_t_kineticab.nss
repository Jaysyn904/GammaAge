//::///////////////////////////////////////////////////////////////////////////
//:: Name		Kinetic Absorption template test script
//:: FileName	mut_t_kineticab.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Kinetic Absorption (Physical / Plant)
The mutant generates a field that absorbs kinetic energy. Anything that is moving in the field loses some velocity. Objects fall slower,
although the character himself does not. The mutant is considered to have DR 5 + MPS mod vs bludgeoning weapons and DR 2 +
MPS mod vs slashing & piercing attacks. The character can maintain the field for 5 rounds, plus one round per MPS modifier. After that
time, he must wait an hour before activating it again.

[DR 5 + CON Bonus vs Blunt, DR 2 + CON Bonus vs slash & pierce.  5 + WIS Bonus rounds per activation]


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
	if(GetHasTemplate(MUT_KINETIC_ABSORPTION, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}