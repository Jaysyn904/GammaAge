//::///////////////////////////////////////////////////////////////////////////
//:: Name		Adrenaline Boost maintain script
//:: FileName	mut_m_adrenaline.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Adrenaline Boost (Physical)
The Subject's adrenal gland starts to secrete a far more potent type of 
adrenaline, enabling them to react to threats faster. The mutant gains a +2 bonus
on their initiative checks and a +1 bonus on her Reflex saves

*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/23
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
	
//:: +1 Reflex Save
    ipIP = ItemPropertyBonusSavingThrow(IP_CONST_SAVEBASETYPE_REFLEX, 1);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
	
//:: +2 Initiative via Blooded feat.
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_BLOODED);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
	
//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_ADRENALINE_BOOST);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);	
}