//::///////////////////////////////////////////////
//:: Teiwaz's Easy Death On Death Script
//:: tz_ed_ondeath.nss
//:://////////////////////////////////////////////
/*
This is a version of the script meant for use in other mods.
Based on the death system used in the "Parthenon" multiplayer
campaign. Works as follows:

- When a player is reduced to 0 HP or below, they fall
  unconscious, and are unable to act.
- They will stay in this state until they are revived
  by being healed to 1 HP or above.
- If the entire party dies, only then will the death GUI
  popup, or, if there's a DM in the game, they will be
  notified of the party's death, instead.

The script are meant to keep the game running quickly and
smoothly, making it possible for the party to continue
adventuring rather than waiting for someone to respawn and
walk back to the party.

To use the script, simply place it in the OnPlayerDeath event
in module properties, or call it from another module death event
using the ExecuteScript() function.


*/
//:://////////////////////////////////////////////
//:: Created By: Teiwaz
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////


// Returns TRUE if all the PCs in the game are dead.
int AllPCsDead()
{
int bAllDead = TRUE;
object oCurrentPC = GetFirstPC();
while(GetIsObjectValid(oCurrentPC) && bAllDead)
    {
    if(GetCurrentHitPoints(oCurrentPC) > 0 && !GetIsDM(oCurrentPC))
        {
        bAllDead = FALSE;
        }
    oCurrentPC = GetNextPC();
    }
return bAllDead;
}

// Returns TRUE if there is a DM in the game.
int DMInGame()
{
int bDMInGame = FALSE;
object oCurrentPC = GetFirstPC();
while(GetIsObjectValid(oCurrentPC) && !bDMInGame)
    {
    if(GetIsDM(oCurrentPC))
        {
        bDMInGame = TRUE;
        }
    oCurrentPC = GetNextPC();
    }
return bDMInGame;
}

// Displays death messages to all the PCs when the entire party
// dies, or notifies the DM if one is present.
void DisplayDeathMessages()
{
string ENTIRE_PARTY_DEAD_MESSAGE = "The entire party has been killed.";
object oCurrentPlayer = GetFirstPC();
if(DMInGame())
    {
    SendMessageToAllDMs(ENTIRE_PARTY_DEAD_MESSAGE);
    }
    else
    {
    while(GetIsObjectValid(oCurrentPlayer))
        {
        if(!GetIsDM(oCurrentPlayer))
            {
            PopUpDeathGUIPanel(oCurrentPlayer, FALSE, TRUE, 0, ENTIRE_PARTY_DEAD_MESSAGE);
            }
        oCurrentPlayer = GetNextPC();
        }
    }
}

// Recursive death function. Keeps raising PCs as they die,
// but keeps them unconscious.
void DeathLoop(object oPC)
{
if(GetCurrentHitPoints(oPC) < -9)
    {
    SetLocalInt(oPC, "bJustRevived", TRUE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPC);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(GetCurrentHitPoints(oPC) + 9,DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_PLUS_FIVE), oPC);
    DelayCommand(0.3,SetLocalInt(oPC, "bJustRevived", FALSE));
    DelayCommand(6.0,DeathLoop(oPC));
    }
    else if(GetCurrentHitPoints(oPC) < 1)
    {
    DelayCommand(6.0,DeathLoop(oPC));
    }
}

void main()
{
// Message displayed to PCs when they go below
// 0 HP for the first time.
string DISABLED_MESSAGE = "You have been disabled! Someone will have to revive you.";
// Get the last dying player
object oDyingPlayer = GetLastPlayerDied();
AssignCommand(oDyingPlayer, ClearAllActions());
// If they weren't just upgraded to unconscious from dead,
// notify them that they are disabled.
if(!GetLocalInt(oDyingPlayer, "bJustRevived"))
    {
    SendMessageToPC(oDyingPlayer, DISABLED_MESSAGE);
    FloatingTextStringOnCreature("Disabled!", oDyingPlayer, FALSE);
    // If the entire party is dead, display the death messages
    if(AllPCsDead())
        {
        DisplayDeathMessages();
        }
    }
// Enter the recursive death loop
DeathLoop(oDyingPlayer);


}
