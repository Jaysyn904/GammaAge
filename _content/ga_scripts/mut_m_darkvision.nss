//::////////////////////////////////////////////////////////////////////////////
//:: Name		Darkvision template maintain script
//:: FileName	mut_m_darkvision.nss
//:: Copyright	(c) 2022 NWNDS
//::////////////////////////////////////////////////////////////////////////////
/*
Darkvision (Physical / Plant)
The character has an extraordinary ability to see in darkness without requiring 
a light source, such as at night or underground. Vision is black-and-white only. 
The presence of light does not spoil darkvision. 

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
	
//:: Darkvision
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_DARKVISION);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
	
//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_DARKVISION);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
}