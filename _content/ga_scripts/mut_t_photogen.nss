//::///////////////////////////////////////////////////////////////////////////
//:: Name		Photogenesis template test script
//:: FileName	mut_t_photogen.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Photogenesis (Physical / Plant)
The mutant is able to generate a tremendously bright flash of light from a specific part of his body (hands, eyes, hair, etc.) chosen by
the player. This flash affects every creature (including Live Metal) within 30 feet (60’ in the dark) who fails a Reflex save. (DC = 10 +
MPS mod + ½ level.) If the targets were looking in the direction of the mutant, they are blinded for 1d4+MPS rounds; otherwise (unless
specifically warned about the flash) they are dazzled for 1 round. The mutant cannot be blinded or dazzled by bright light. He can store
enough light for three flashes, but it takes two hours to regenerate a used flash. As an alternative to the sudden light discharge, the
mutant can use up a flash to glow with a light equal to normal daylight for 10 + MPS modifier rounds. The glow this creates illuminates
a 30’ radius area

[Daylight?]


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
	if(GetHasTemplate(MUT_PHOTOGENESIS, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}