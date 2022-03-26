//::////////////////////////////////////////////////////////////////////////////
//:: Name		Energy Absorption: Acid template maintain script
//:: FileName	mut_m_ab_acid.nss
//:: Copyright	(c) 2022 NWNDS
//::////////////////////////////////////////////////////////////////////////////
/*
Energy Absorption: Acid (Physical / Plant)
The character gains Energy Resistance, ignoring the first 10 points + CON 
modifier of damage from a particular type of energy attack.

[Ignores 10 + CON Bonus of caustic damage]

*/
//::////////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/20
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
	
//:: Immunity to Acid
    ipIP = ItemPropertyDamageImmunity(IP_CONST_DAMAGETYPE_ACID, IP_CONST_DAMAGEIMMUNITY_100_PERCENT);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);	
	
//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_ENERGY_ABSOPTION_ACID);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);	
	

}