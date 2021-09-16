//:://///////////////////////////////////////////////////////////////
//:: FileName re_spawnerhb
//:: Copyright (c) 2001 Bioware Corp.
//:://///////////////////////////////////////////////////////////////
/*
This script is used in the heartbeat of the
BESIE MMORPG Spawner tool, part of the BESIE Random
Encounter package by Ray Miller.
*/
//:://///////////////////////////////////////////////////////////////
//:: Created By: Ray Miller
//:: Created On: 9-2-02
//:://///////////////////////////////////////////////////////////////
#include "re_rndenc"
void main()
{
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
//Set this parameter to FALSE if you wish
//your encounter distances to be constant
//
int RandomDistance = FALSE
//
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
/*
if you don't want a DM possessed NPC to produce spawns,
insert the following code into your module OnClientEnter
handler.

if(GetIsDM(GetEnteringObject())) SetLocalInt(GetModule(), "re_" + GetName(GetEnteringObject()), TRUE);
else DeleteLocalInt(GetModule(), "re_" + GetName(GetEnteringObject()));
*/
/////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////
    ;
    float fChanceOfEncounter = IntToFloat(GetMaxHitPoints(OBJECT_SELF)) / 100;
    int iFaction;
    int iCounterX;
    object oEncounterObject;
    object oArea = GetArea(OBJECT_SELF);
    object oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
        {
        if(GetArea(oPC) == oArea)
            {
            string sLeader = GetPCPlayerName(GetFactionLeader(oPC)) + GetName(GetFactionLeader(oPC));
            if(!GetLocalInt(OBJECT_SELF, "i" + sLeader))
                {
                iFaction++;
                SetLocalString(OBJECT_SELF, "sFaction" + IntToString(iFaction), sLeader);
                }
            SetLocalInt(OBJECT_SELF, "i" + sLeader, GetLocalInt(OBJECT_SELF, "i" + sLeader) + 1);
            SetLocalObject(OBJECT_SELF, "o" + sLeader + IntToString(GetLocalInt(OBJECT_SELF, "i" + sLeader)), oPC);
            }
        oPC = GetNextPC();
        }
    CleanHouse();
    if(!iFaction) return;
    string sLeader = GetLocalString(OBJECT_SELF, "sFaction" + IntToString(Random(iFaction) + 1));
    int iMember = Random(GetLocalInt(OBJECT_SELF, "i" + sLeader)) + 1;
    oEncounterObject = GetLocalObject(OBJECT_SELF, "o" + sLeader + IntToString(iMember));
    for(iCounterX = 1; iCounterX <= iFaction; iCounterX++)
        {
        DeleteLocalInt(OBJECT_SELF, "i" + GetLocalString(OBJECT_SELF, "sFaction" + IntToString(iCounterX)));
        DeleteLocalString(OBJECT_SELF, "sFaction" + IntToString(iCounterX));
        }
    string sTemplate = GetTag(OBJECT_SELF);
    int iNumberOfParties;
    int iOrientation = 0;
    int iMinDistance = RandomDistance;
    int iDifficulty = GetFortitudeSavingThrow(OBJECT_SELF);
    int iChanceFromBehind = GetReflexSavingThrow(OBJECT_SELF);
    int iMaxDistance = GetWillSavingThrow(OBJECT_SELF);
    if(!GetLocalInt(oEncounterObject, "bInitialized"))
        {
        SetRndEncProperties(oEncounterObject, iDifficulty, TRUE, sTemplate, 180, 2, ENCOUNTER_TYPE_AREA);
        }
    if(!iMaxDistance)
        {
        iMaxDistance = 1;
        }
    if(GetStringLeft(sTemplate, 3) != "re_")
        sTemplate = "random";
    fChanceOfEncounter = IntToFloat(iFaction) * fChanceOfEncounter;
    if((Random(99) + 1) < iChanceFromBehind)
        {
        iOrientation = 180;
        iMaxDistance = 2;
        }
    RandomEncounter(fChanceOfEncounter, oEncounterObject, sTemplate, 0, 0, iMinDistance, iMaxDistance, iOrientation, 30);
}
