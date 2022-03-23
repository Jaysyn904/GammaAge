//::///////////////////////////////////////////////////////////////////////////
//:: Name		Radiating Eyes template test script
//:: FileName	mut_t_radeyes.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Radiating Eyes (Physical)
The mutant has the ability to project a beam of radiation through its eyes, up to a range of 25 feet plus 5 feet per MPS modifier. If the
mutant makes a successful ranged touch attack, a target suffers 2d6 radiation damage and must make a Health save or be sickened
for a number of rounds equal to 5 +MPS modifier. The DC is equal to 10 + MPS mod + ½ level. (This damage cannot cause mutations,
and only results in temporary radiation sickness.) The power can be used a number of times a day equal to 2 + MPS modifier. The
mutant gains a +4 bonus to Health saves vs radiation, and their eyes always have a faint glow.


[Medium ranged touch attack, 2d6 Radiation + Sickened DC: 10 + 1/2 HD + CON, 2 + CON Bonus uses / day, +4 Saves vs. Radiation (negative energy)]

*/
//:://////////////////////////////////////////////////////////////////////////
//:: Created By: Jaysyn
//:: Created On: 22/03/22
//:://////////////////////////////////////////////////////////////////////////


#include "prc_alterations"
#include "prc_inc_template"
#include "prc_racial_const"

void main()
{
    object oPC = OBJECT_SELF;
    SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_CONTINUE);	

//:: No pure strain humans, plants, oozes, cyborgs, shapechangers or non-living genotypes
    int nRace = MyPRCGetRacialType(oPC);
    if(nRace == RACIAL_TYPE_CONSTRUCT
	|| nRace == RACIAL_TYPE_PLANT
	|| nRace == RACIAL_TYPE_PSH
	|| nRace == RACIAL_TYPE_SHRUBO
	|| nRace == RACIAL_TYPE_BLOOM
	|| nRace == RACIAL_TYPE_MYCO
	|| nRace == RACIAL_TYPE_CULEN
	|| nRace == RACIAL_TYPE_ENT
	|| nRace == RACIAL_TYPE_CREEP
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
	if(GetHasTemplate(MUT_RADIATING_EYES, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}