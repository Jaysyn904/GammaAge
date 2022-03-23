//::///////////////////////////////////////////////////////////////////////////
//:: Name		Poisonous Thorns template test script
//:: FileName	mut_t_pthorns.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Poisonous Thorns (Plant)
The plant's body is covered with small thorns. Anyone making strong contact with the plant (grappling, or a successful attack with a
natural or light weapon) is scratched if they have less than a +5 armour or natural armour bonus. The thorns are coated in a poisonous
dew that is constantly secreted, but dries out quickly, making it impractical to transfer the poison to weapons or to try and store it. The
damage caused is either to Strength, Constitution or Dexterity, determined randomly. Type: injury; Save Health DC10 plus half the
mutant’s level plus MPS modifier. Onset 1 round; Frequency 1/round for 4 rounds; Effect 1d4 damage; Cure 2 consecutive saves.

[OnHit poison from natural attacks & light weapons,  DC = 10 + 1/2 HD + CON Bonus, Damage 1d4 CON, DEX or STR determined randomly]

*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/22
//:://////////////////////////////////////////////////////////////////////////


#include "prc_alterations"
#include "prc_inc_template"

void main()
{
    object oPC = OBJECT_SELF;
    SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_CONTINUE);	

//:: Plants only
    int nRace = MyPRCGetRacialType(oPC);
	
    if(nRace != RACIAL_TYPE_PLANT
	&& nRace != RACIAL_TYPE_SHRUBO
	&& nRace != RACIAL_TYPE_BLOOM
	&& nRace != RACIAL_TYPE_MYCO
	&& nRace != RACIAL_TYPE_CULEN
	&& nRace != RACIAL_TYPE_ENT
	&& nRace != RACIAL_TYPE_CREEP)		
    {
        SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
    }   	
	
//:: Can't get this mutation twice.
	if(GetHasTemplate(MUT_POISONOUS_THORNS, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}