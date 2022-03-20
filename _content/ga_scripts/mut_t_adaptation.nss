//::///////////////////////////////////////////////////////////////////////////
//:: Name           Adaptation template test script
//:: FileName       tmp_t_adaptation.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Adaptation (Plant)
The plant can adapt (become immune) to a particular attack form that has harmed 
it. On the round it is attacked, it must decide whether or not to begin the 
process of adaptation. It can drop a previous immunity to adapt to a new attack.
The plant can have a total of two adapted immunities at any given time. It takes 
five days for the plant to complete the adaptation process. There are no 
restrictions to its activities during this time. For example, if it adapts to 
fire attacks, it grows a flame resistant bark. If it adapts to bludgeoning 
attacks, its surface becomes flexible and pliant. For the purposes of this 
mutation, physical attacks are divided into slashing, piercing and bludgeoning 
attacks; energy attacks into acid, cold, electricity, fire/heat, 
sonic/concussion and radiation - adaptation must be made to each individually. 
Gunshots are considered to be piercing attacks

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
	if(GetHasTemplate(MUT_ADAPATATION, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}