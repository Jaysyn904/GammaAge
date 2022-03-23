//::////////////////////////////////////////////////////////////////////////////
//:: Name		Sonic Blast template test script
//:: FileName	mut_t_sonblast.nss
//:: Copyright	(c) 2022 NWNDS
//::////////////////////////////////////////////////////////////////////////////
/*
Sonic Blast (Physical / Plant)
The character is able to project a beam of focused sub-sonic sound, as a ranged touch attack. It does 2d6 + MPS modifier of sonic
damage. Maximum range is 20 feet plus 5’ per MPS mod. Fragile or brittle objects, such as glass, which fall within the area of effect,
are likely to break or shatter. (Subject to GM decision.) The mutant can use this attack a number of times a day equal to 5 + MPS
modifier. The character takes half damage from sonic and concussion attacks


[Resist 50% Concussion (sonic) damage, 2d6 + STR Bonus concussion damage in a 20' + STR Bonus range cone, usable 5 + CON Bonus / day]



*/
//::////////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/22
//::////////////////////////////////////////////////////////////////////////////


#include "prc_alterations"
#include "prc_inc_template"
#include "prc_racial_const"

void main()
{
    object oPC = OBJECT_SELF;
    SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_CONTINUE);	

//:: Any living genotype except pure strain humans, oozes, cyborgs & shapechangers
    int nRace = MyPRCGetRacialType(oPC);
    if(nRace == RACIAL_TYPE_CONSTRUCT
	|| nRace == RACIAL_TYPE_SMLBOT 
	|| nRace == RACIAL_TYPE_MEDBOT
	|| nRace == RACIAL_TYPE_LRGBOT
	|| nRace == RACIAL_TYPE_DROID
	|| nRace == RACIAL_TYPE_OOZE
	|| nRace == RACIAL_TYPE_PSH
	|| nRace == RACIAL_TYPE_SHAPECHANGER
	|| nRace == RACIAL_TYPE_CYBORG
	|| nRace == RACIAL_TYPE_ELEMENTAL 
	|| nRace == RACIAL_TYPE_UNDEAD)	   
    {
        SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
    }    
	
//:: Can't get this mutation twice.
	if(GetHasTemplate(MUT_SONIC_BLAST, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}