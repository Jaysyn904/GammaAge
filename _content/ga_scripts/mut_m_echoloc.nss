//::////////////////////////////////////////////////////////////////////////////
//:: Name           Echolocation template maintain script
//:: FileName       mut_m_echoloc.nss
//:: Copyright (c) 2022 NWNDS
//::////////////////////////////////////////////////////////////////////////////
/*
Echolocation (Physical / Plant)
The mutant can use echolocation to determine where objects are around him. He 
can emit sound waves and hear the reflected sound, giving him information about 
the position, size, movement and density of objects within 60 feet. He can only 
get a vague sense of shape about them, but it makes invisibility and concealment 
irrelevant. 

*/
//::////////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/23
//::////////////////////////////////////////////////////////////////////////////


#include "prc_alterations"
#include "prc_inc_template"
#include "prc_racial_const"

void main()
{

//:: Declare major variables
	object oPC = OBJECT_SELF;
	object oSkin = GetPCSkin(oPC);
	int iHD = GetHitDice(oPC);
	int nBonus;
	itemproperty ipIP;
	
//:: Blindsight
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_BLINDSIGHT);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
	
//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_ADHERENCE);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);

}