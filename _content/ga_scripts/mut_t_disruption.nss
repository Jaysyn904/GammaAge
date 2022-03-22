//::///////////////////////////////////////////////////////////////////////////
//:: Name		Molecular Disruption test script
//:: FileName	mut_t_disruption.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Molecular Disruption (Mental)
The mutant is able to disintegrate nearly any object. Against non-living materials he causes 3d6 + MPS modifier damage per round.
(Refer PF Core, p175.) The power can be used a maximum of 3 rounds plus MPS mod rounds per day. The rounds of usage do not
have to be consecutive. If molecular disruption is used against a living creature, a successful mental touch attack against the target
causes 1d8 + MPS modifier damage. (DR is not effective.)

[Add 1d8 non-typed (magical) damage to natural attacks for 5 + WIS Bonus rounds or 3d6+WIS Bonus Ranged touch attack, 3 + WIS Bonus uses / day]


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
	if(GetHasTemplate(MUT_MOLECULAR_DISRUPTION, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}