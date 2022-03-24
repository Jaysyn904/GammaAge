//::///////////////////////////////////////////////////////////////////////////
//:: Name		Chameleon template maintain script
//:: FileName	mut_m_chameleon.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Chameleon (Physical / Plant)
This mutation allows the character to blend into any background. His body 
coloration changes to match the colours of any background that is within three 
feet.  Be aware that his clothes or other belongings do not change colour. His 
skin (or leaves) continuously change as the mutant moves. The mutant can decide 
to make his skin any single colour not related to his background, or can choose 
to look like his normal self. Chameleon power grants a bonus to all Stealth 
skill checks equal to 5 + DEX modifier.

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
	int nDex = GetAbilityModifier(1, oPC);
	int nHide = 5 + nDex;
	int nBonus;
	itemproperty ipIP;
	
//:: Add Hide bonus
    SetCompositeBonus(oSkin, "ChameleonHide", nHide, ITEM_PROPERTY_SKILL_BONUS, SKILL_HIDE);

//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_CHAMELEON);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
}