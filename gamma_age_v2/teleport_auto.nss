// DMFI MP Starter Mod
// teleport_auto

/*This is a simple script that can handle all of your
transitions from placeable objects. For example, ladders,
pull chains, etc.. Simply make the object usable, activate
"locked" and put the tag of the waypoint you want to jump
to in the key tag field.*/



/////////////////////////////////////////////////
//  Ultimate Teleport Script 1.0
/////////////////////////////////////////////////
//  by Amurayi (mschdesign@hotmail.com)
//
//  based on SirLestat's Secret Trapdoorscripts
/////////////////////////////////////////////////
/* The problem with most of the teleport scripts out there is that your companions
won't be teleported with you if you ar ebeing teleported within the same area.
This easy to configure script here is the solution for this old problem. Simply
alter the way how the teleport shall work by turning the options on and off be
setting the variables to 0 or 1 in the first ppart of this script.

What this script can do:
- teleports player out of conversation, trigger or item
- teleports player with or without companions
- teleports player alone or the whole party (players)
*/
void JumpAssociate(object i_oPC, int i_type, location l_iTrans)
{
    object oAssociate = GetAssociate(i_type, i_oPC);
    if(GetIsObjectValid(oAssociate))
        AssignCommand(oAssociate, JumpToLocation(l_iTrans));
}

void main()
{
    // uncomment one of the next 3 lines depending where you use the script:
    // object oPC = GetPCSpeaker();     // for conversations
    // object oPC = GetEnteringObject;  // for triggers
    object oPC = GetLastUsedBy();       // for items/objects

    // set to 1 if you want the Associates of the player to be teleported as well, otherwise to 0:
    int iTeleportAssociateToo = 1;
    // Location determined by waypoint tag in lock field of object
    location lTrans = GetLocation(GetObjectByTag(GetLockKeyTag(OBJECT_SELF)));
    // Make the player say something on his departure (so others will now that he teleported but crashed):
    string sGoodbye = "*fades out*";
    // Enter the message being send to the player when teleport starts:
    string sTeleportmessage = "Your surroundings begin to fade...";


    // Don't start Teleport at all if activator isn't a player or DM
    if(!GetIsPC(oPC))
        return;

    else
       {
        // Uncomment the next 2 lines if you like fancy animations (plays the summon monster 3 animation)
        // effect eVis = EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3);
        // ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oFM);
        //AssignCommand(oPC, ActionSpeakString(sGoodbye));
        //SendMessageToPC(oPC, sTeleportmessage);
        AssignCommand(oPC, DelayCommand(2.0, JumpToLocation(lTrans)));
        if (iTeleportAssociateToo == 1)
            {
            // now send the players companions over as well:
            DelayCommand(2.0, JumpAssociate(oPC, ASSOCIATE_TYPE_ANIMALCOMPANION, lTrans));
            DelayCommand(2.0, JumpAssociate(oPC, ASSOCIATE_TYPE_DOMINATED, lTrans));
            DelayCommand(2.0, JumpAssociate(oPC, ASSOCIATE_TYPE_FAMILIAR, lTrans));
            DelayCommand(2.0, JumpAssociate(oPC, ASSOCIATE_TYPE_HENCHMAN, lTrans));
            DelayCommand(2.0, JumpAssociate(oPC, ASSOCIATE_TYPE_SUMMONED, lTrans));
            }
        }
}
