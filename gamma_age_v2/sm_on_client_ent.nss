// DMFI MP Starter Mod
// sm_on_client_ent
//
// Goes in the module's OnClientEnter event, or copy it into your own OnClientEnter script


// DMFI tool support
#include "dmfi_init_inc"

// HABD support
#include "habd_include"

// Horses support
#include "x3_inc_horse"

void main()
{

// Following is HABD support
HABDGetDBOnClientEnter(GetEnteringObject());

// Uncomment the below if you want to give players the HABD bandages item on entry
// DelayCommand(6.0, HABDItemsOnClientEnter(GetEnteringObject()));

object oPC=GetEnteringObject();

// ** Player Strip Settings **
// To implement equipment stripping of entering PCs, set nStrip to TRUE
// and edit the levels of starting gold and XP as desired

int nStrip = FALSE;
int nStartingGold = 400;
int nStartingXP = 1;

// ** DM on module entry section **

// Checks if entering person is a DM and what DM items are in inventory
// Provides BESIE widget and the DMFI wands exploder if not there

// Note that the DM Book of Journal Entries is not automatically given out
// Uncomment the line below for it, if you want that to occur

int bBESIEWidget;
int bDMFIExploder;
int bDMbook;

if(GetIsDM(oPC))
    {
    SetLocalInt(GetModule(), "re_" + GetPCPlayerName(oPC), TRUE);
    object oItem = GetFirstItemInInventory(oPC);
    while(GetIsObjectValid(oItem))
        {
        if(GetTag(oItem) == "BESIEWidget") bBESIEWidget = TRUE;
        if(GetTag(oItem) == "dmfi_exploder") bDMFIExploder = TRUE;
        if(GetTag(oItem) == "DMBookofJournalEntries") bDMbook = TRUE;
        oItem = GetNextItemInInventory(oPC);
        }

    if(!bBESIEWidget) CreateItemOnObject("besiewidget", oPC);  // Creates Besie widget
    if(!bDMFIExploder) CreateItemOnObject("dmfi_exploder", oPC); // Creates DMFI Exploder
//  if(!bDMbook) CreateItemOnObject("dmbookofjournale", oPC); // Creates DM Book of Journal Entries
    }

// Initializes DMFI
if (GetIsDM(oPC))
{
dmfiInitialize(oPC);
return;
}

// ** Player on module entry section **

// Checks to see if item stripping is enabled from above
// If so, strips equipped items and inventory of entering players
// strip script borrowed from Hard Core Modular

if (nStrip)
   {

// Exits if the PC was previously stripped
    int nStripped=GetLocalInt(GetModule(), "nStripped"+GetPCPlayerName(oPC));
    if (nStripped) return;

// Now let's take all their stuff and destroy it
    object oGear;
    int nCt;
    for(nCt=0;nCt<NUM_INVENTORY_SLOTS;nCt++)
    {
        oGear = GetItemInSlot(nCt, oPC);
        if(GetIsObjectValid(oGear))
            DestroyObject(oGear);
    }

    object oStuff = GetFirstItemInInventory(oPC);
    while(GetIsObjectValid(oStuff))
    {
        DestroyObject(oStuff);
        oStuff = GetNextItemInInventory(oPC);
    }

    CreateItemOnObject("starting_clothes",oPC,1); // Gives PC starting clothes
    object oClothes = GetObjectByTag("starting_clothes");
    AssignCommand(oPC, ActionEquipItem(oClothes, INVENTORY_SLOT_CHEST)); // equips the clothes, so the PC is not naked

// Remove all gold from PC
    int nInt;
    nInt=GetGold(oPC);
    AssignCommand(oPC, TakeGoldFromCreature(nInt, oPC, TRUE));

// Gives gold and XP per above Player Strip settings
// you can comment out either line, for example
// if you want to let PCs keep either their current gold or current XP level

   GiveGoldToCreature(oPC, nStartingGold);
   SetXP(oPC, nStartingXP);

// Marks PC as stripped, in case player needs to log out and back in afterwards, to avoid re-stripping them
   SetLocalInt(GetModule(), "nStripped"+GetPCPlayerName(oPC), TRUE);

   }

// Following gives the DMFI PC tools, if not already in inventory
// By default all PC items are given
// comment out a particular section to not give that item to players

if (!GetIsDM(oPC)) // ensures PC items not given to a DM
{
// PC Emote Wand
if(GetIsObjectValid(GetItemPossessedBy(oPC,"dmfi_pc_emote"))==FALSE)
   CreateItemOnObject("dmfi_pc_emote", oPC, 1);

// PC Autofollow Widget
if(GetIsObjectValid(GetItemPossessedBy(oPC,"dmfi_pc_follow"))==FALSE)
   CreateItemOnObject("dmfi_pc_follow", oPC, 1);

// PC Dicebag
if(GetIsObjectValid(GetItemPossessedBy(oPC,"dmfi_pc_dicebag"))==FALSE)
   CreateItemOnObject("dmfi_pc_dicebag", oPC, 1);

// Book of Player Voice Commands
if(GetIsObjectValid(GetItemPossessedBy(oPC,"dmfi_playerbook"))==FALSE)
   CreateItemOnObject("dmfi_playerbook", oPC, 1);

// DMFI 1.09 support - now that all the items are there for the player
   dmfiInitialize(oPC);
}

// Horse support from x3_mod_def_enter

    ExecuteScript("x3_mod_pre_enter",OBJECT_SELF); // Override for other skin systems
    if ((GetIsPC(oPC)||GetIsDM(oPC))&&!GetHasFeat(FEAT_HORSE_MENU,oPC))
    { // add horse menu
        HorseAddHorseMenu(oPC);
        if (GetLocalInt(GetModule(),"X3_ENABLE_MOUNT_DB"))
        { // restore PC horse status from database
            DelayCommand(2.0,HorseReloadFromDatabase(oPC,X3_HORSE_DATABASE));
        } // restore PC horse status from database
    } // add horse menu
    if (GetIsPC(oPC))
    { // more details
        // restore appearance in case you export your character in mounted form, etc.
        if (!GetSkinInt(oPC,"bX3_IS_MOUNTED")) HorseIfNotDefaultAppearanceChange(oPC);
        // pre-cache horse animations for player as attaching a tail to the model
        HorsePreloadAnimations(oPC);
        DelayCommand(3.0,HorseRestoreHenchmenLocations(oPC));
    } // more details

}


