// DMFI MP Starter Mod
// mod_ctrl_bk_set
// called from the module control settings conversation
// sends a message on the DM channel (to all DMs) with current settings

void main ()
{

// determine current module settings for rest, death, and respawn systems

int restchoice = GetLocalInt(GetModule(), "rest_system");
int deathchoice = GetLocalInt(GetModule(), "death_system");
int rspchoice = GetLocalInt(GetModule(), "respawn_system");

// initialize message variables

string msg1;
string msg2;
string msg3;

// determine current rest system

if (restchoice == 1)
   msg1 = "Time-based rest (time interval between rests)";
if (restchoice == 2)
   msg1 = "Supply-based rest (requires tagged item)";
if (restchoice == 3)
   msg1 = "DMFI resting system";
if (restchoice == 4)
   msg1 = "Unlimited rest (normal NWN:EE system)";
if (restchoice == 5)
   msg1 = "Resting disabled";

// determine current death system

if (deathchoice == 1)
   msg2 = "Parthenon Easy Death System (PCs revivable if party member still alive)";
if (deathchoice == 2)
   msg2 = "HABD death / bleeding system";
if (deathchoice == 3)
   msg2 = "Unlimited respawn (no penalty)";
if (deathchoice == 4)
   msg2 = "Unlimited respawn (with penalty)";

// determine current respawn system

if (rspchoice == 1)
   msg3 = "Respawn location set to current PC location";
if (rspchoice == 2)
   msg3 = "Respawn location set to module starting location";
if (rspchoice == 3)
   msg3 = "Respawn location set to custom waypoint";

// send DM channel messages with settings
SendMessageToAllDMs("CURRENT MOD CONTROL SETTINGS");
SendMessageToAllDMs(msg1);
SendMessageToAllDMs(msg2);
SendMessageToAllDMs(msg3);

}

