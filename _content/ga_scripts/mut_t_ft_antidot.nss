//::///////////////////////////////////////////////////////////////////////////
//:: Name		Fruit, Antidote template test script
//:: FileName	mut_t_ft_biotic.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Fruit, Antidote (Plant)
The plant character grows a fruit (that resembles berries or a chosen type) that has a useful function. The fruit can be any size, from a
strawberry to a melon, and the player can select any colour or texture. Green Folk cannot benefit from eating fruit because of their
unusual digestive systems. The plant can grow 1d3 pieces of fruit overnight, but they must remain on the plant for at least a full day to
develop the relevant property. A plant character can have up to 4 + half character level (round down) pieces of fruit growing at any
particular time. The fruit stays fresh for a month before rotting and falling off. Each fruit must be consumed within an hour of being
picked or it will lose its special properties. Roll 1d8 and reference the table below to determine the fruit’s properties. (All fruit grown by a
particular plant have the same property.)

[Cure & Slow Poison, +1 saves vs poison & disease for 1 hour]

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
	if(GetHasTemplate(MUT_FRUIT_ANTIDOTE, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}