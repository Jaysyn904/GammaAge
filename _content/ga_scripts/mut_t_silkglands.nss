//::///////////////////////////////////////////////////////////////////////////
//:: Name		Silk Glands template test script
//:: FileName	mut_t_silkglands.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Silk Glands (Physical)
This mutation causes the mutant to generate a substance similar to spider silk within their body, which can be spun - creating durable
strands that can be shaped at will. The mutant produces thin and silvery yet extremely strong filaments. The character becomes
capable of spinning two types of silk - sticky and non-sticky strands.
The former is used to spin webs that can catch and trap unwary enemies, and the latter is particularly useful for descending great
distances, constructing barriers, or simply spinning out extremely lightweight and durable rope. In both cases, the strands have 14 hit
points and a break DC of 30


[Web (3+ HD / 5 uses per day) / Immunity to Web / Silk Creation]


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
	if(GetHasTemplate(MUT_SILK_GLANDS, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}