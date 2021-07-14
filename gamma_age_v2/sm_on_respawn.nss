// DMFI MP Starter Mod
// sm_on_respawn
// Modified version of the respawn script from Johan's Simple Balance System

#include "NW_i0_plot"

// Below is the function called by the main script to calculate XP penalty, if applicable

int XPForLevel(int level)
{
    if (level > 0)
        return ((level * (level - 1)) / 2) * 1000;
    else
        return 0;
}

// main script

void main()
{

// Checks which death and respawn options have been selected
// death systems without respawn will not show the Death GUI and therefore not call this script

int deathchoice = GetLocalInt(GetModule(), "death_system"); // Which death system?
int rspchoice = GetLocalInt(GetModule(), "respawn_system"); // Which respawn location system?

object oPlayer = GetLastRespawnButtonPresser();
    if (!GetIsObjectValid(oPlayer))
        return;

    if (deathchoice == 2) // HABD system respawn script called
        ExecuteScript("habd_onpcrespawn", oPlayer);

    effect eRes = EffectResurrection();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eRes, oPlayer);

    effect eHeal = EffectHeal(GetMaxHitPoints(oPlayer));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oPlayer);

    RemoveEffects(oPlayer);

    if (deathchoice == 4) // if standard death system with respawn penalty, apply the penalty
    {
    // Set the level and gold loss penalties for respawn
    int nLevelPenalty = 1; // default is lose one level; edit this number to change (2 = 2 levels, etc.)
    float fGoldLoss = 0.10; // default is 10%; edit this number to change (0.20 = 20%, etc.)

    // Lose level(s)

       int iCurrentXP = GetXP(oPlayer);
       int iExtraXP = iCurrentXP - XPForLevel(GetHitDice(oPlayer));
       int iNewXP = XPForLevel(GetHitDice(oPlayer) - nLevelPenalty) + iExtraXP; // lose
       if (iNewXP < 0)
         iNewXP = 0;
       SetXP(oPlayer, iNewXP);

    // Lose gold

    int nGoldToTake = FloatToInt(fGoldLoss * GetGold(oPlayer)); // default is 10%, edit to 0.2 for 20%, etc.
    AssignCommand(oPlayer, TakeGoldFromCreature(nGoldToTake, oPlayer, TRUE));
    AssignCommand(oPlayer, ClearAllActions());
    }

location lRespawn; // initializes respawn location variable

       if (rspchoice == 1) // set to player's current location
          lRespawn = GetLocation(oPlayer);

       if (rspchoice == 2) // set to module's starting location
          lRespawn = GetStartingLocation();

       if (rspchoice == 3) // set to custom waypoint location
        {
        // Place a waypoint in your module with the tag "wp_respawn_loc"
        // or edit the below waypoint tag to use a different one
          object oRespawn = GetWaypointByTag("wp_respawn_loc");
          lRespawn = GetLocation(oRespawn);
        }

    AssignCommand(oPlayer, ActionJumpToLocation(lRespawn)); // Respawn at location

}
