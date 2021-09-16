// DMFI MP Starter Mod
// sm_on_rest
// selectable resting systems

void main()
{

int restchoice = GetLocalInt(GetModule(), "rest_system");
object oPlayer = GetLastPCRested();

if (restchoice == 1) // Time-based rest limitation
{
// Below is a modified resting script taken from Johan's Simple Balance System
// change nDuration below to modify the number of hours in-game between allowed rests

    int nDuration = 8; // number of in-game (*not* real-life) hours allowed between rests

    if (GetLastRestEventType() == REST_EVENTTYPE_REST_STARTED)
    {
        effect eSleep = EffectVisualEffect(VFX_IMP_SLEEP);

        int iLastHourRest = GetLocalInt(oPlayer, "LastHourRest");
        int iLastDayRest = GetLocalInt(oPlayer, "LastDayRest");
        int iLastYearRest = GetLocalInt(oPlayer, "LastYearRest");
        int iLastMonthRest = GetLocalInt(oPlayer, "LastMonthRest");
        int iHour = GetTimeHour();
        int iDay  = GetCalendarDay();
        int iYear = GetCalendarYear();
        int iMonth = GetCalendarMonth();
        int iHowLong = 0;
        int iSum = iLastHourRest + iLastDayRest + iLastYearRest + iLastMonthRest;

        if (iLastYearRest != iYear)
            iMonth = iMonth + 12;
        if (iLastMonthRest != iMonth)
            iDay = iDay + 28;
        if (iDay != iLastDayRest)
            iHour = iHour + 24 * (iDay - iLastDayRest);

        iHowLong = iHour - iLastHourRest;

        if ((iHowLong < nDuration) && (iSum != 0))
        {
            AssignCommand(oPlayer, ClearAllActions());
            string msg = "You may rest again in " + IntToString(nDuration-iHowLong) + " hours.";
            SendMessageToPC(oPlayer, msg);
        }
        else
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oPlayer, 7.0);
            DelayCommand(9.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oPlayer, 7.0));
        }
    }
    else if (GetLastRestEventType() == REST_EVENTTYPE_REST_FINISHED)
    {
        SetLocalInt(oPlayer, "LastHourRest", GetTimeHour());
        SetLocalInt(oPlayer, "LastDayRest", GetCalendarDay());
        SetLocalInt(oPlayer, "LastMonthRest", GetCalendarMonth());
        SetLocalInt(oPlayer, "LastYearRest", GetCalendarYear());
    }
}

if (restchoice == 2) // Supply-Based Resting
{
// this is a slightly modified version of the original script by Lichking
// called onrest_tst_food

// requires the player to have an item in inventory with the rest_item tag in order to be able to rest
// any number of different items can be given this tag to function with the system, including stackable ones
// a sample "Rest Item" is included in module palette under Special/Custom 5 which can be renamed/copied/modified as desired

    object oItem = GetFirstItemInInventory(oPlayer);
    int iFound = FALSE;

    //Loop through inventory to look for any tagged rest_item
    while(iFound==FALSE && oItem!=OBJECT_INVALID)
    {
        if(GetTag(oItem)!="rest_item")
            oItem = GetNextItemInInventory(oPlayer);
        else
            iFound = TRUE;
    }

    if(iFound==TRUE) // found one!
        {
        //The rest item is removed and the PC is allowed to rest.
        if(GetIsResting(oPlayer))
        {
            int iStackSize = GetItemStackSize(oItem);
            if(iStackSize==1)
                DestroyObject(oItem);
            else
                SetItemStackSize(oItem, iStackSize-1);

        }
    }
    else // didn't find one
{
        //The PC isn't allowed to rest
        if(GetLastRestEventType()==1)
        {
            AssignCommand(oPlayer, ClearAllActions());
            FloatingTextStringOnCreature("You lack the supplies to rest", oPlayer, FALSE);
        }
    }
}

if (restchoice == 3) // DMFI resting system
    ExecuteScript("dmfi_onrest", OBJECT_SELF);


if (restchoice == 4) // standard rest system (unlimited)
{
    effect eSleep = EffectVisualEffect(VFX_IMP_SLEEP);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oPlayer, 7.0);
    DelayCommand(9.0, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eSleep, oPlayer, 7.0));
}


if (restchoice == 5) // disables all resting
{
    AssignCommand(oPlayer, ClearAllActions());
    string msg = "Resting is not possible"; // edit to send your own custom message
    SendMessageToPC(oPlayer, msg);
    return;
}

}


