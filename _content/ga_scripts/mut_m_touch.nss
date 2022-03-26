//::///////////////////////////////////////////////////////////////////////////
//:: Name		Heightened Touch template maintain script
//:: FileName	mut_m_touch.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Heightened Touch (Physical)
The mutant's sense of touch becomes fine enough to distinguish slight changes 
in texture, moisture, temperature, residues etc

[Blindsight, +3 craft skills]


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
	
//:: Add Craft Armor bonus
    SetCompositeBonus(oSkin, "HeightTouchCraftArmor", 3, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_ARMOR);	
	
//:: Add Craft General bonus
    SetCompositeBonus(oSkin, "HeightTouchCraftGeneral", 3, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_GENERAL);

//:: Add Craft Trap bonus
    SetCompositeBonus(oSkin, "HeightTouchCraftTrap", 3, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_TRAP);
	
//:: Add Craft Weapon bonus
    SetCompositeBonus(oSkin, "HeightTouchCraftWeapon", 3, ITEM_PROPERTY_SKILL_BONUS, SKILL_CRAFT_WEAPON);	
	
//:: Blindsight
    ipIP = PRCItemPropertyBonusFeat(FEAT_BLINDSIGHT_5_FEET);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);
	
//:: Marker Feat
    ipIP = PRCItemPropertyBonusFeat(IP_CONST_FEAT_MUT_HEIGHTENED_TOUCH);
    IPSafeAddItemProperty(oSkin, ipIP, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING, FALSE, FALSE);		
	
}