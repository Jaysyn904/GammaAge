////////////////////////////////////////////////////
/*
Custom Treasure Table for use with the BESIE
Random Encounter Package by Ray Miller
*/
////////////////////////////////////////////////////
////////////////////////////////////////////////////
void main()
{
    //Note:  This statement causes the script to exclude animals from this treasure table.
    if(GetRacialType(OBJECT_SELF) == RACIAL_TYPE_ANIMAL) return;
    ////////////////////////////////////////////////////////////
    object oCreature = OBJECT_SELF;
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

                    case 0:sChoice = "NW_IT_MPOTION003";// Treasure resref goes between the " marks.
                    sIfIs = "";         // Only give this treasure to a creature with this TAG (TAG not RESREF.  This allows us to be more specific since the creature already exists when this script is called).
                    fMinCR = 15.0;      // Only give this treasure to a creature whose challenge rating is between these two values.
                    fMaxCR = 0.0;       // Leave them at 0.0 if you wish them not to be considered.
                    fChance = 25.0;      // Set this to the percentage chance of the creature having this item.  This is accurate to one one thousandth (0.001).
                    iMinNum = 1;        //
                    iMaxNum = 1;        // The minimum and maximum numbers of this treasure item to randomly give.
                    break;

                    case 1:sChoice = "NW_IT_MPOTION002";
                    sIfIs = "";
                    fMinCR = 10.0;
                    fMaxCR = 14.99;
                    fChance = 25.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 2:sChoice = "NW_IT_MPOTION020";
                    sIfIs = "";
                    fMinCR = 5.0;
                    fMaxCR = 9.99;
                    fChance = 25.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 3:sChoice = "NW_IT_MPOTION001";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 4.99;
                    fChance = 25.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 4:sChoice = "";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 5:sChoice = "";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 6:sChoice = "";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 7:sChoice = "";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.0;
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

                    case 9:sChoice = "";
                    sIfIs = "";
                    fMinCR = 0.0;
                    fMaxCR = 0.0;
                    fChance = 0.0;
                    iMinNum = 1;
                    iMaxNum = 1;
                    break;

                    case 10:sChoice = "";
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
