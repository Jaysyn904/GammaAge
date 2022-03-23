//::///////////////////////////////////////////////////////////////////////////
//:: Name		Thorns template test script
//:: FileName	mut_t_thorns.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Thorns (Plant)
The plant's body is covered with sharp thorns or spines. Any creature grappling or striking the plant with an unarmed or natural attack
takes 1d6 + MPS mod in piercing damage each round. The thorns cannot damage hard materials such as stone or metal. The plant
can strike with a vine, branch, or limb as a natural attack that causes 1d6 damage plus MPS modifier. (If it already has a natural attack,
the thorns add 1 + MPS modifier to the damage that attack causes.) Damage stated is for a medium size plant. (1d4 if small, 1d8 if
large.)

[As Razor-Edged Leaves  but piercing damage & no grapple benefit]

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
	if(GetHasTemplate(MUT_THORNS, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}