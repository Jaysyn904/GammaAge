//::///////////////////////////////////////////////////////////////////////////
//:: Name		Photosynthetic Skin template test script
//:: FileName	mut_t_photoskin.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Photosynthetic Skin (Physical)
The mutant does not need to eat if he spends at least three hours a day in sunlight (six hours in dim light). He can be moving and
taking normal actions during this time. He still needs to drink normal amounts of water. For each hour spent in the sun, he heals 1d6 hit
points of damage.


[Heals 1d6 HP / hour in outside + daytime.  Doesn't need food.]

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
	if(GetHasTemplate(MUT_PHOTOSYNTHETIC_SKIN, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}