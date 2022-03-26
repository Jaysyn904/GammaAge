//::///////////////////////////////////////////////////////////////////////////
//:: Name		Skeletal Enhancement template maintain script
//:: FileName	mut_m_skelenhc.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Skeletal Enhancement (Physical)
The mutant's skeleton is far stronger than normal. He takes only half damage from bludgeoning weapons and falling damage


[1/2 damage from falling & blunt damage.]


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
	
//:: 50% Resistant to Bludgeoning
    ipIP = ItemPropertyDamageImmunity(IP_CONST_DAMAGETYPE_BLUDGEONING, IP_CONST_DAMAGEIMMUNITY_50_PERCENT);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);

//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_SKELETAL_ENHANCEMENT);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);	

}