////////////////////////////////////////////////////
/*
Default Treasure Table for use with the
BESIE Random Encounter System by Ray Miller

This script is meant to be used as an include
and will not compile on its own.
*/
////////////////////////////////////////////////////
////////////////////////////////////////////////////

float fCRFactor = GetChallengeRating(OBJECT_SELF) / 20.0;

object GiveMoney(object oCreature = OBJECT_SELF)
{
    if(d100()>66) return OBJECT_INVALID;
    object oObject = OBJECT_INVALID;
    object oMarker;
    if(GetRacialType(oCreature) == RACIAL_TYPE_ANIMAL
    || GetRacialType(oCreature) == RACIAL_TYPE_VERMIN) return OBJECT_INVALID;
    float fChallengeFactor = GetChallengeRating(oCreature) * 30.0;
    float fFactor = IntToFloat(Random(5) + 2);
    int iTreasure = FloatToInt(fChallengeFactor / fFactor);
    int iType = GetRacialType(oCreature);
    oObject = CreateItemOnObject("NW_IT_GOLD001", oCreature, iTreasure);
    if(iType == RACIAL_TYPE_UNDEAD || iType == RACIAL_TYPE_ABERRATION)
    oMarker = CreateItemOnObject("NW_IT_MSMLMISC21", oCreature, 1);
    else if(iType == RACIAL_TYPE_CONSTRUCT ||
    iType == RACIAL_TYPE_ELEMENTAL ||
    iType == RACIAL_TYPE_OUTSIDER)
    oMarker = CreateItemOnObject("NW_IT_MSMLMISC11", oCreature, 1);
    else
    oMarker = CreateItemOnObject("NW_IT_MMIDMISC05", oCreature, 1);
    SetLocalInt(oMarker, "bItemForGold", TRUE);
    return oObject;
}





object GiveHealing(object oCreature = OBJECT_SELF)
{
object oObject = OBJECT_INVALID;

//Note:  This statement causes the script to exclude animals from this treasure table.
if(GetRacialType(oCreature) != RACIAL_TYPE_ANIMAL){
//////////////////////////////////////////////////////////////
    int END;
    float fChance;
    float fMinCR;
    float fMaxCR;
    int iCounter1;
    int iMaxNum;
    int iMinNum;
    string sIfIs;
    string sChoice = "";
    while(!END)
                {
                sChoice = "";
                switch(iCounter1)
                    {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//DO NOT EDIT ABOVE THIS LINE/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//CUSTOM TREASURE TABLE BELOW:////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    case 0:sChoice = "NW_IT_MPOTION003";// Treasure resref goes between the " marks.
                    sIfIs = "";         // Only give this treasure to a creature with this TAG (TAG not RESREF.  This allows us to be more specific since the creature already exists when this script is called).
                    fMinCR = 12.0;      // Only give this treasure to a creature whose challenge rating is between these two values.
                    fMaxCR = 0.0;       // Leave them at 0.0 if you wish them not to be considered.
                    fChance = 5.0;      // Set this to the percentage chance of the creature having this item.  This is accurate to one one thousandth (0.001).
                    iMinNum = 1;        //
                    iMaxNum = 1;        // The minimum and maximum numbers of this treasure item to randomly give.
                    break;

                    case 1:sChoice = "NW_IT_MPOTION002";
                    sIfIs = "";
                    fMinCR = 7.0;
                    fMaxCR = 11.99;
                    fChance = 5.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 2:sChoice = "NW_IT_MPOTION020";
                    sIfIs = "";
                    fMinCR = 3.0;
                    fMaxCR = 6.99;
                    fChance = 5.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 3:sChoice = "NW_IT_MPOTION001";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 2.99;
                    fChance = 5.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 4:sChoice = "NW_IT_MEDKIT001";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 5:sChoice = "NW_IT_MEDKIT002";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 1.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 6:sChoice = "NW_IT_MEDKIT003";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 7:sChoice = "NW_IT_MEDKIT004";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.25;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 8:sChoice = "";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END OF CUSTOM TREASURE TABLE!  DO NOT EDIT BELOW THIS LINE///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    default:END = TRUE;
                    break;
                    }
                if((sIfIs == "" || sIfIs == GetTag(oCreature))
                && (fMinCR == 0.0 || (fMinCR != 0.0 && GetChallengeRating(oCreature) >= fMinCR))
                && (fMaxCR == 0.0 || (fMaxCR != 0.0 && GetChallengeRating(oCreature) <= fMaxCR))
                && Random(10000) + 1 <= FloatToInt(fChance * 100.0))
                    {
                    oObject = CreateItemOnObject(sChoice, oCreature, Random((iMaxNum + 1) - iMinNum) + iMinNum);
                    }
                iCounter1++;
                }
}
return oObject;
}





object GiveWeapons(object oCreature = OBJECT_SELF)
{
object oObject = OBJECT_INVALID;
int iStack = 1;
float fRunningChance;
float Chance = 0.0;
int iCounter1 = 1;
int Class;
int Items;
int END;
while(!END)
    {
    switch(iCounter1)
        {
////////////////////////////////////////////////////////////////////////////
/*//////////////////////////////////////////////////////////////////////////
The following table represents the chance of a creature having an item from
this treasure table based upon its class.  Remark in the class type and edit
the chance accordingly.
*///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//case 1:Class  = CLASS_TYPE_ABERRATION;   Chance = 100.0; break;
//case 2:Class  = CLASS_TYPE_ANIMAL;       Chance = 100.0; break;
case 3:Class  = CLASS_TYPE_BARBARIAN;    Chance = 5.0;   break;
case 4:Class  = CLASS_TYPE_BARD;         Chance = 2.5;   break;
//case 5:Class  = CLASS_TYPE_BEAST;        Chance = 100.0; break;
case 6:Class  = CLASS_TYPE_CLERIC;       Chance = 2.5;   break;
case 7:Class  = CLASS_TYPE_COMMONER;     Chance = 5.0;   break;
case 8:Class  = CLASS_TYPE_CONSTRUCT;    Chance = 1.0;   break;
//case 9:Class  = CLASS_TYPE_DRAGON;       Chance = 100.0; break;
case 10:Class = CLASS_TYPE_DRUID;        Chance = 2.5;   break;
//case 11:Class = CLASS_TYPE_ELEMENTAL;    Chance = 100.0; break;
//case 12:Class = CLASS_TYPE_FEY;          Chance = 100.0; break;
case 13:Class = CLASS_TYPE_FIGHTER;      Chance = 7.5;   break;
case 14:Class = CLASS_TYPE_GIANT;        Chance = 1.0;   break;
case 15:Class = CLASS_TYPE_HUMANOID;     Chance = 7.5;   break;
//case 16:Class = CLASS_TYPE_MAGICAL_BEAST; Chance = 100.0;break;
case 17:Class = CLASS_TYPE_MONK;         Chance = 2.0;   break;
//case 18:Class = CLASS_TYPE_MONSTROUS;    Chance = 100.0; break;
//case 19:Class = CLASS_TYPE_OUTSIDER;     Chance = 100.0; break;
case 20:Class = CLASS_TYPE_PALADIN;      Chance = 5.0;   break;
case 21:Class = CLASS_TYPE_RANGER;       Chance = 5.0;   break;
case 22:Class = CLASS_TYPE_ROGUE;        Chance = 5.0;   break;
case 23:Class = CLASS_TYPE_SHAPECHANGER; Chance = 2.0;   break;
case 24:Class = CLASS_TYPE_SORCERER;     Chance = 0.5;   break;
case 25:Class = CLASS_TYPE_UNDEAD;       Chance = 2.0;   break;
//case 26:Class = CLASS_TYPE_VERMIN;       Chance = 100.0;   break;
case 27:Class = CLASS_TYPE_WIZARD;       Chance = 0.5;   break;
///////////////////////////////////////////////////////////////////////////
/*                              END OF TABLE                             */
///////////////////////////////////////////////////////////////////////////
        case 28:END = TRUE;
        default: break;
        }
    if(GetLevelByClass(Class) && Chance > fRunningChance) fRunningChance = Chance;
    iCounter1++;
    }
Chance = fRunningChance;
if(Random(10000) <= FloatToInt(Chance * 100.0))
    {
    string sChoice;
    int iChoices = 4; // set this to the number of "rarity catagories" in the table.
    int iRarityChoice = FloatToInt(1.0 + (IntToFloat(iChoices - 1) * fCRFactor));
    int iRarityLevel = Random(iRarityChoice) + 1;
    switch(iRarityLevel)
        {
case 1:
////////////////////////////////////////
/*          RARITY: COMMON            */
////////////////////////////////////////
////////////////////////////////////////
Items = 36;
switch(Random(Items)+1)
{
case 1:sChoice = "NW_WAXGR001";   break;
case 2:sChoice = "NW_WAXHN001";   break;
case 3:sChoice = "NW_WAXBT001";   break;
case 4:sChoice = "NW_WSWBS001";   break;
case 5:sChoice = "NW_WSWDG001";   break;
case 6:sChoice = "NW_WSWGS001";   break;
case 7:sChoice = "NW_WSWLS001";   break;
case 8:sChoice = "NW_WSWRP001";   break;
case 9:sChoice = "NW_WSWSC001";   break;
case 10:sChoice = "NW_WSWKA001";  break;
case 11:sChoice = "NW_WSWSS001";  break;
case 12:sChoice = "NW_WBLCL001";  break;
case 13:sChoice = "NW_WBLFH001";  break;
case 14:sChoice = "NW_WBLFL001";  break;
case 15:sChoice = "NW_WBLHL001";  break;
case 16:sChoice = "NW_WBLHW001";  break;
case 17:sChoice = "NW_WBLML001";  break;
case 18:sChoice = "NW_WBLMS001";  break;
case 19:sChoice = "NW_WDBMA001";  break;
case 20:sChoice = "NW_WDBAX001";  break;
case 21:sChoice = "NW_WDBQS001";  break;
case 22:sChoice = "NW_WDBSW001";  break;
case 23:sChoice = "NW_WSPKA001";  break;
case 24:sChoice = "NW_WSPKU001";  break;
case 25:sChoice = "NW_WSPSC001";  break;
case 26:sChoice = "NW_WPLHB001";  break;
case 27:sChoice = "NW_WPLSC001";  break;
case 28:sChoice = "NW_WPLSS001";  break;
case 29:sChoice = "NW_WBWXH001";  break;
case 30:sChoice = "NW_WBWXL001";  break;
case 31:sChoice = "NW_WBWLN001";  break;
case 32:sChoice = "NW_WBWSH001";  break;
case 33:sChoice = "NW_WBWSL001";  break;
case 34:sChoice = "NW_WTHDT001";  break;
case 35:sChoice = "NW_WTHSH001";  break;
case 36:sChoice = "NW_WTHAX001";  break;
}
////////////////////////////////////////
/*           END OF TABLE             */
////////////////////////////////////////
////////////////////////////////////////
break;


case 2:
////////////////////////////////////////
/*          RARITY: UNCOMMON          */
////////////////////////////////////////
////////////////////////////////////////
Items = 34;
switch(Random(Items)+1)
{
case 1:sChoice = "NW_WAXMGR002";  break;
case 2:sChoice = "NW_WAXMHN002";  break;
case 3:sChoice = "NW_WAXMBT002";  break;
case 4:sChoice = "NW_WSWMDG002";  break;
case 5:sChoice = "NW_WSWMGS002";  break;
case 6:sChoice = "NW_WSWMLS002";  break;
case 7:sChoice = "NW_WSWMKA002";  break;
case 8:sChoice = "NW_WSWMRP002";  break;
case 9:sChoice = "NW_WSWMSC002";  break;
case 10:sChoice = "NW_WSWMSS002"; break;
case 11:sChoice = "NW_WBLMCL002"; break;
case 12:sChoice = "NW_WBLMFH002"; break;
case 13:sChoice = "NW_WBLMFL002"; break;
case 14:sChoice = "NW_WBLMHL002"; break;
case 15:sChoice = "NW_WBLMHW002"; break;
case 16:sChoice = "NW_WBLMML002"; break;
case 17:sChoice = "NW_WBLMMS002"; break;
case 18:sChoice = "NW_WDBMMA002"; break;
case 19:sChoice = "NW_WDBMAX002"; break;
case 20:sChoice = "NW_WDBMQS002"; break;
case 21:sChoice = "NW_WDBMSW002"; break;
case 22:sChoice = "NW_WSPMKA002"; break;
case 23:sChoice = "NW_WSPMSC002"; break;
case 24:sChoice = "NW_WPLMHB002"; break;
case 25:sChoice = "NW_WPLMSC002"; break;
case 26:sChoice = "NW_WPLMSS002"; break;
case 27:sChoice = "NW_WBWMXH002"; break;
case 28:sChoice = "NW_WBWMXL002"; break;
case 29:sChoice = "NW_WBWMLN002"; break;
case 30:sChoice = "NW_WBWMSH002"; break;
case 31:sChoice = "NW_WBWMSL001"; break;
case 32:sChoice = "NW_WTHMDT002"; break;
case 33:sChoice = "NW_WTHMSH002"; break;
case 34:sChoice = "NW_WTHMAX002"; break;
}
////////////////////////////////////////
/*          END OF TABLE              */
////////////////////////////////////////
break;


case 3:
////////////////////////////////////////
/*          RARITY: RARE              */
////////////////////////////////////////
////////////////////////////////////////
Items = 38;
switch(Random(Items)+1)
{
case 1:sChoice = "NW_WAXMGR009";  break;
case 2:sChoice = "NW_WAXMHN010";  break;
case 3:sChoice = "NW_WAXMBT010";  break;
case 4:sChoice = "NW_WSWMBS009";  break;
case 5:sChoice = "NW_WSWMDG008";  break;
case 6:sChoice = "NW_WSWMGS011";  break;
case 7:sChoice = "NW_WSWMLS010";  break;
case 8:sChoice = "NW_WSWMKA010";  break;
case 9:sChoice = "NW_WSWMRP010";  break;
case 10:sChoice = "NW_WSWMSC010"; break;
case 11:sChoice = "NW_WSWMSS009"; break;
case 12:sChoice = "NW_WBLMCL010"; break;
case 13:sChoice = "NW_WBLMFH010"; break;
case 14:sChoice = "NW_WBLMFL010"; break;
case 15:sChoice = "NW_WBLMHL010"; break;
case 16:sChoice = "NW_WBLMHW011"; break;
case 17:sChoice = "NW_WBLMML011"; break;
case 18:sChoice = "NW_WBLMMS010"; break;
case 19:sChoice = "NW_WDBMMA010"; break;
case 20:sChoice = "NW_WDBMAX010"; break;
case 21:sChoice = "NW_WDBMQS008"; break;
case 22:sChoice = "NW_WDBMSW010"; break;
case 23:sChoice = "NW_WSPMKA008"; break;
case 24:sChoice = "NW_WSPMKU008"; break;
case 25:sChoice = "NW_WSPMSC010"; break;
case 26:sChoice = "NW_WPLMHB010"; break;
case 27:sChoice = "NW_WPLMSC010"; break;
case 28:sChoice = "NW_WPLMSS010"; break;
case 29:sChoice = "NW_WBWMXH008"; break;
case 30:sChoice = "NW_WBWMXL008"; break;
case 31:sChoice = "NW_WBWMLN010"; break;
case 32:sChoice = "NW_WBWMLN008"; break;
case 33:sChoice = "NW_WBWMSH010"; break;
case 34:sChoice = "NW_WBWMSH008"; break;
case 35:sChoice = "NW_WBWMSL009"; break;
case 36:sChoice = "NW_WTHMDT008"; break;
case 37:sChoice = "NW_WTHMSH008"; break;
case 38:sChoice = "NW_WTHMAX008"; break;
}
////////////////////////////////////////
/*         END OF TABLE               */
////////////////////////////////////////
break;


case 4:
////////////////////////////////////////
/*        RARITY: VERY RARE           */
////////////////////////////////////////
////////////////////////////////////////
Items = 40;
switch(Random(Items)+1)
{
case 1:sChoice = "NW_WAXMGR011";  break;
case 2:sChoice = "NW_WAXMHN011";  break;
case 3:sChoice = "NW_WAXMBT011";  break;
case 4:sChoice = "NW_WSWMBS010";  break;
case 5:sChoice = "NW_WSWMDG009";  break;
case 6:sChoice = "NW_WSWMGS012";  break;
case 7:sChoice = "NW_WSWMLS012";  break;
case 8:sChoice = "NW_WSWMKA011";  break;
case 9:sChoice = "NW_WSWMRP011";  break;
case 10:sChoice = "NW_WSWMSC011"; break;
case 11:sChoice = "NW_WSWMSS011"; break;
case 12:sChoice = "NW_WBLMCL011"; break;
case 13:sChoice = "NW_WBLMFH011"; break;
case 14:sChoice = "NW_WBLMFL011"; break;
case 15:sChoice = "NW_WBLMHL011"; break;
case 16:sChoice = "NW_WBLMHW012"; break;
case 17:sChoice = "NW_WBLMML012"; break;
case 18:sChoice = "NW_WBLMMS011"; break;
case 19:sChoice = "NW_WDBMMA011"; break;
case 20:sChoice = "NW_WDBMAX011"; break;
case 21:sChoice = "NW_WDBMQS009"; break;
case 22:sChoice = "NW_WDBMSW011"; break;
case 23:sChoice = "NW_WSPMKA009"; break;
case 24:sChoice = "NW_WSPMKU009"; break;
case 25:sChoice = "NW_WSPMSC011"; break;
case 26:sChoice = "NW_WPLMHB011"; break;
case 27:sChoice = "NW_WPLMSC011"; break;
case 28:sChoice = "NW_WPLMSS011"; break;
case 29:sChoice = "NW_WBWMXH009"; break;
case 30:sChoice = "NW_WBWMXL009"; break;
case 31:sChoice = "NW_WBWMLN011"; break;
case 32:sChoice = "NW_WBWMLN012"; break;
case 33:sChoice = "NW_WBWMLN009"; break;
case 34:sChoice = "NW_WBWMSH011"; break;
case 35:sChoice = "NW_WBWMSH012"; break;
case 36:sChoice = "NW_WBWMSH009"; break;
case 37:sChoice = "NW_WBWMSL010"; break;
case 38:sChoice = "NW_WTHMDT009"; break;
case 39:sChoice = "NW_WTHMSH009"; break;
case 40:sChoice = "NW_WTHMAX009"; break;
}
////////////////////////////////////////
/*         END OF TABLE               */
////////////////////////////////////////
////////////////////////////////////////
break;
        }
    if(GetStringLeft(sChoice, 6) == "NW_WTH") iStack = Random(50) + 1;
    oObject = CreateItemOnObject(sChoice, oCreature, iStack);

    //This code gives a stack of arrows, bolts or, bullets if
    // the weapon is a bow, crossbow, or sling.
    if(GetStringLeft(sChoice, 7) == "NW_WBWX"
    || GetStringLeft(sChoice, 8) == "NW_WBWMX")
    CreateItemOnObject("NW_WAMBO001", oCreature, Random(99) + 1);
    if(GetStringLeft(sChoice, 7) == "NW_WBWL"
    || GetStringLeft(sChoice, 8) == "NW_WBWML"
    || GetStringLeft(sChoice, 8) == "NW_WBWSH"
    || GetStringLeft(sChoice, 9) == "NW_WBWMSH")
    CreateItemOnObject("NW_WAMAR001", oCreature, Random(99) + 1);
    if(GetStringLeft(sChoice, 8) == "NW_WBWSL"
    || GetStringLeft(sChoice, 9) == "NW_WBWMSL")
    CreateItemOnObject("NW_WAMBU001", oCreature, Random(99) + 1);
    }
return oObject;
}





object GiveArmor(object oCreature = OBJECT_SELF)
{
object oObject = OBJECT_INVALID;
float fRunningChance;
float Chance = 0.0;
int iCounter1 = 1;
int Items;
int Class;
int END;
while(!END)
    {
    switch(iCounter1)
        {
////////////////////////////////////////////////////////////////////////////
/*//////////////////////////////////////////////////////////////////////////
The following table represents the chance of a creature having an item from
this treasure table based upon its class.  Remark in the class type and edit
the chance accordingly.
*///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//case 1:Class  = CLASS_TYPE_ABERRATION;   Chance = 100.0; break;
//case 2:Class  = CLASS_TYPE_ANIMAL;       Chance = 100.0; break;
case 3:Class  = CLASS_TYPE_BARBARIAN;    Chance = 7.5;   break;
case 4:Class  = CLASS_TYPE_BARD;         Chance = 2.5;   break;
//case 5:Class  = CLASS_TYPE_BEAST;        Chance = 100.0; break;
case 6:Class  = CLASS_TYPE_CLERIC;       Chance = 5.0;   break;
case 7:Class  = CLASS_TYPE_COMMONER;     Chance = 2.5;   break;
case 8:Class  = CLASS_TYPE_CONSTRUCT;    Chance = 1.0;   break;
//case 9:Class  = CLASS_TYPE_DRAGON;       Chance = 100.0; break;
case 10:Class = CLASS_TYPE_DRUID;        Chance = 2.5;   break;
//case 11:Class = CLASS_TYPE_ELEMENTAL;    Chance = 100.0; break;
//case 12:Class = CLASS_TYPE_FEY;          Chance = 100.0; break;
case 13:Class = CLASS_TYPE_FIGHTER;      Chance = 7.5;   break;
case 14:Class = CLASS_TYPE_GIANT;        Chance = 1.0;   break;
case 15:Class = CLASS_TYPE_HUMANOID;     Chance = 5.0;   break;
//case 16:Class = CLASS_TYPE_MAGICAL_BEAST; Chance = 100.0;break;
case 17:Class = CLASS_TYPE_MONK;         Chance = 2.0;   break;
//case 18:Class = CLASS_TYPE_MONSTROUS;    Chance = 100.0; break;
//case 19:Class = CLASS_TYPE_OUTSIDER;     Chance = 100.0; break;
case 20:Class = CLASS_TYPE_PALADIN;      Chance = 7.5;   break;
case 21:Class = CLASS_TYPE_RANGER;       Chance = 5.0;   break;
case 22:Class = CLASS_TYPE_ROGUE;        Chance = 5.0;   break;
case 23:Class = CLASS_TYPE_SHAPECHANGER; Chance = 1.0;   break;
case 24:Class = CLASS_TYPE_SORCERER;     Chance = 0.5;   break;
case 25:Class = CLASS_TYPE_UNDEAD;       Chance = 2.0;   break;
//case 26:Class = CLASS_TYPE_VERMIN;       Chance = 100.0;   break;
case 27:Class = CLASS_TYPE_WIZARD;       Chance = 0.5;   break;
////////////////////////////////////////////////////////////////////////////
/*                              END OF TABLE
*///////////////////////////////////////////////////////////////////////////
        case 28:END = TRUE;
        default: break;
        }
    if(GetLevelByClass(Class) && Chance > fRunningChance) fRunningChance = Chance;
    iCounter1++;
    }
Chance = fRunningChance;
if(Random(10000) <= FloatToInt(Chance * 100.0))
    {
string sChoice;
    int iChoices = 6; // set this to the number of "rarity catagories" in the table.
    int iRarityChoice = FloatToInt(1.0 + (IntToFloat(iChoices - 1) * fCRFactor));
    int iRarityLevel = Random(iRarityChoice) + 1;
    switch(iRarityLevel)
        {
        case 1:
        Items = 5;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_AARCL012"; break;
            case 2:sChoice = "NW_AARCL001"; break;
            case 3:sChoice = "NW_AARCL009"; break;
            case 4:sChoice = "NW_AARCL002"; break;
            case 5:sChoice = "NW_ASHSW001"; break;
            default: break;
            }
            break;
        case 2:
        Items = 10;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_MAARCL046"; break;
            case 2:sChoice = "NW_MAARCL044"; break;
            case 3:sChoice = "NW_MAARCL043"; break;
            case 4:sChoice = "NW_MAARCL045"; break;
            case 5:sChoice = "NW_ASHMSW002"; break;
            case 6:sChoice = "NW_AARCL010"; break;
            case 7:sChoice = "NW_AARCL004"; break;
            case 8:sChoice = "NW_AARCL008"; break;
            case 9:sChoice = "NW_AARCL003"; break;
            case 10:sChoice = "NW_ASHLW001"; break;
            default: break;
            }
            break;
        case 3:
        Items = 15;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_MAARCL067"; break;
            case 2:sChoice = "NW_MAARCL071"; break;
            case 3:sChoice = "NW_MAARCL072"; break;
            case 4:sChoice = "NW_MAARCL075"; break;
            case 5:sChoice = "NW_ASHMSW008"; break;
            case 6:sChoice = "NW_MAARCL049"; break;
            case 7:sChoice = "NW_MAARCL035"; break;
            case 8:sChoice = "NW_MAARCL047"; break;
            case 9:sChoice = "NW_MAARCL048"; break;
            case 10:sChoice = "NW_AARCL011"; break;
            case 11:sChoice = "NW_AARCL007"; break;
            case 12:sChoice = "NW_AARCL006"; break;
            case 13:sChoice = "NW_AARCL005"; break;
            case 14:sChoice = "NW_ASHMLW002"; break;
            case 15:sChoice = "NW_ASHTO001"; break;
            default: break;
            }
            break;
        case 4:
        Items = 15;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_MAARCL079"; break;
            case 2:sChoice = "NW_MAARCL083"; break;
            case 3:sChoice = "NW_MAARCL084"; break;
            case 4:sChoice = "NW_MAARCL087"; break;
            case 5:sChoice = "NW_ASHMSW009"; break;
            case 6:sChoice = "NW_MAARCL065"; break;
            case 7:sChoice = "NW_MAARCL066"; break;
            case 8:sChoice = "NW_MAARCL070"; break;
            case 9:sChoice = "NW_MAARCL073"; break;
            case 10:sChoice = "NW_ASHMLW008"; break;
            case 11:sChoice = "NW_MAARCL051"; break;
            case 12:sChoice = "NW_MAARCL053"; break;
            case 13:sChoice = "NW_MAARCL052"; break;
            case 14:sChoice = "NW_MAARCL050"; break;
            case 15:sChoice = "NW_ASHMTO002"; break;
            default: break;
            }
            break;
        case 5:
        Items = 10;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_MAARCL077"; break;
            case 2:sChoice = "NW_MAARCL078"; break;
            case 3:sChoice = "NW_MAARCL082"; break;
            case 4:sChoice = "NW_MAARCL085"; break;
            case 5:sChoice = "NW_ASHMLW009"; break;
            case 6:sChoice = "NW_MAARCL064"; break;
            case 7:sChoice = "NW_MAARCL068"; break;
            case 8:sChoice = "NW_MAARCL069"; break;
            case 9:sChoice = "NW_MAARCL074"; break;
            case 10:sChoice = "NW_ASHMTO008"; break;
            default: break;
            }
            break;
        case 6:
        Items = 5;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_MAARCL076"; break;
            case 2:sChoice = "NW_MAARCL080"; break;
            case 3:sChoice = "NW_MAARCL081"; break;
            case 4:sChoice = "NW_MAARCL086"; break;
            case 5:sChoice = "NW_ASHMTO009"; break;
            default: break;
            }
            break;
        default: break;
        }
    oObject = CreateItemOnObject(sChoice, oCreature);
    }
return oObject;
}





object GiveMageWeapons(object oCreature = OBJECT_SELF)
{
object oObject = OBJECT_INVALID;
float fRunningChance;
float Chance = 0.0;
int iCounter = 1;
int Class;
int END;
while(!END)
    {
    switch(iCounter)
        {
////////////////////////////////////////////////////////////////////////////
/*//////////////////////////////////////////////////////////////////////////
The following table represents the chance of a creature having an item from
this treasure table based upon its class.  Remark in the class type and edit
the chance accordingly.
*///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//case 1:Class  = CLASS_TYPE_ABERRATION;    Chance = 100.0;   break;
//case 2:Class  = CLASS_TYPE_ANIMAL;        Chance = 100.0;   break;
case 3:Class  = CLASS_TYPE_BARBARIAN;     Chance = 5.0;   break;
case 4:Class  = CLASS_TYPE_BARD;          Chance = 15.0;   break;
//case 5:Class  = CLASS_TYPE_BEAST;         Chance = 100.0;   break;
case 6:Class  = CLASS_TYPE_CLERIC;        Chance = 30.0;   break;
case 7:Class  = CLASS_TYPE_COMMONER;      Chance = 5.0;   break;
//case 8:Class  = CLASS_TYPE_CONSTRUCT;     Chance = 100.0;   break;
case 9:Class  = CLASS_TYPE_DRAGON;        Chance = 10.0;   break;
case 10:Class = CLASS_TYPE_DRUID;         Chance = 25.0;   break;
//case 11:Class = CLASS_TYPE_ELEMENTAL;     Chance = 100.0;   break;
//case 12:Class = CLASS_TYPE_FEY;           Chance = 100.0;   break;
//case 13:Class = CLASS_TYPE_FIGHTER;       Chance = 100.0;   break;
//case 14:Class = CLASS_TYPE_GIANT;         Chance = 100.0;   break;
case 15:Class = CLASS_TYPE_HUMANOID;      Chance = 2.5;   break;
//case 16:Class = CLASS_TYPE_MAGICAL_BEAST; Chance = 100.0;   break;
//case 17:Class = CLASS_TYPE_MONK;          Chance = 100.0;   break;
//case 18:Class = CLASS_TYPE_MONSTROUS;     Chance = 100.0;   break;
//case 19:Class = CLASS_TYPE_OUTSIDER;      Chance = 100.0;   break;
//case 20:Class = CLASS_TYPE_PALADIN;       Chance = 100.0;   break;
//case 21:Class = CLASS_TYPE_RANGER;        Chance = 100.0;   break;
case 22:Class = CLASS_TYPE_ROGUE;         Chance = 20.0;   break;
//case 23:Class = CLASS_TYPE_SHAPECHANGER;  Chance = 100.0;   break;
case 24:Class = CLASS_TYPE_SORCERER;      Chance = 50.0;   break;
//case 25:Class = CLASS_TYPE_UNDEAD;        Chance = 100.0;   break;
//case 26:Class = CLASS_TYPE_VERMIN;        Chance = 100.0;   break;
case 27:Class = CLASS_TYPE_WIZARD;        Chance = 50.0;   break;
////////////////////////////////////////////////////////////////////////////
/*                              END OF TABLE
*///////////////////////////////////////////////////////////////////////////
        case 28:END = TRUE;
        default: break;
        }
    if(GetLevelByClass(Class) && Chance > fRunningChance) fRunningChance = Chance;
    iCounter++;
    }
Chance = fRunningChance;
if(Random(10000) <= FloatToInt(Chance * 100.0))
    {
    float fChance;
    float fMinCR;
    float fMaxCR;
    int iCounter1;
    int iCounter2;
    int iMaxNum;
    int iMinNum;
    string sIfIs;
    string sChoice = "nil";
    while(sChoice != "")
                {
                sChoice = "";
                switch(iCounter1)
                    {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//DO NOT EDIT ABOVE THIS LINE/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//CUSTOM TREASURE TABLE BELOW:////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    case 0:sChoice = "NW_WMGMRD004";// Treasure resref goes between the " marks.
                    sIfIs = "";         // Only give this treasure to a creature with this TAG (TAG not RESREF.  This allows us to be more specific since the creature already exists when this script is called).
                    fMinCR = 10.0;       // Only give this treasure to a creature whose challenge rating is between these two values.
                    fMaxCR = 0.0;       // Leave them at 0.0 if you wish them not to be considered.
                    fChance = 0.5;      // Set this to the percentage chance of the creature having this item.  This is accurate to one one thousandth (0.001).
                    iMinNum = 1;        //
                    iMaxNum = 1;        // The minimum and maximum numbers of this treasure item to randomly give.
                    break;

                    case 1:sChoice = "nw_wmgmrd006";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 2:sChoice = "NW_WMGMRD002";
                    sIfIs = "";
                    fMinCR = 13.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 3:sChoice = "NW_WMGMRD005";
                    sIfIs = "";
                    fMinCR = 10.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 4:sChoice = "NW_WMGMRD003";
                    sIfIs = "";
                    fMinCR = 7.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 5:sChoice = "NW_WMGRD002";
                    sIfIs = "";
                    fMinCR = 4.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 6:sChoice = "NW_WMGST002";
                    sIfIs = "";
                    fMinCR = 11.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 7:sChoice = "NW_WMGST004";
                    sIfIs = "";
                    fMinCR = 7.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 8:sChoice = "NW_WMGST005";
                    sIfIs = "";
                    fMinCR = 8.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 9:sChoice = "NW_WMGST006";
                    sIfIs = "";
                    fMinCR = 6.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 10:sChoice = "NW_WMGST003";
                    sIfIs = "";
                    fMinCR = 18.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 11:sChoice = "NW_IT_NOVEL008";
                    sIfIs = "";
                    fMinCR = 16.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 12:sChoice = "NW_WMGWN011";
                    sIfIs = "";
                    fMinCR = 7.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 13:sChoice = "NW_WMGWN003";
                    sIfIs = "";
                    fMinCR = 7.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 14:sChoice = "NW_WMGWN002";
                    sIfIs = "";
                    fMinCR = 6.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 15:sChoice = "NW_WMGWN013";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 16:sChoice = "NW_WMGWN007";
                    sIfIs = "";
                    fMinCR = 6.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 17:sChoice = "NW_WMGWN004";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 18:sChoice = "NW_WMGWN006";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 19:sChoice = "NW_WMGWN005";
                    sIfIs = "";
                    fMinCR = 8.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 20:sChoice = "nw_wmgwn012";
                    sIfIs = "";
                    fMinCR = 3.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 21:sChoice = "NW_WMGWN010";
                    sIfIs = "";
                    fMinCR = 7.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 22:sChoice = "NW_WMGWN008";
                    sIfIs = "";
                    fMinCR = 8.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 23:sChoice = "NW_WMGWN009";
                    sIfIs = "";
                    fMinCR = 8.0;
                    fMaxCR = 0.0;
                    fChance = 0.5;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 24:sChoice = "";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END OF CUSTOM TREASURE TABLE!  DO NOT EDIT BELOW THIS LINE///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    }
                if((sIfIs == "" || sIfIs == GetTag(oCreature))
                && (fMinCR == 0.0 || (fMinCR != 0.0 && GetChallengeRating(oCreature) >= fMinCR))
                && (fMaxCR == 0.0 || (fMaxCR != 0.0 && GetChallengeRating(oCreature) <= fMaxCR))
                && Random(10000) + 1 <= FloatToInt(fChance * 100.0))
                    {
                    CreateItemOnObject(sChoice, oCreature, Random((iMaxNum + 1) - iMinNum) + iMinNum);
                    }
                iCounter1++;
                }
    }
return oObject;
}





object GiveScrolls(object oCreature = OBJECT_SELF)
{
object oObject = OBJECT_INVALID;
float fRunningChance;
float Chance = 0.0;
int iCounter1 = 1;
int Items;
int Class;
int END;
while(!END)
    {
    switch(iCounter1)
        {
////////////////////////////////////////////////////////////////////////////
/*//////////////////////////////////////////////////////////////////////////
The following table represents the chance of a creature having an item from
this treasure table based upon its class.  Remark in the class type and edit
the chance accordingly.
*///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//case 1:Class  = CLASS_TYPE_ABERRATION;   Chance = 100.0; break;
//case 2:Class  = CLASS_TYPE_ANIMAL;       Chance = 100.0; break;
case 3:Class  = CLASS_TYPE_BARBARIAN;    Chance = 1.0;   break;
case 4:Class  = CLASS_TYPE_BARD;         Chance = 2.5;   break;
//case 5:Class  = CLASS_TYPE_BEAST;        Chance = 100.0; break;
case 6:Class  = CLASS_TYPE_CLERIC;       Chance = 4.0;  break;
case 7:Class  = CLASS_TYPE_COMMONER;     Chance = 1.0;   break;
//case 8:Class  = CLASS_TYPE_CONSTRUCT;    Chance = 100.0; break;
case 9:Class  = CLASS_TYPE_DRAGON;       Chance = 12.0;  break;
case 10:Class = CLASS_TYPE_DRUID;        Chance = 3.0;  break;
//case 11:Class = CLASS_TYPE_ELEMENTAL;    Chance = 100.0; break;
case 12:Class = CLASS_TYPE_FEY;          Chance = 14.0;  break;
case 13:Class = CLASS_TYPE_FIGHTER;      Chance = 0.5;   break;
case 14:Class = CLASS_TYPE_GIANT;        Chance = 0.5;   break;
case 15:Class = CLASS_TYPE_HUMANOID;     Chance = 0.5;   break;
//case 16:Class = CLASS_TYPE_MAGICAL_BEAST;Chance = 100.0; break;
case 17:Class = CLASS_TYPE_MONK;         Chance = 11.0;   break;
//case 18:Class = CLASS_TYPE_MONSTROUS;    Chance = 100.0; break;
//case 19:Class = CLASS_TYPE_OUTSIDER;     Chance = 100.0; break;
case 20:Class = CLASS_TYPE_PALADIN;      Chance = 2.5;  break;
case 21:Class = CLASS_TYPE_RANGER;       Chance = 12.5;   break;
case 22:Class = CLASS_TYPE_ROGUE;        Chance = 12.5;   break;
//case 23:Class = CLASS_TYPE_SHAPECHANGER; Chance = 100.0; break;
case 24:Class = CLASS_TYPE_SORCERER;     Chance = 15.0;  break;
//case 25:Class = CLASS_TYPE_UNDEAD;       Chance = 100.0  break;
//case 26:Class = CLASS_TYPE_VERMIN;       Chance = 100.0  break;
case 27:Class = CLASS_TYPE_WIZARD;       Chance = 15.0;  break;
///////////////////////////////////////////////////////////////////////////
/*                              END OF TABLE                             */
///////////////////////////////////////////////////////////////////////////
        case 28:END = TRUE; break;
        default: break;
        }
    if(GetLevelByClass(Class) && Chance > fRunningChance) fRunningChance = Chance;
    iCounter1++;
    }
Chance = fRunningChance;
if(Random(10000) <= FloatToInt(Chance * 100.0))
    {
    string sChoice;
    int iChoices = 9; // set this to the number of "rarity catagories" in the table.
    int iRarityChoice = FloatToInt(1.0 + (IntToFloat(iChoices - 1) * fCRFactor));
    int iRarityLevel = Random(iRarityChoice) + 1;
    switch(iRarityLevel)
        {
case 1:
////////////////////////////////////////////
/*            SPELL LEVEL 1               */
////////////////////////////////////////////
////////////////////////////////////////////
Items = 17;
switch(Random(Items) + 1)
{
case 1:sChoice = "NW_IT_SPARSCR112"; break;
case 2:sChoice = "NW_IT_SPARSCR107"; break;
case 3:sChoice = "NW_IT_SPARSCR110"; break;
case 4:sChoice = "NW_IT_SPARSCR206"; break;
case 5:sChoice = "NW_IT_SPARSCR101"; break;
case 6:sChoice = "NW_IT_SPARSCR103"; break;
case 7:sChoice = "NW_IT_SPARSCR106"; break;
case 8:sChoice = "NW_IT_SPARSCR004"; break;
case 9:sChoice = "NW_IT_SPARSCR104"; break;
case 10:sChoice = "NW_IT_SPARSCR109"; break;
case 11:sChoice = "nw_it_sparscr113"; break;
case 12:sChoice = "NW_IT_SPARSCR102"; break;
case 13:sChoice = "NW_IT_SPARSCR111"; break;
case 14:sChoice = "NW_IT_SPARSCR002"; break;
case 15:sChoice = "NW_IT_SPARSCR001"; break;
case 16:sChoice = "NW_IT_SPARSCR108"; break;
case 17:sChoice = "NW_IT_SPARSCR105"; break;
}
////////////////////////////////////////////
/*             END OF TABLE               */
////////////////////////////////////////////
break;


case 2:
////////////////////////////////////////////
/*             SPELL LEVEL 2              */
////////////////////////////////////////////
////////////////////////////////////////////
Items = 25;
switch (Random(Items) + 1)
{
case 1:sChoice = "NW_IT_SPARSCR211"; break;
case 2:sChoice = "NW_IT_SPARSCR212"; break;
case 3:sChoice = "NW_IT_SPARSCR213"; break;
case 4:sChoice = "NW_IT_SPDVSCR202"; break;
case 5:sChoice = "NW_IT_SPARSCR217"; break;
case 6:sChoice = "NW_IT_SPARSCR206"; break;
case 7:sChoice = "nw_it_sparscr219"; break;
case 8:sChoice = "NW_IT_SPARSCR215"; break;
case 9:sChoice = "nw_it_sparscr220"; break;
case 10:sChoice = "NW_IT_SPARSCR208"; break;
case 11:sChoice = "NW_IT_SPARSCR209"; break;
case 12:sChoice = "NW_IT_SPARSCR207"; break;
case 13:sChoice = "NW_IT_SPARSCR216"; break;
case 14:sChoice = "NW_IT_SPARSCR218"; break;
case 15:sChoice = "NW_IT_SPDVSCR201"; break;
case 16:sChoice = "NW_IT_SPARSCR202"; break;
case 17:sChoice = "nw_it_sparscr221"; break;
case 18:sChoice = "NW_IT_SPARSCR201"; break;
case 19:sChoice = "NW_IT_SPARSCR210"; break;
case 20:sChoice = "NW_IT_SPARSCR205"; break;
case 21:sChoice = "NW_IT_SPDVSCR203"; break;
case 22:sChoice = "NW_IT_SPDVSCR204"; break;
case 23:sChoice = "NW_IT_SPARSCR203"; break;
case 24:sChoice = "NW_IT_SPARSCR214"; break;
case 25:sChoice = "NW_IT_SPARSCR204"; break;
}
////////////////////////////////////////////
/*             END OF TABLE               */
////////////////////////////////////////////
break;


case 3:
////////////////////////////////////////////
/*             SPELL LEVEL 3              */
////////////////////////////////////////////
////////////////////////////////////////////
Items = 18;
switch (Random(Items) + 1)
{
case 1:sChoice = "NW_IT_SPARSCR307"; break;
case 2:sChoice = "NW_IT_SPARSCR301"; break;
case 3:sChoice = "NW_IT_SPARSCR309"; break;
case 4:sChoice = "NW_IT_SPARSCR304"; break;
case 5:sChoice = "NW_IT_SPARSCR312"; break;
case 6:sChoice = "NW_IT_SPARSCR308"; break;
case 7:sChoice = "NW_IT_SPARSCR314"; break;
case 8:sChoice = "NW_IT_SPARSCR310"; break;
case 9:sChoice = "NW_IT_SPARSCR302"; break;
case 10:sChoice = "nw_it_sparscr315"; break;
case 11:sChoice = "NW_IT_SPARSCR303"; break;
case 12:sChoice = "NW_IT_SPDVSCR501"; break;
case 13:sChoice = "NW_IT_SPDVSCR301"; break;
case 14:sChoice = "NW_IT_SPDVSCR302"; break;
case 15:sChoice = "NW_IT_SPARSCR313"; break;
case 16:sChoice = "NW_IT_SPARSCR305"; break;
case 17:sChoice = "NW_IT_SPARSCR306"; break;
case 18:sChoice = "NW_IT_SPARSCR311"; break;
}
////////////////////////////////////////////
/*             END OF TABLE               */
////////////////////////////////////////////
break;


case 4:
////////////////////////////////////////////
/*             SPELL LEVEL 4              */
////////////////////////////////////////////
////////////////////////////////////////////
Items = 19;
switch (Random(Items) + 1)
{
case 1:sChoice = "NW_IT_SPARSCR414"; break;
case 2:sChoice = "NW_IT_SPARSCR405"; break;
case 3:sChoice = "NW_IT_SPARSCR406"; break;
case 4:sChoice = "NW_IT_SPARSCR411"; break;
case 5:sChoice = "NW_IT_SPARSCR416"; break;
case 6:sChoice = "NW_IT_SPARSCR412"; break;
case 7:sChoice = "NW_IT_SPARSCR413"; break;
case 8:sChoice = "NW_IT_SPARSCR408"; break;
case 9:sChoice = "NW_IT_SPARSCR417"; break;
case 10:sChoice = "NW_IT_SPARSCR401"; break;
case 11:sChoice = "NW_IT_SPDVSCR402"; break;
case 12:sChoice = "NW_IT_SPARSCR409"; break;
case 13:sChoice = "NW_IT_SPARSCR415"; break;
case 14:sChoice = "NW_IT_SPARSCR402"; break;
case 15:sChoice = "NW_IT_SPDVSCR401"; break;
case 16:sChoice = "NW_IT_SPARSCR410"; break;
case 17:sChoice = "NW_IT_SPARSCR403"; break;
case 18:sChoice = "NW_IT_SPARSCR404"; break;
case 19:sChoice = "NW_IT_SPARSCR407"; break;
}
////////////////////////////////////////////
/*             END OF TABLE               */
////////////////////////////////////////////
break;


case 5:
////////////////////////////////////////////
/*             SPELL LEVEL 5              */
////////////////////////////////////////////
////////////////////////////////////////////
Items = 13;
switch (Random(Items) + 1)
{
case 1:sChoice = "NW_IT_SPARSCR509"; break;
case 2:sChoice = "NW_IT_SPARSCR502"; break;
case 3:sChoice = "NW_IT_SPARSCR507"; break;
case 4:sChoice = "NW_IT_SPARSCR501"; break;
case 5:sChoice = "NW_IT_SPARSCR503"; break;
case 6:sChoice = "NW_IT_SPARSCR504"; break;
case 7:sChoice = "NW_IT_SPARSCR508"; break;
case 8:sChoice = "NW_IT_SPARSCR505"; break;
case 9:sChoice = "NW_IT_SPARSCR511"; break;
case 10:sChoice = "NW_IT_SPARSCR512"; break;
case 11:sChoice = "NW_IT_SPARSCR513"; break;
case 12:sChoice = "NW_IT_SPARSCR506"; break;
case 13:sChoice = "NW_IT_SPARSCR510"; break;
}
////////////////////////////////////////////
/*             END OF TABLE               */
////////////////////////////////////////////
break;


case 6:
////////////////////////////////////////////
/*             SPELL LEVEL 6              */
////////////////////////////////////////////
////////////////////////////////////////////
Items = 14;
switch (Random(Items) + 1)
{
case 1:sChoice = "NW_IT_SPARSCR603"; break;
case 2:sChoice = "NW_IT_SPARSCR607"; break;
case 3:sChoice = "NW_IT_SPARSCR610"; break;
case 4:sChoice = "NW_IT_SPARSCR608"; break;
case 5:sChoice = "NW_IT_SPARSCR601"; break;
case 6:sChoice = "NW_IT_SPARSCR602"; break;
case 7:sChoice = "NW_IT_SPARSCR612"; break;
case 8:sChoice = "NW_IT_SPARSCR613"; break;
case 9:sChoice = "NW_IT_SPARSCR611"; break;
case 10:sChoice = "NW_IT_SPARSCR604"; break;
case 11:sChoice = "NW_IT_SPARSCR609"; break;
case 12:sChoice = "NW_IT_SPARSCR605"; break;
case 13:sChoice = "nw_it_sparscr614"; break;
case 14:sChoice = "NW_IT_SPARSCR606"; break;
}
////////////////////////////////////////////
/*             END OF TABLE               */
////////////////////////////////////////////
break;


case 7:
////////////////////////////////////////////
/*             SPELL LEVEL 7              */
////////////////////////////////////////////
////////////////////////////////////////////
Items = 10;
switch (Random(Items) + 1)
{
case 1:sChoice = "NW_IT_SPARSCR707"; break;
case 2:sChoice = "NW_IT_SPARSCR704"; break;
case 3:sChoice = "NW_IT_SPARSCR708"; break;
case 4:sChoice = "NW_IT_SPDVSCR701"; break;
case 5:sChoice = "NW_IT_SPARSCR705"; break;
case 6:sChoice = "NW_IT_SPARSCR702"; break;
case 7:sChoice = "NW_IT_SPARSCR706"; break;
case 8:sChoice = "NW_IT_SPDVSCR702"; break;
case 9:sChoice = "NW_IT_SPARSCR701"; break;
case 10:sChoice = "NW_IT_SPARSCR703"; break;
}
////////////////////////////////////////////
/*             END OF TABLE               */
////////////////////////////////////////////
break;


case 8:
////////////////////////////////////////////
/*             SPELL LEVEL 8              */
////////////////////////////////////////////
////////////////////////////////////////////
Items = 9;
switch (Random(Items) + 1)
{
case 1:sChoice = "NW_IT_SPARSCR803"; break;
case 2:sChoice = "NW_IT_SPARSCR809"; break;
case 3:sChoice = "NW_IT_SPARSCR804"; break;
case 4:sChoice = "NW_IT_SPARSCR807"; break;
case 5:sChoice = "NW_IT_SPARSCR806"; break;
case 6:sChoice = "NW_IT_SPARSCR801"; break;
case 7:sChoice = "NW_IT_SPARSCR808"; break;
case 8:sChoice = "NW_IT_SPARSCR802"; break;
case 9:sChoice = "NW_IT_SPARSCR805"; break;
}
////////////////////////////////////////////
/*             END OF TABLE               */
////////////////////////////////////////////
break;


case 9:
////////////////////////////////////////////
/*             SPELL LEVEL 9              */
////////////////////////////////////////////
////////////////////////////////////////////
Items = 12;
switch (Random(Items) + 1)
{
case 1:sChoice = "NW_IT_SPARSCR905"; break;
case 2:sChoice = "NW_IT_SPARSCR908"; break;
case 3:sChoice = "NW_IT_SPARSCR902"; break;
case 4:sChoice = "NW_IT_SPARSCR912"; break;
case 5:sChoice = "NW_IT_SPARSCR906"; break;
case 6:sChoice = "NW_IT_SPARSCR901"; break;
case 7:sChoice = "NW_IT_SPARSCR903"; break;
case 8:sChoice = "NW_IT_SPARSCR910"; break;
case 9:sChoice = "NW_IT_SPARSCR904"; break;
case 10:sChoice = "NW_IT_SPARSCR911"; break;
case 11:sChoice = "NW_IT_SPARSCR909"; break;
case 12:sChoice = "NW_IT_SPARSCR907"; break;
}
////////////////////////////////////////////
/*             END OF TABLE               */
////////////////////////////////////////////
break;
        }
    oObject = CreateItemOnObject(sChoice);
    }
return oObject;
}





object GiveGems(object oCreature = OBJECT_SELF)
{
object oObject = OBJECT_INVALID;
float fRunningChance;
float Chance = 0.0;
int iCounter = 1;
int Class;
int END;
while(!END)
    {
    switch(iCounter)
        {
////////////////////////////////////////////////////////////////////////////
/*//////////////////////////////////////////////////////////////////////////
The following table represents the chance of a creature having an item from
this treasure table based upon its class.  Remark in the class type and edit
the chance accordingly.
*///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//case 1:Class  = CLASS_TYPE_ABERRATION;    Chance = 100.0;   break;
//case 2:Class  = CLASS_TYPE_ANIMAL;        Chance = 100.0;   break;
case 3:Class  = CLASS_TYPE_BARBARIAN;     Chance = 1.0;   break;
case 4:Class  = CLASS_TYPE_BARD;          Chance = 10.0;   break;
//case 5:Class  = CLASS_TYPE_BEAST;         Chance = 100.0;   break;
case 6:Class  = CLASS_TYPE_CLERIC;        Chance = 5.0;   break;
case 7:Class  = CLASS_TYPE_COMMONER;      Chance = 5.0;   break;
//case 8:Class  = CLASS_TYPE_CONSTRUCT;     Chance = 100.0;   break;
case 9:Class  = CLASS_TYPE_DRAGON;        Chance = 20.0;   break;
case 10:Class = CLASS_TYPE_DRUID;         Chance = 1.0;   break;
case 11:Class = CLASS_TYPE_ELEMENTAL;     Chance = 5.0;   break;
case 12:Class = CLASS_TYPE_FEY;           Chance = 20.0;   break;
case 13:Class = CLASS_TYPE_FIGHTER;       Chance = 2.5;   break;
case 14:Class = CLASS_TYPE_GIANT;         Chance = 2.5;   break;
case 15:Class = CLASS_TYPE_HUMANOID;      Chance = 2.5;   break;
//case 16:Class = CLASS_TYPE_MAGICAL_BEAST; Chance = 100.0;   break;
case 17:Class = CLASS_TYPE_MONK;          Chance = 2.5;   break;
//case 18:Class = CLASS_TYPE_MONSTROUS;     Chance = 100.0;   break;
//case 19:Class = CLASS_TYPE_OUTSIDER;      Chance = 100.0;   break;
case 20:Class = CLASS_TYPE_PALADIN;       Chance = 1.0;   break;
case 21:Class = CLASS_TYPE_RANGER;        Chance = 5.0;   break;
case 22:Class = CLASS_TYPE_ROGUE;         Chance = 20.0;   break;
//case 23:Class = CLASS_TYPE_SHAPECHANGER;  Chance = 100.0;   break;
case 24:Class = CLASS_TYPE_SORCERER;      Chance = 15.0;   break;
case 25:Class = CLASS_TYPE_UNDEAD;        Chance = 2.5;   break;
//case 26:Class = CLASS_TYPE_VERMIN;        Chance = 100.0;   break;
case 27:Class = CLASS_TYPE_WIZARD;        Chance = 15.0;   break;
////////////////////////////////////////////////////////////////////////////
/*                              END OF TABLE
*///////////////////////////////////////////////////////////////////////////
        case 28:END = TRUE;
        default: break;
        }
    if(GetLevelByClass(Class) && Chance > fRunningChance) fRunningChance = Chance;
    iCounter++;
    }
Chance = fRunningChance;
if(Random(10000) <= FloatToInt(Chance * 100.0))
    {
    float fChance;
    float fMinCR;
    float fMaxCR;
    int iCounter1;
    int iCounter2;
    int iMaxNum;
    int iMinNum;
    string sIfIs;
    string sChoice = "nil";
    while(sChoice != "")
                {
                sChoice = "";
                switch(iCounter1)
                    {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//DO NOT EDIT ABOVE THIS LINE/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//CUSTOM TREASURE TABLE BELOW:////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    case 0:sChoice = "";// Treasure resref goes between the " marks.
                    sIfIs = "";         // Only give this treasure to a creature with this TAG (TAG not RESREF.  This allows us to be more specific since the creature already exists when this script is called).
                    fMinCR = 0.0;       // Only give this treasure to a creature whose challenge rating is between these two values.
                    fMaxCR = 0.0;       // Leave them at 0.0 if you wish them not to be considered.
                    fChance = 0.5;      // Set this to the percentage chance of the creature having this item.  This is accurate to one one thousandth (0.001).
                    iMinNum = 1;        //
                    iMaxNum = 1;        // The minimum and maximum numbers of this treasure item to randomly give.
                    break;

                    case 1:sChoice = "NW_IT_GEM013";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 2:sChoice = "NW_IT_GEM003";
                    sIfIs = "";
                    fMinCR =0.0;
                    fMaxCR = 0.0;
                    fChance = 5.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 3:sChoice = "NW_IT_GEM014";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 10.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 4:sChoice = "NW_IT_GEM005";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.1;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 5:sChoice = "NW_IT_GEM012";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.05;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 6:sChoice = "NW_IT_GEM002";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 10.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 7:sChoice = "NW_IT_GEM009";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.15;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 8:sChoice = "NW_IT_GEM015";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 9:sChoice = "NW_IT_GEM011";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 10:sChoice = "NW_IT_GEM001";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 15.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 11:sChoice = "NW_IT_GEM007";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 15.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 12:sChoice = "NW_IT_GEM004";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 10.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 13:sChoice = "NW_IT_GEM006";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.05;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 14:sChoice = "NW_IT_GEM008";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.2;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 15:sChoice = "NW_IT_GEM010";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 1.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 16:sChoice = "";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.0;
                    iMinNum = 0;
                    iMaxNum = 0;
                    break;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END OF CUSTOM TREASURE TABLE!  DO NOT EDIT BELOW THIS LINE///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    }
                if((sIfIs == "" || sIfIs == GetTag(oCreature))
                && (fMinCR == 0.0 || (fMinCR != 0.0 && GetChallengeRating(oCreature) >= fMinCR))
                && (fMaxCR == 0.0 || (fMaxCR != 0.0 && GetChallengeRating(oCreature) <= fMaxCR))
                && Random(10000) + 1 <= FloatToInt(fChance * 100.0))
                    {
                    oObject = CreateItemOnObject(sChoice, oCreature, Random((iMaxNum + 1) - iMinNum) + iMinNum);
                    }
                iCounter1++;
                }
    }
return oObject;
}




object GivePotions(object oCreature = OBJECT_SELF)
{
object oObject = OBJECT_INVALID;
float fRunningChance;
float Chance = 0.0;
int iCounter = 1;
int Class;
int END;
while(!END)
    {
    switch(iCounter)
        {
////////////////////////////////////////////////////////////////////////////
/*//////////////////////////////////////////////////////////////////////////
The following table represents the chance of a creature having an item from
this treasure table based upon its class.  Remark in the class type and edit
the chance accordingly.
*///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//case 1:Class  = CLASS_TYPE_ABERRATION;    Chance = 100.0;   break;
//case 2:Class  = CLASS_TYPE_ANIMAL;        Chance = 100.0;   break;
case 3:Class  = CLASS_TYPE_BARBARIAN;     Chance = 2.5;   break;
case 4:Class  = CLASS_TYPE_BARD;          Chance = 5.0;   break;
//case 5:Class  = CLASS_TYPE_BEAST;         Chance = 100.0;   break;
case 6:Class  = CLASS_TYPE_CLERIC;        Chance = 10.0;   break;
case 7:Class  = CLASS_TYPE_COMMONER;      Chance = 5.0;   break;
//case 8:Class  = CLASS_TYPE_CONSTRUCT;     Chance = 100.0;   break;
case 9:Class  = CLASS_TYPE_DRAGON;        Chance = 20.0;   break;
case 10:Class = CLASS_TYPE_DRUID;         Chance = 10.0;   break;
//case 11:Class = CLASS_TYPE_ELEMENTAL;     Chance = 100.0;   break;
case 12:Class = CLASS_TYPE_FEY;           Chance = 5.0;   break;
case 13:Class = CLASS_TYPE_FIGHTER;       Chance = 2.5;   break;
case 14:Class = CLASS_TYPE_GIANT;         Chance = 5.0;   break;
case 15:Class = CLASS_TYPE_HUMANOID;      Chance = 5.0;   break;
//case 16:Class = CLASS_TYPE_MAGICAL_BEAST; Chance = 100.0;   break;
case 17:Class = CLASS_TYPE_MONK;          Chance = 5.0;   break;
//case 18:Class = CLASS_TYPE_MONSTROUS;     Chance = 100.0;   break;
//case 19:Class = CLASS_TYPE_OUTSIDER;      Chance = 100.0;   break;
case 20:Class = CLASS_TYPE_PALADIN;       Chance = 5.0;   break;
case 21:Class = CLASS_TYPE_RANGER;        Chance = 10.0;   break;
case 22:Class = CLASS_TYPE_ROGUE;         Chance = 10.0;   break;
//case 23:Class = CLASS_TYPE_SHAPECHANGER;  Chance = 100.0;   break;
case 24:Class = CLASS_TYPE_SORCERER;      Chance = 10.0;   break;
//case 25:Class = CLASS_TYPE_UNDEAD;        Chance = 100.0;   break;
//case 26:Class = CLASS_TYPE_VERMIN;        Chance = 100.0;   break;
case 27:Class = CLASS_TYPE_WIZARD;        Chance = 10.0;   break;
////////////////////////////////////////////////////////////////////////////
/*                              END OF TABLE
*///////////////////////////////////////////////////////////////////////////
        case 28:END = TRUE;
        default: break;
        }
    if(GetLevelByClass(Class) && Chance > fRunningChance) fRunningChance = Chance;
    iCounter++;
    }
Chance = fRunningChance;
if(Random(10000) <= FloatToInt(Chance * 100.0))
    {
    float fChance;
    float fMinCR;
    float fMaxCR;
    int iCounter1;
    int iCounter2;
    int iMaxNum;
    int iMinNum;
    string sIfIs;
    string sChoice = "nil";
    while(sChoice != "")
                {
                sChoice = "";
                switch(iCounter1)
                    {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//DO NOT EDIT ABOVE THIS LINE/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//CUSTOM TREASURE TABLE BELOW:////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    case 0:sChoice = "NW_IT_MPOTION016";// Treasure resref goes between the " marks.
                    sIfIs = "";         // Only give this treasure to a creature with this TAG (TAG not RESREF.  This allows us to be more specific since the creature already exists when this script is called).
                    fMinCR = 0.0;       // Only give this treasure to a creature whose challenge rating is between these two values.
                    fMaxCR = 0.0;       // Leave them at 0.0 if you wish them not to be considered.
                    fChance = 2.0;      // Set this to the percentage chance of the creature having this item.  This is accurate to one one thousandth (0.001).
                    iMinNum = 1;        //
                    iMaxNum = 1;        // The minimum and maximum numbers of this treasure item to randomly give.
                    break;

                    case 1:sChoice = "NW_IT_MPOTION006";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 2:sChoice = "NW_IT_MPOTION005";
                    sIfIs = "";
                    fMinCR =0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 3:sChoice = "NW_IT_MPOTION009";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 4:sChoice = "NW_IT_MPOTION015";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 5:sChoice = "NW_IT_MPOTION014";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 6:sChoice = "NW_IT_MPOTION007";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 7:sChoice = "NW_IT_MPOTION010";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 8:sChoice = "NW_IT_MPOTION013";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 9:sChoice = "NW_IT_MPOTION017";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 10:sChoice = "NW_IT_MPOTION012";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 11:sChoice = "NW_IT_MPOTION008";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 12:sChoice = "NW_IT_MPOTION011";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 13:sChoice = "NW_IT_MPOTION019";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 14:sChoice = "NW_IT_MPOTION018";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 15:sChoice = "NW_IT_MPOTION004";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 16:sChoice = "NW_IT_MPOTION021";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 17:sChoice = "NW_IT_MPOTION022";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 18:sChoice = "NW_IT_MPOTION023";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 2.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 19:sChoice = "";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END OF CUSTOM TREASURE TABLE!  DO NOT EDIT BELOW THIS LINE///////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    }
                if((sIfIs == "" || sIfIs == GetTag(oCreature))
                && (fMinCR == 0.0 || (fMinCR != 0.0 && GetChallengeRating(oCreature) >= fMinCR))
                && (fMaxCR == 0.0 || (fMaxCR != 0.0 && GetChallengeRating(oCreature) <= fMaxCR))
                && Random(10000) + 1 <= FloatToInt(fChance * 100.0))
                    {
                    oObject = CreateItemOnObject(sChoice, oCreature, Random((iMaxNum + 1) - iMinNum) + iMinNum);
                    }
                iCounter1++;
                }
}
return oObject;
}





object GiveJewelry(object oCreature = OBJECT_SELF)
{
object oObject = OBJECT_INVALID;
float fRunningChance;
float Chance = 0.0;
int iCounter1 = 1;
int Items;
int Class;
int END;
while(!END)
    {
    switch(iCounter1)
        {
////////////////////////////////////////////////////////////////////////////
/*//////////////////////////////////////////////////////////////////////////
The following table represents the chance of a creature having an item from
this treasure table based upon its class.  Remark in the class type and edit
the chance accordingly.
*///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
case 1:Class  = CLASS_TYPE_ABERRATION;    Chance = 1.0;   break;
//case 2:Class  = CLASS_TYPE_ANIMAL;        Chance = 100.0;   break;
case 3:Class  = CLASS_TYPE_BARBARIAN;     Chance = 1.0;   break;
case 4:Class  = CLASS_TYPE_BARD;          Chance = 1.0;   break;
//case 5:Class  = CLASS_TYPE_BEAST;         Chance = 100.0;   break;
case 6:Class  = CLASS_TYPE_CLERIC;        Chance = 1.0;   break;
case 7:Class  = CLASS_TYPE_COMMONER;      Chance = 1.0;   break;
//case 8:Class  = CLASS_TYPE_CONSTRUCT;     Chance = 100.0;   break;
case 9:Class  = CLASS_TYPE_DRAGON;        Chance = 10.0;   break;
case 10:Class = CLASS_TYPE_DRUID;         Chance = 1.0;   break;
//case 11:Class = CLASS_TYPE_ELEMENTAL;     Chance = 100.0;   break;
case 12:Class = CLASS_TYPE_FEY;           Chance = 1.0;   break;
case 13:Class = CLASS_TYPE_FIGHTER;       Chance = 1.0;   break;
case 14:Class = CLASS_TYPE_GIANT;         Chance = 1.0;   break;
case 15:Class = CLASS_TYPE_HUMANOID;      Chance = 1.0;   break;
//case 16:Class = CLASS_TYPE_MAGICAL_BEAST; Chance = 100.0;   break;
case 17:Class = CLASS_TYPE_MONK;          Chance = 1.0;   break;
case 18:Class = CLASS_TYPE_MONSTROUS;     Chance = 1.0;   break;
case 19:Class = CLASS_TYPE_OUTSIDER;      Chance = 1.0;   break;
case 20:Class = CLASS_TYPE_PALADIN;       Chance = 1.0;   break;
case 21:Class = CLASS_TYPE_RANGER;        Chance = 1.0;   break;
case 22:Class = CLASS_TYPE_ROGUE;         Chance = 2.0;   break;
case 23:Class = CLASS_TYPE_SHAPECHANGER;  Chance = 1.0;   break;
case 24:Class = CLASS_TYPE_SORCERER;      Chance = 2.0;   break;
case 25:Class = CLASS_TYPE_UNDEAD;        Chance = 1.0;   break;
//case 26:Class = CLASS_TYPE_VERMIN;        Chance = 100.0;   break;
case 27:Class = CLASS_TYPE_WIZARD;        Chance = 1.0;   break;
////////////////////////////////////////////////////////////////////////////
/*                              END OF TABLE
*///////////////////////////////////////////////////////////////////////////
        case 28:END = TRUE;
        default: break;
        }
    if(GetLevelByClass(Class) && Chance > fRunningChance) fRunningChance = Chance;
    iCounter1++;
    }
Chance = fRunningChance;
if(Random(10000) <= FloatToInt(Chance * 100.0))
    {
string sChoice;
    int iChoices = 5; // set this to the number of "rarity catagories" in the table.
    int iRarityChoice = FloatToInt(1.0 + (IntToFloat(iChoices - 1) * fCRFactor));
    int iRarityLevel = Random(iRarityChoice) + 1;
    switch(iRarityLevel)
        {
        case 1:
        Items = 14;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_IT_MNECK001"; break;
            case 2:sChoice = "nw_it_mneck024"; break;
            case 3:sChoice = "NW_IT_MNECK007"; break;
            case 4:sChoice = "NW_IT_MNECK006"; break;
            case 5:sChoice = "NW_IT_MRING006"; break;
            case 6:sChoice = "nw_it_mring024"; break;
            case 7:sChoice = "NW_IT_MRING001"; break;
            case 8:sChoice = "nw_it_mneck032"; break;
            case 9:sChoice = "nw_it_mneck030"; break;
            case 10:sChoice = "nw_it_mneck031"; break;
            case 11:sChoice = "nw_it_mneck029"; break;
            case 12:sChoice = "NW_IT_MRING012"; break;
            case 13:sChoice = "NW_IT_MRING011"; break;
            case 14:sChoice = "NW_IT_MRING013"; break;
            default: break;
            }
            break;
        case 2:
        Items = 12;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_IT_MNECK012"; break;
            case 2:sChoice = "nw_it_mneck025"; break;
            case 3:sChoice = "NW_IT_MNECK008"; break;
            case 4:sChoice = "NW_IT_MNECK016"; break;
            case 5:sChoice = "NW_IT_MRING014"; break;
            case 6:sChoice = "nw_it_mring025"; break;
            case 7:sChoice = "NW_IT_MRING008"; break;
            case 8:sChoice = "NW_IT_MRING031"; break;
            case 9:sChoice = "NW_IT_MNECK033"; break;
            case 10:sChoice = "NW_IT_MRING002"; break;
            case 11:sChoice = "NW_IT_MRING007"; break;
            case 12:sChoice = "NW_IT_MRING003"; break;
            default: break;
            }
            break;
        case 3:
        Items = 12;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_IT_MNECK013"; break;
            case 2:sChoice = "nw_it_mneck026"; break;
            case 3:sChoice = "NW_IT_MNECK009"; break;
            case 4:sChoice = "NW_IT_MNECK017"; break;
            case 5:sChoice = "NW_IT_MRING015"; break;
            case 6:sChoice = "nw_it_mring026"; break;
            case 7:sChoice = "NW_IT_MRING018"; break;
            case 8:sChoice = "NW_IT_MRING032"; break;
            case 9:sChoice = "NW_IT_MNECK036"; break;
            case 10:sChoice = "NW_IT_MNECK005"; break;
            case 11:sChoice = "NW_IT_MRING029"; break;
            case 12:sChoice = "NW_IT_MRING005"; break;
            default: break;
            }
            break;
        case 4:
        Items = 9;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_IT_MNECK014"; break;
            case 2:sChoice = "nw_it_mneck027"; break;
            case 3:sChoice = "NW_IT_MNECK010"; break;
            case 4:sChoice = "NW_IT_MNECK018"; break;
            case 5:sChoice = "NW_IT_MRING016"; break;
            case 6:sChoice = "nw_it_mring027"; break;
            case 7:sChoice = "NW_IT_MRING019"; break;
            case 8:sChoice = "NW_IT_MRING033"; break;
            case 9:sChoice = "NW_IT_MNECK037"; break;
            default: break;
            }
            break;
        case 5:
        Items = 8;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_IT_MNECK015"; break;
            case 2:sChoice = "nw_it_mneck028"; break;
            case 3:sChoice = "NW_IT_MNECK011"; break;
            case 4:sChoice = "NW_IT_MNECK019"; break;
            case 5:sChoice = "NW_IT_MRING017"; break;
            case 6:sChoice = "nw_it_mring028"; break;
            case 7:sChoice = "NW_IT_MRING020"; break;
            case 8:sChoice = "NW_IT_MRING004"; break;
            default: break;
            }
            break;
        default: break;
        }
    oObject = CreateItemOnObject(sChoice, oCreature);
    }
return oObject;
}





object GiveMiscMagic(object oCreature = OBJECT_SELF)
{
object oObject = OBJECT_INVALID;
float fRunningChance;
float Chance = 0.0;
int iCounter1 = 1;
int Items;
int Class;
int END;
while(!END)
    {
    switch(iCounter1)
        {
////////////////////////////////////////////////////////////////////////////
/*//////////////////////////////////////////////////////////////////////////
The following table represents the chance of a creature having an item from
this treasure table based upon its class.  Remark in the class type and edit
the chance accordingly.
*///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
case 1:Class  = CLASS_TYPE_ABERRATION;    Chance = 1.0;   break;
//case 2:Class  = CLASS_TYPE_ANIMAL;        Chance = 100.0;   break;
case 3:Class  = CLASS_TYPE_BARBARIAN;     Chance = 1.0;   break;
case 4:Class  = CLASS_TYPE_BARD;          Chance = 1.0;   break;
//case 5:Class  = CLASS_TYPE_BEAST;         Chance = 100.0;   break;
case 6:Class  = CLASS_TYPE_CLERIC;        Chance = 1.0;   break;
case 7:Class  = CLASS_TYPE_COMMONER;      Chance = 1.0;   break;
case 8:Class  = CLASS_TYPE_CONSTRUCT;     Chance = 1.0;   break;
case 9:Class  = CLASS_TYPE_DRAGON;        Chance = 5.0;   break;
case 10:Class = CLASS_TYPE_DRUID;         Chance = 1.0;   break;
case 11:Class = CLASS_TYPE_ELEMENTAL;     Chance = 1.0;   break;
case 12:Class = CLASS_TYPE_FEY;           Chance = 1.0;   break;
case 13:Class = CLASS_TYPE_FIGHTER;       Chance = 1.0;   break;
case 14:Class = CLASS_TYPE_GIANT;         Chance = 1.0;   break;
case 15:Class = CLASS_TYPE_HUMANOID;      Chance = 1.0;   break;
//case 16:Class = CLASS_TYPE_MAGICAL_BEAST; Chance = 100.0;   break;
case 17:Class = CLASS_TYPE_MONK;          Chance = 1.0;   break;
case 18:Class = CLASS_TYPE_MONSTROUS;     Chance = 1.0;   break;
case 19:Class = CLASS_TYPE_OUTSIDER;      Chance = 1.0;   break;
case 20:Class = CLASS_TYPE_PALADIN;       Chance = 1.0;   break;
case 21:Class = CLASS_TYPE_RANGER;        Chance = 1.0;   break;
case 22:Class = CLASS_TYPE_ROGUE;         Chance = 1.0;   break;
case 23:Class = CLASS_TYPE_SHAPECHANGER;  Chance = 2.0;   break;
case 24:Class = CLASS_TYPE_SORCERER;      Chance = 1.0;   break;
case 25:Class = CLASS_TYPE_UNDEAD;        Chance = 1.0;   break;
//case 26:Class = CLASS_TYPE_VERMIN;        Chance = 100.0;   break;
case 27:Class = CLASS_TYPE_WIZARD;        Chance = 1.0;   break;
////////////////////////////////////////////////////////////////////////////
/*                              END OF TABLE
*///////////////////////////////////////////////////////////////////////////
        case 28:END = TRUE;
        default: break;
        }
    if(GetLevelByClass(Class) && Chance > fRunningChance) fRunningChance = Chance;
    iCounter1++;
    }
Chance = fRunningChance;
if(Random(10000) <= FloatToInt(Chance * 100.0))
    {
string sChoice;
    int iChoices = 5; // set this to the number of "rarity catagories" in the table.
    int iRarityChoice = FloatToInt(1.0 + (IntToFloat(iChoices - 1) * fCRFactor));
    int iRarityLevel = Random(iRarityChoice) + 1;
    switch(iRarityLevel)
        {
        case 1:
        Items = 18;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "nw_it_mboots010"; break;
            case 2:sChoice = "NW_IT_MBOOTS001"; break;
            case 3:sChoice = "NW_IT_MBOOTS018"; break;
            case 4:sChoice = "NW_IT_MBRACER002"; break;
            case 5:sChoice = "NW_IT_MBRACER001"; break;
            case 6:sChoice = "NW_MAARCL055"; break;
            case 7:sChoice = "NW_MAARCL031"; break;
            case 8:sChoice = "nw_it_mglove006"; break;
            case 9:sChoice = "nw_it_mglove004"; break;
            case 10:sChoice = "nw_it_mglove008"; break;
            case 11:sChoice = "nw_it_mglove007"; break;
            case 12:sChoice = "nw_it_mglove009"; break;
            case 13:sChoice = "NW_IT_MGLOVE016"; break;
            case 14:sChoice = "NW_IT_MGLOVE021"; break;
            case 15:sChoice = "nw_it_mglove005"; break;
            case 16:sChoice = "NW_IT_MGLOVE003"; break;
            case 17:sChoice = "NW_IT_MGLOVE026"; break;
            case 18:sChoice = "NW_IT_CONTAIN002"; break;
            default: break;
            }
            break;
        case 2:
        Items = 16;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "nw_it_mbelt018"; break;
            case 2:sChoice = "nw_it_mbelt016"; break;
            case 3:sChoice = "NW_IT_MBOOTS015"; break;
            case 4:sChoice = "nw_it_mboots011"; break;
            case 5:sChoice = "NW_IT_MBOOTS006"; break;
            case 6:sChoice = "NW_IT_MBOOTS019"; break;
            case 7:sChoice = "NW_IT_MBRACER007"; break;
            case 8:sChoice = "NW_IT_MBRACER003"; break;
            case 9:sChoice = "NW_MAARCL104"; break;
            case 10:sChoice = "NW_MAARCL088"; break;
            case 11:sChoice = "NW_MAARCL092"; break;
            case 12:sChoice = "NW_IT_MBRACER013"; break;
            case 13:sChoice = "NW_IT_MGLOVE017"; break;
            case 14:sChoice = "NW_IT_MGLOVE022"; break;
            case 15:sChoice = "NW_IT_MGLOVE027"; break;
            case 16:sChoice = "NW_IT_CONTAIN003"; break;
            default: break;
            }
            break;
        case 3:
        Items = 18;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "nw_it_mbelt019"; break;
            case 2:sChoice = "NW_IT_MBELT002"; break;
            case 3:sChoice = "nw_it_mbelt017"; break;
            case 4:sChoice = "NW_IT_MBOOTS016"; break;
            case 5:sChoice = "nw_it_mboots012"; break;
            case 6:sChoice = "NW_IT_MBOOTS007"; break;
            case 7:sChoice = "NW_IT_MBOOTS020"; break;
            case 8:sChoice = "NW_IT_MBOOTS003"; break;
            case 9:sChoice = "NW_IT_MBRACER008"; break;
            case 10:sChoice = "NW_IT_MBRACER004"; break;
            case 11:sChoice = "NW_MAARCL105"; break;
            case 12:sChoice = "NW_MAARCL056"; break;
            case 13:sChoice = "NW_MAARCL089"; break;
            case 14:sChoice = "NW_MAARCL093"; break;
            case 15:sChoice = "NW_IT_MGLOVE018"; break;
            case 16:sChoice = "NW_IT_MGLOVE023"; break;
            case 17:sChoice = "NW_IT_MGLOVE028"; break;
            case 18:sChoice = "NW_IT_CONTAIN004"; break;
            default: break;
            }
            break;
        case 4:
        Items = 16;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "nw_it_mbelt020"; break;
            case 2:sChoice = "NW_IT_MBELT007"; break;
            case 3:sChoice = "NW_IT_MBOOTS017"; break;
            case 4:sChoice = "nw_it_mboots013"; break;
            case 5:sChoice = "NW_IT_MBOOTS005"; break;
            case 6:sChoice = "NW_IT_MBOOTS008"; break;
            case 7:sChoice = "NW_IT_MBOOTS021"; break;
            case 8:sChoice = "NW_IT_MBRACER009"; break;
            case 9:sChoice = "NW_IT_MBRACER005"; break;
            case 10:sChoice = "NW_MAARCL106"; break;
            case 11:sChoice = "NW_MAARCL090"; break;
            case 12:sChoice = "NW_MAARCL094"; break;
            case 13:sChoice = "NW_IT_MGLOVE019"; break;
            case 14:sChoice = "NW_IT_MGLOVE024"; break;
            case 15:sChoice = "NW_IT_MGLOVE029"; break;
            case 16:sChoice = "NW_IT_CONTAIN005"; break;
            default: break;
            }
            break;
        case 5:
        Items = 14;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "nw_it_mbelt021"; break;
            case 2:sChoice = "NW_IT_MBELT002"; break;
            case 3:sChoice = "nw_it_mboots014"; break;
            case 4:sChoice = "NW_IT_MBOOTS008"; break;
            case 5:sChoice = "NW_IT_MBOOTS009"; break;
            case 6:sChoice = "NW_IT_MBOOTS022"; break;
            case 7:sChoice = "NW_IT_MBRACER010"; break;
            case 8:sChoice = "NW_IT_MBRACER006"; break;
            case 9:sChoice = "NW_MAARCL091"; break;
            case 10:sChoice = "NW_MAARCL095"; break;
            case 11:sChoice = "NW_IT_MGLOVE020"; break;
            case 12:sChoice = "NW_IT_MGLOVE025"; break;
            case 13:sChoice = "NW_IT_MGLOVE030"; break;
            case 14:sChoice = "NW_IT_CONTAIN006"; break;
            default: break;
            }
            break;
        default: break;
        }
    oObject = CreateItemOnObject(sChoice, oCreature);
    }
return oObject;
}





object GiveTraps(object oCreature = OBJECT_SELF)
{
object oObject = OBJECT_INVALID;
float fRunningChance;
float Chance = 0.0;
int iCounter1 = 1;
int Items;
int Class;
int END;
while(!END)
    {
    switch(iCounter1)
        {
////////////////////////////////////////////////////////////////////////////
/*//////////////////////////////////////////////////////////////////////////
The following table represents the chance of a creature having an item from
this treasure table based upon its class.  Remark in the class type and edit
the chance accordingly.
*///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
//case 1:Class  = CLASS_TYPE_ABERRATION;    Chance = 100.0;   break;
//case 2:Class  = CLASS_TYPE_ANIMAL;        Chance = 100.0;   break;
//case 3:Class  = CLASS_TYPE_BARBARIAN;     Chance = 100.0;   break;
case 4:Class  = CLASS_TYPE_BARD;          Chance = 2.5;   break;
//case 5:Class  = CLASS_TYPE_BEAST;         Chance = 100.0;   break;
//case 6:Class  = CLASS_TYPE_CLERIC;        Chance = 100.0;   break;
//case 7:Class  = CLASS_TYPE_COMMONER;      Chance = 100.0;   break;
//case 8:Class  = CLASS_TYPE_CONSTRUCT;     Chance = 100.0;   break;
//case 9:Class  = CLASS_TYPE_DRAGON;        Chance = 100.0;   break;
//case 10:Class = CLASS_TYPE_DRUID;         Chance = 100.0;   break;
//case 11:Class = CLASS_TYPE_ELEMENTAL;     Chance = 100.0;   break;
//case 12:Class = CLASS_TYPE_FEY;           Chance = 100.0;   break;
//case 13:Class = CLASS_TYPE_FIGHTER;       Chance = 100.0;   break;
//case 14:Class = CLASS_TYPE_GIANT;         Chance = 100.0;   break;
//case 15:Class = CLASS_TYPE_HUMANOID;      Chance = 100.0;   break;
//case 16:Class = CLASS_TYPE_MAGICAL_BEAST; Chance = 100.0;   break;
//case 17:Class = CLASS_TYPE_MONK;          Chance = 100.0;   break;
//case 18:Class = CLASS_TYPE_MONSTROUS;     Chance = 100.0;   break;
//case 19:Class = CLASS_TYPE_OUTSIDER;      Chance = 100.0;   break;
//case 20:Class = CLASS_TYPE_PALADIN;       Chance = 100.0;   break;
//case 21:Class = CLASS_TYPE_RANGER;        Chance = 100.0;   break;
case 22:Class = CLASS_TYPE_ROGUE;         Chance = 5.0;   break;
//case 23:Class = CLASS_TYPE_SHAPECHANGER;  Chance = 100.0;   break;
//case 24:Class = CLASS_TYPE_SORCERER;      Chance = 100.0;   break;
//case 25:Class = CLASS_TYPE_UNDEAD;        Chance = 100.0;   break;
//case 26:Class = CLASS_TYPE_VERMIN;        Chance = 100.0;   break;
//case 27:Class = CLASS_TYPE_WIZARD;        Chance = 100.0;   break;
////////////////////////////////////////////////////////////////////////////
/*                              END OF TABLE
*///////////////////////////////////////////////////////////////////////////
        case 28:END = TRUE;
        default: break;
        }
    if(GetLevelByClass(Class) && Chance > fRunningChance) fRunningChance = Chance;
    iCounter1++;
    }
Chance = fRunningChance;
if(Random(10000) <= FloatToInt(Chance * 100.0))
    {
string sChoice;
    int iChoices = 4; // set this to the number of "rarity catagories" in the table.
    int iRarityChoice = FloatToInt(1.0 + (IntToFloat(iChoices - 1) * fCRFactor));
    int iRarityLevel = Random(iRarityChoice) + 1;
    switch(iRarityLevel)
        {
        case 1:
        Items = 12;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_IT_TRAP033"; break;
            case 2:sChoice = "NW_IT_TRAP013"; break;
            case 3:sChoice = "NW_IT_TRAP021"; break;
            case 4:sChoice = "NW_IT_TRAP017"; break;
            case 5:sChoice = "NW_IT_TRAP029"; break;
            case 6:sChoice = "NW_IT_TRAP025"; break;
            case 7:sChoice = "NW_IT_TRAP005"; break;
            case 8:sChoice = "NW_IT_TRAP041"; break;
            case 9:sChoice = "NW_IT_TRAP037"; break;
            case 10:sChoice = "NW_IT_TRAP001"; break;
            case 11:sChoice = "NW_IT_TRAP009"; break;
            case 12:sChoice = "NW_IT_PICKS001"; break;
            default: break;
            }
            break;
        case 2:
        Items = 12;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_IT_TRAP034"; break;
            case 2:sChoice = "NW_IT_TRAP014"; break;
            case 3:sChoice = "NW_IT_TRAP022"; break;
            case 4:sChoice = "NW_IT_TRAP018"; break;
            case 5:sChoice = "NW_IT_TRAP030"; break;
            case 6:sChoice = "NW_IT_TRAP026"; break;
            case 7:sChoice = "NW_IT_TRAP006"; break;
            case 8:sChoice = "NW_IT_TRAP042"; break;
            case 9:sChoice = "NW_IT_TRAP038"; break;
            case 10:sChoice = "NW_IT_TRAP002"; break;
            case 11:sChoice = "NW_IT_TRAP010"; break;
            case 12:sChoice = "NW_IT_PICKS002"; break;
            default: break;
            }
            break;
        case 3:
        Items = 12;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_IT_TRAP035"; break;
            case 2:sChoice = "NW_IT_TRAP015"; break;
            case 3:sChoice = "NW_IT_TRAP023"; break;
            case 4:sChoice = "NW_IT_TRAP019"; break;
            case 5:sChoice = "NW_IT_TRAP031"; break;
            case 6:sChoice = "NW_IT_TRAP027"; break;
            case 7:sChoice = "NW_IT_TRAP007"; break;
            case 8:sChoice = "NW_IT_TRAP043"; break;
            case 9:sChoice = "NW_IT_TRAP039"; break;
            case 10:sChoice = "NW_IT_TRAP003"; break;
            case 11:sChoice = "NW_IT_TRAP011"; break;
            case 12:sChoice = "NW_IT_PICKS003"; break;
            default: break;
            }
            break;
        case 4:
        Items = 12;
        switch(Random(Items)+1)
            {
            case 1:sChoice = "NW_IT_TRAP036"; break;
            case 2:sChoice = "NW_IT_TRAP016"; break;
            case 3:sChoice = "NW_IT_TRAP024"; break;
            case 4:sChoice = "NW_IT_TRAP020"; break;
            case 5:sChoice = "NW_IT_TRAP032"; break;
            case 6:sChoice = "NW_IT_TRAP028"; break;
            case 7:sChoice = "NW_IT_TRAP008"; break;
            case 8:sChoice = "NW_IT_TRAP044"; break;
            case 9:sChoice = "NW_IT_TRAP040"; break;
            case 10:sChoice = "NW_IT_TRAP004"; break;
            case 11:sChoice = "NW_IT_TRAP012"; break;
            case 12:sChoice = "NW_IT_PICKS004"; break;
            default: break;
            }
            break;
        default: break;
        }
    oObject = CreateItemOnObject(sChoice, oCreature);
    }
return oObject;
}
