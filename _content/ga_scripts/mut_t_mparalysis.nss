//::///////////////////////////////////////////////////////////////////////////
//:: Name		Mental Paralysis test script
//:: FileName	mut_t_mparalysis.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Mental Paralysis (Mental)
The character is able to isolate the victim's mind from the voluntary motor centres of his brain. The target must be within a range of 25
feet plus 5’ per MPS mod, and fail a Health save. The victim falls prone. He can still breathe, his heart beats, his eyes blink, etc; but he
cannot move his limbs, speak, or control any other muscles. The victim can still use mental powers and sense the world around him
normally, but his direction of vision will be limited. The effect lasts for 1d6 rounds + 1 round per MPS mod. The power can be used a
number of times a day equal to 3 plus the MPS mod.

[Hold Monster, 5 + 1 / WIS Bonus, DC = 10 + 1/2 HD + WIS Bonus]


*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/21
//:://////////////////////////////////////////////////////////////////////////


#include "prc_alterations"
#include "prc_inc_template"
#include "prc_racial_const"

void main()
{
    object oPC = OBJECT_SELF;
    SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_CONTINUE);	

//:: Any living genotype except oozes, cyborgs & shapechangers
    int nRace = MyPRCGetRacialType(oPC);
	
    if(nRace == RACIAL_TYPE_CONSTRUCT
	|| nRace == RACIAL_TYPE_SMLBOT 
	|| nRace == RACIAL_TYPE_MEDBOT
	|| nRace == RACIAL_TYPE_LRGBOT
	|| nRace == RACIAL_TYPE_DROID
	|| nRace == RACIAL_TYPE_OOZE
	|| nRace == RACIAL_TYPE_SHAPECHANGER
	|| nRace == RACIAL_TYPE_CYBORG
	|| nRace == RACIAL_TYPE_ELEMENTAL 
	|| nRace == RACIAL_TYPE_UNDEAD)	   
    {
        SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
    }    
	
//:: Can't get this mutation twice.
	if(GetHasTemplate(MUT_MENTAL_PARALYSIS, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}