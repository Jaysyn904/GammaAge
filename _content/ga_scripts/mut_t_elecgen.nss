//::////////////////////////////////////////////////////////////////////////////
//:: Name           Electrical Generation template test script
//:: FileName       mut_t_elecgen.nss
//:: Copyright (c) 2022 NWNDS
//::////////////////////////////////////////////////////////////////////////////
/*
Electrical Generation (Physical / Plant)
The mutant is able to build up an electrical charge in his body. He is able to choose when to release the charge, causing electrical
damage to whatever is touched. In essence, the mutant is constantly charging an internal battery, accumulating 1d6 of electrical
potential every minute, to a maximum of 3d6. The mutant can choose to discharge one, two, or three dice (as long as he has that much
stored), by making a touch-attack on an opponent, adding his MPS modifier to the total damage. He can add this damage to a normal
melee attack if he is wielding a (mostly) metal weapon, as a swift action. Use of the power does not draw an attack of opportunity. The
mutant is immune to electrical damage, and each 5 points of damage that would have been taken restore 1d6 of charge.

(Immunity to Electricity, +1d6 Electrical w/ metal weapon or Natural Attack, 3d6+CON 
Electrical Bolt or Touch / 3 Turns)

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
	if(GetHasTemplate(MUT_ELECTRICAL_GENERATION, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}