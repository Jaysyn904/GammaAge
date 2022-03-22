//::///////////////////////////////////////////////////////////////////////////
//:: Name		Allurement template test script
//:: FileName	mut_t_allurement.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Allurement (Plant)
The plant constantly gives off a sweet-smelling fragrance that has a seductive, sometimes hypnotic effect. It grants the plant a bonus
on any Charisma-based skills of 3 plus the CHA modifier. Creatures with an Intelligence of 3 or lower that come within 30 feet must
make a Will save. If they fail, they are compelled to touch the plant and be near it. If successful, the creature is always able to identify
the plant as being responsible for the effect and ignore it’s affects. The effects of allurement are broken if the victim suffers damage
from any source while within range. A new save can be made each hour of exposure.

*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/19
//:://////////////////////////////////////////////////////////////////////////


#include "prc_alterations"
#include "prc_inc_template"

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
	if(GetHasTemplate(MUT_ALLUREMENT, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}