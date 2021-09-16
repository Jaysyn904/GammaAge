//::///////////////////////////////////////////////
//:: [Ressurection]
//:: [NW_S0_Ressurec.nss]
//:: Copyright (c) 2000 Bioware Corp.
//:://////////////////////////////////////////////
//:: Brings a character back to life with full
//:: health.
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 31, 2001
//:://////////////////////////////////////////////
//:: Last Updated By: Preston Watamaniuk, On: April 11, 2001
//:: VFX Pass By: Preston W, On: June 22, 2001

// DEATH CODE START
#include "habd_include"
// DEATH CODE END

void main()
{
    //Get the spell target
    object oTarget = GetSpellTargetObject();
    //Check to make sure the target is dead first
    //Fire cast spell at event for the specified target
    SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_RESURRECTION, FALSE));
    if (GetIsDead(oTarget))
    {
        //Declare major variables
        int nHealed = GetMaxHitPoints(oTarget);
        effect eRaise = EffectResurrection();
        effect eHeal = EffectHeal(nHealed + 10);
        effect eVis = EffectVisualEffect(VFX_IMP_RAISE_DEAD);
        //Apply the heal, raise dead and VFX impact effect
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eRaise, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oTarget));
        // HABD CODE START
        HABDApplyPenaltyIfDead(oTarget, SPELL_RESURRECTION);
        // HABD CODE END
    }
    // HABD CODE START
    HABDCureRespawnGhost(oTarget, SPELL_RESURRECTION);
    // HABD CODE END
}
