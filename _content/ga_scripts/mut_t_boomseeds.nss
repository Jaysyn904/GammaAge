//::///////////////////////////////////////////////////////////////////////////
//:: Name           Explosive Seeds template test script
//:: FileName       mut_t_boomseeds.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Explosive Seeds (Plant)
These nut-like seeds explode if they are thrown against a hard surface (medium 
ranged touch attack, or if placed and struck by a weapon or take fire damage. 
The seed does 2d6 + CON modifier points of concussion damage in a 10’ radius 
and half that to any adjacent square.

Max Seeds: 5 + CON modifier

New seeds / day: 1d4


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
	if(GetHasTemplate(MUT_EXPLOSIVE_SEEDS, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}