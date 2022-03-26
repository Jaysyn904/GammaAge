//::///////////////////////////////////////////////////////////////////////////
//:: Name		Heightened Vision template maintain script
//:: FileName	mut_m_vision.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Heightened Vision (Physical)
The mutant can see twice the distance compared to most creatures. They gain 
Low-Light vision

[Low-light Vision, Spot +2 & Search +2]


*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/25
//:://////////////////////////////////////////////////////////////////////////


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
	
//:: Add Spot bonus
    SetCompositeBonus(oSkin, "HeightenedVisionSpot", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_SPOT);
	
//:: Add Search bonus
    SetCompositeBonus(oSkin, "HeightenedVisionSearch", 2, ITEM_PROPERTY_SKILL_BONUS, SKILL_SEARCH);
	
//:: Low Light Vision
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_LOWLIGHT_VISION);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
	
//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_HEIGHTENED_VISION);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);	

}