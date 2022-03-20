//::///////////////////////////////////////////////////////////////////////////
//:: Name           Carnivourous Jaws template test script
//:: FileName       mut_t_carnjaws.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Carnivourous Jaws (Plant)
Most plants do not eat. They live off of soil and sunlight. However, a plant 
with this mutation can eat meat or other plants with its jaws.  Its "teeth" are 
actually tightly spaced thorns in its maw. Its stomach is merely a body cavity 
filled with weak acids that digest the meat.  The plant now has a natural bite 
attack that causes 1d6 + Str mod damage, if medium size. The plant is still able
to sustain itself with just soil and sunlight, but it is an uncomfortable 
existence.

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

//:: Plants only
    int nRace = MyPRCGetRacialType(oPC);
	
    if(nRace != RACIAL_TYPE_PLANT
	&& nRace != RACIAL_TYPE_SHRUBO
	&& nRace != RACIAL_TYPE_BLOOM
	&& nRace != RACIAL_TYPE_MYCO
	&& nRace != RACIAL_TYPE_CULEN
	&& nRace != RACIAL_TYPE_ENT
	&& nRace != RACIAL_TYPE_CREEP)		
    {
        SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
    }   	
	
//:: Can't get this mutation twice.
	if(GetHasTemplate(MUT_CARNIVORUS_JAWS, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}