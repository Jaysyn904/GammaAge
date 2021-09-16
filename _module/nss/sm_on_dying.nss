// DMFI MP Starter Mod
// sm_on_dying
// used in the Parthenon Easy Death system or bleeding system selections

void main()
{

int deathchoice = GetLocalInt(GetModule(), "death_system");
object oPlayer = GetLastPlayerDying();

if (deathchoice == 1) // Parthenon Easy Death system
    ExecuteScript("tz_ed_ondying", oPlayer);

if (deathchoice == 2) // HABD system
    ExecuteScript("habd_onpcdying", oPlayer);

if (deathchoice == 3 || deathchoice == 4) // NWN:EE standard death system, with or without penalty respawn
    {
    effect eDeath = EffectDeath(FALSE, FALSE);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDeath, oPlayer);
    AssignCommand(oPlayer, ClearAllActions());
    return;
    }

}


