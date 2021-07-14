//::///////////////////////////////////////////////
//:: gz_chair_use
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: Dom Queron
//:://////////////////////////////////////////////

// This script was explained by David Gaider/Bioware in this topic.
// You should read this topic if you are interested in Nwn scripting
// http://nwn.bioware.com/forums/viewtopic.html?topic=74275&forum=47


void main()
{
    ClearAllActions();
    float fFacing = GetFacing(OBJECT_SELF);
    object oPlayer = GetLastUsedBy();
    object oChair = OBJECT_SELF;
    if (GetIsPC(oPlayer))
    {
        if (GetIsObjectValid(oChair) && !GetIsObjectValid (GetSittingCreature(oChair)))
        {
            AssignCommand(oPlayer, ActionSit(oChair));
            AssignCommand(oPlayer, SetFacing(fFacing));
        }
    }
}
