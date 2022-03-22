//::///////////////////////////////////////////////////////////////////////////
//:: Name		Cryokinesis template test script
//:: FileName	mut_t_cryo.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Cryokensis (Mental)
The mutant has the ability to greatly & rapidly reduce the ambient temperature in an area. 



The long range power affects either an area with a 5’ radius, or a single small or medium sized target. If the target is a creature (or a held object) the mutant requires a successful mental touch attack. To activate the power is full-round action, and maintaining it is a standard action. Initially, the mutant heats (or cools) an area, causing 1d6 points of damage to anything within the target area. On each successive round pyrokinesis or cryokinesis causes an additional 1d6 of damage, up to a maximum of 6d6 damage. The mutant can maintain the power for a maximum of 3 + MPS modifier rounds. After that he cannot use it again for three hours. If he stops during the build-up of power, he cannot resume or reactivate the power. Mutants with pyro/cryokinesis take half damage from heat/cold damage (respectively).  Once damage reaches 3d6, flammable materials will catch fire (pyrokinesis), or water will freeze (cyrokinesis). If pyro/cryokinesis is applied to an object, a creature continuing to hold the object will take damage as it heats or cools.



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
	if(GetHasTemplate(MUT_CRYOKINESIS, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}