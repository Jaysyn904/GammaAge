//::///////////////////////////////////////////////
//:: Teiwaz's Easy Death On Dying Script
//:: tz_ed_ondying.nss
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

To use the script, simply place it in the OnPlayerDying event
in module properties, or call it from another module dying event
using the ExecuteScript() function.


*/
//:://////////////////////////////////////////////
//:: Created By: Teiwaz
//:: Created On: March 13, 2003
//:://////////////////////////////////////////////


void main()
{
object oDyingPlayer = GetLastPlayerDying();
if(!GetLocalInt(oDyingPlayer, "bJustRevived"))
    {
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectDamage(GetCurrentHitPoints(oDyingPlayer) + 11, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_FIVE), oDyingPlayer);
    }
}
