//::///////////////////////////////////////////////////////////////////////////
//:: Name           Immunity: Cold template maintain script
//:: FileName       mut_m_im_cold.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Immunity: Cold (Physical / Plant)
The mutant is immune to a particular form of damage or hazard.

[Immune to cold damage]

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
	
//:: Immunity to Cold
    ipIP = ItemPropertyDamageImmunity(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGEIMMUNITY_100_PERCENT);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);

//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_IMMUNITY_COLD);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);	

}