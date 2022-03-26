//::///////////////////////////////////////////////////////////////////////////
//:: Name		Low-light Vision template maintain script
//:: FileName	mut_m_lowlight.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Low-light Vision (Physical)
Characters with low-light vision have eyes that are so sensitive to light that they can see twice as far as normal in dim light. Low-light
vision is color vision. Characters with low-light vision can see outdoors on a moonlit night as well as they can during the day. The
character's normal daylight light vision is unaffected

[Low-Light Vision]

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
	
//:: Low Light Vision
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_LOWLIGHT_VISION);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
	
//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_LOW_LIGHT_VISION);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);

}