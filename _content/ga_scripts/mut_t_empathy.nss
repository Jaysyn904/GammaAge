//::///////////////////////////////////////////////////////////////////////////
//:: Name           Empathy test script
//:: FileName       mut_t_empathy.nss
//:: Copyright (c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Empathy (Mental)
The mutant is able to read the feelings and emotions of other living creatures within 50 feet plus 5’ per MPS mod. This grants a bonus
on checks involving interaction skills (Bluff, Diplomacy, Handle Animal, Identify Power, Intimidate, Perform, and Sense Motive) equal to
2 plus the MPS modifier. If the mutant wishes, he can try to implant an emotion within a target creature that fails a Mental Defence
check. Options are: Fear, anger, sadness, joy, disgust, trust, anticipation or surprise. The GM decides how the creature reacts. (Note: a

(Adds 2 + 1/2 CHA bonus to all CHA skills, Implant Emotion @ will)


*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/20
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
	if(GetHasTemplate(MUT_EMPATHY, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}