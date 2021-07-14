// DMFI MP Starter Mod
// Module Control Settings scripts by Carlo
// Used in the mod_ruleset conversation
// Full text copied and then uncommented, to preserve my sanity
// in having to create all the different little convo setting scripts
// also helpful to see the different options all presented together

void main()

{

// ** Rest Systems **

     SetLocalInt(GetModule(), "rest_system", 1); // default - time-based rest
//   SetLocalInt(GetModule(), "rest_system", 2); // supply-based resting
//   SetLocalInt(GetModule(), "rest_system", 3); // DMFI rest system (alpha)
//   SetLocalInt(GetModule(), "rest_system", 4); // standard NWN:EE resting
//   SetLocalInt(GetModule(), "rest_system", 5); // disable resting

// ** Dying/Death/Respawn Systems **

//   SetLocalInt(GetModule(), "death_system", 1); // default - Parthenon Easy Death System (PC can be revived unless entire party killed, no respawn)
//   SetLocalInt(GetModule(), "death_system", 2); // HABD system for bleeding / death (no respawn by default)
//   SetLocalInt(GetModule(), "death_system", 3); // standard NWN:EE death with unlimited respawn
//   SetLocalInt(GetModule(), "death_system", 4); // standard NWN:EE death with respawn penalty

//   SetLocalInt(GetModule(), "respawn_system", 1); // default - respawn location set to current PC location
//   SetLocalInt(GetModule(), "respawn_system", 2); // respawn location set to module starting point
//   SetLocalInt(GetModule(), "respawn_system", 3); // respawn at module waypoint "wp_respawn_loc"

return;

}
