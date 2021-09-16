// DMFI MP Starter Mod
// sm_on_act

#include "habd_include"
#include "x2_inc_switches"

void main()
{

    object oItem=GetItemActivated();
    object oTarget=GetItemActivatedTarget();
    object oUser=GetItemActivator();
    location lTarLoc=GetItemActivatedTargetLocation();
    string sTag = GetTag(oItem);

     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACTIVATE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

     }

// HABD support
if (HABDOnActivateItem(GetItemActivator(), GetItemActivatedTarget(), GetItemActivated())) return;


// BESIE Widget support
if (sTag == "BESIEWidget")
    {
    if(!GetIsDM(oUser)) return; // exits if not a DM
    AssignCommand(oUser, ActionStartConversation(oUser, "re_widget", TRUE));
    }

// DM Book of Journal Entries support
if (sTag == "DMBookofJournalEntries")
    {
    if(!GetIsDM(oUser)) return; // exits if not a DM
    AssignCommand(oUser, ActionStartConversation(oUser, "dm_journal_entry", TRUE));
    }

// if nothing found...

ClearAllActions();
return;

}
