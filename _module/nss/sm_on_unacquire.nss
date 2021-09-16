// DMFI MP Starter Mod
// sm_on_unacquire

//::///////////////////////////////////////////////
//:: includes x2_mod_def_unaqu
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////

#include "x2_inc_switches"
#include "habd_include"

//
//  NWDrop
//
//  Script for when a character drops an item.
//  Place in the OnUnAcquireItem module event.
//
//  (c) Shir'le E. Illios, 2002 (shirle@drowwanderer.com)
//
////////////////////////////////////////////////////////


// Script to place an item on the ground in front of a character.
//  ARGUMENTS:
//      a_oCharacter    - The character dropping the item.
//      a_oItem         - The inventory item being dropped.
//      a_sNewItem      - ResRef of the new item to place.
//
void SEI_PlaceItem( object a_oCharacter, object a_oItem, string a_sNewItem )
{

    // Get information on where we want the object.
    location lCharLocation = GetLocation( a_oCharacter );
    object oArea = GetAreaFromLocation( lCharLocation );
    vector vPosition = GetPositionFromLocation( lCharLocation );
    float fFacing = GetFacingFromLocation( lCharLocation );

    // Face away from the character.
    fFacing += 180.0f;

    // SEI_TODO: Change position to slightly in front of character.

    // Create the new location to place the object.
    location lPlace = Location( oArea, vPosition, fFacing );

    // First destroy the inventory item.
    DestroyObject( a_oItem );

    // And create the new object.
    CreateObject( OBJECT_TYPE_PLACEABLE, a_sNewItem, lPlace );

} // End SEI_PlaceItem



void main()
{

// Original tag-based scripting support

     object oItem = GetModuleItemLost();
     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_UNACQUIRE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

     }

// HABD support
if (HABDOnUnAcquiredItem(GetModuleItemLostBy(), GetModuleItemLost())) return;

// SEI placeables support
    // Get the character who lost the item.
    object oChar = GetModuleItemLostBy();

    // SEI_Note: There seems to be a bug in GetModuleItemLostBy(), which
    //           returns the lost object, not the lost character holding the
    //           object. But strangely enough GetEnteringObject does return the
    //           character. Done like this for backwards compatibility if
    //           BioWare ever fixes the bug.
    if( oChar == oItem )
    {
        oChar = GetEnteringObject();
    }

    // Check if the dropped item is a chair.
    if( GetTag( oItem ) == "Chair" )
    {
        SEI_PlaceItem( oChar, oItem, "movechair" );
    }
    // Check if the dropped item is a stool.
    else if( GetTag( oItem ) == "Stool" )
    {
        SEI_PlaceItem( oChar, oItem, "movestool" );
    }

}
