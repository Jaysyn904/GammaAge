//::///////////////////////////////////////////////////////////////////////////
//:: Name		Adherence template maintain script
//:: FileName	mut_m_adherence.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Adherence (Physical)
Fine hooks or hairs on the mutant’s hands and feet allows him to climb easily 
or even cling to the ceiling. The character must have hands and feet uncovered 
to use this ability, and must be carrying no more than a medium load.  The 
mutant gains a +8 to Climb checks and +4 to grapple checks.

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
	
//:: Add Climb bonus
    SetCompositeBonus(oSkin, "AdherenceClimb", 8, ITEM_PROPERTY_SKILL_BONUS, SKILL_CLIMB);

//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_ADHERENCE);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
}