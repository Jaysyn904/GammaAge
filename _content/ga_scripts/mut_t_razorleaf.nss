//::///////////////////////////////////////////////////////////////////////////
//:: Name		Razor-Edged Leaves template test script
//:: FileName	mut_t_razorleaf.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Razor-Edged Leaves (Plant)
The plant's surface is covered in dangerous leaves. They look normal and safe, but each has a serrated edge that can cut and tear soft
materials. If the plant has a natural attack, it gains an additional +1d6 slashing damage. Any creature grappling the plant takes 2d6
damage each round from the leaves. Anyone striking the plant with an unarmed or natural attack suffers 1d6 points of damage, unless
they succeed on a DC20 Reflex save.

[As Spines, but slashing damage.]

*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/22
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
	if(GetHasTemplate(MUT_RAZOR_EDGED_LEAVES, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}