//:://////////////////////////////////////////////
//:: FileName re_moditemdrop.nss
//:: Copyright (c) 2002 Ray Miller
//:://////////////////////////////////////////////
/*
Note:  This script goes on the Item Unacquired
handler for the module object and is used to
stamp dropped items with a local time variable
for use with the "CleanHouse()" function of the
BESIE Random Encounter Package by Ray Miller.
*/
//:://////////////////////////////////////////////
//:: Created By: Ray Miller
//:: Created On: 7/6/2002
//:://////////////////////////////////////////////
void main()
{
    int iMph;
    if(!GetLocalInt(GetModule(), "iMph"))
        {
        iMph = 2;
        }
    else
        {
        iMph = GetLocalInt(GetModule(), "iMph");
        }
    int iMin = 60;
    int iHr = iMin * iMph;
    int iDay = iHr * 24;
    int iMth = iDay * 28;
    int iYr = iMth * 12;
    object oAmIDroppedLoot = GetModuleItemLost();
    if(GetIsObjectValid(oAmIDroppedLoot))
        {
        SetLocalInt(oAmIDroppedLoot, "bDroppedItem", TRUE);
        SetLocalInt(oAmIDroppedLoot, "iDropTime", (GetCalendarYear() * iYr) + (GetCalendarMonth() * iMth) + (GetCalendarDay()* iDay) + (GetTimeHour()* iHr) + (GetTimeMinute() * iMin) + GetTimeSecond());
        }
}
