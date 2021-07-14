////////////////////////////////////////////////////
/*
Custom Random Encounter Table for use with the BESIE
Random Encounter Package by Ray Miller
*/
////////////////////////////////////////////////////

void main()
{
    int iVarNum = GetLocalInt(OBJECT_SELF, "iVarNum");
    float fMinCR = GetLocalFloat(OBJECT_SELF, "fMinCR");
    float fMaxCR = GetLocalFloat(OBJECT_SELF, "fMaxCR");
    int iCounter1;
    int iCounter2;
    int iMaxNum;
    int iMinNum;
    int iWeight;
    float fCR;
    string sChoice = "nil";
    object oMod = GetModule();
    while(sChoice != "")
                {
                sChoice = "";
                switch(iCounter1)
                    {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//DO NOT EDIT ABOVE THIS LINE/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//CUSTOM ENCOUNTER TABLE BELOW:///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                    case 0:sChoice = "darkened_wolf";// Creature tag goes between the " marks.
                    fCR = 1.5;          // Set this to the challenge rating of the creature as shown on the creature pallette.
                    iMinNum = 2;        //
                    iMaxNum = 8;        // If these are left at zero then an appropriate number of creatures will be spawned based on the CR.
                    iWeight = 1;        // This is the number of times this mob should be considered for the likelyhood of appearing.
                    break;

                    case 1:sChoice = "";
                    fCR = 0.0;
                    iMinNum = 0;
                    iMaxNum = 0;
                    iWeight = 1;
                    break;

                    case 2:sChoice = "";
                    fCR = 0.0;
                    iMinNum = 0;
                    iMaxNum = 0;
                    iWeight = 1;
                    break;

                    case 3:sChoice = "";
                    fCR = 0.0;
                    iMinNum = 0;
                    iMaxNum = 0;
                    iWeight = 1;
                    break;

                    case 4:sChoice = "";
                    fCR = 0.0;
                    iMinNum = 0;
                    iMaxNum = 0;
                    iWeight = 1;
                    break;

                    case 5:sChoice = "";
                    fCR = 0.0;
                    iMinNum = 0;
                    iMaxNum = 0;
                    iWeight = 1;
                    break;

                    case 6:sChoice = "";
                    fCR = 0.0;
                    iMinNum = 0;
                    iMaxNum = 0;
                    iWeight = 1;
                    break;

                    case 7:sChoice = "";
                    fCR = 0.0;
                    iMinNum = 0;
                    iMaxNum = 0;
                    iWeight = 1;
                    break;

                    case 8:sChoice = "";
                    fCR = 0.0;
                    iMinNum = 0;
                    iMaxNum = 0;
                    iWeight = 1;
                    break;

                    case 9:sChoice = "";
                    fCR = 0.0;
                    iMinNum = 0;
                    iMaxNum = 0;
                    iWeight = 1;
                    break;

                    case 10:sChoice = "";
                    iMinNum = 0;
                    iMaxNum = 0;
                    iWeight = 1;
                    fCR = 0.0;
                    break;

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END OF CUSTOM ENCOUNTER TABLE!  DO NOT EDIT BELOW THIS LINE//////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    }
                if(fCR >= fMinCR && fCR <= fMaxCR && GetStringLowerCase(sChoice) != "")
                    {
                    for(iCounter2 = 1; iCounter2 <= iWeight; iCounter2++)
                        {
                        SetLocalString(oMod, "sCreatureList" + IntToString(iVarNum), sChoice);
                        SetLocalInt(oMod, "iMaxNumberOfCreatures" + IntToString(iVarNum), iMaxNum);
                        SetLocalInt(oMod, "iMinNumberOfCreatures" + IntToString(iVarNum), iMinNum);
                        iVarNum++;
                        }
                    }
                iCounter1++;
                }
SetLocalInt(OBJECT_SELF, "iVarNum", iVarNum);
}
