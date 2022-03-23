//::///////////////////////////////////////////////////////////////////////////
//:: Name		Smoke Cloud template test script
//:: FileName	mut_t_smokecld.nss
//:: Copyright	(c) 2022 NWNDS
//::///////////////////////////////////////////////////////////////////////////
/*
Smoke Cloud  (Physical)
The mutant is able to produce a cloud of black, oily smoke, effectively blinding everyone within. The cloud instantly engulfs everything
around the mutant within a radius of 15 feet + 5’ per MPS modifier, and remains in effect for 2 rounds + 1 round per MPS mod, after
which it disappears almost instantly. The cloud blocks light in its confines, granting the mutant (and everyone else in the cloud) total
concealment. The mutant cannot see in her own ink cloud, but she is immune to attacks of opportunity made within the cloud except
from opponents who can somehow see within the cloud or can use a sense other than sight for targeting. The power requires an hour
before it can be used again.


[15' + CON Bonus *5 radius oily smoke blinds & grants total concealment.  Mutant gets Spring Attack while in cloud.]



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
	if(GetHasTemplate(MUT_SMOKE_CLOUD, oPC)) 
	{
		SetExecutedScriptReturnValue(X2_EXECUTE_SCRIPT_END);
	}

}