//::///////////////////////////////////////////////////////////////////////////
//:: Name		Quills template test script
//:: FileName	mut_t_quills.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Quills (Physical)
The mutant can fire 1d4 quills as a ranged attack using the small, pressurized air sacs at the base of each. Each quill does 1d4
damage (if small or medium sized) and has a range increment of 10 feet. (1d6 damage if large.) Multiple opponents can be targeted,
but they must all be within 15’ of each other. The mutant can only fire a volley of quills every three rounds.


[Quillfire, but a ranged touch, every 3 rounds]

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
	if(GetHasTemplate(MUT_QUILLS, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}