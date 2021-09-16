////////////////////////////////////////////////////
/*
Custom Random Commoner Table for use with the BESIE
Random Encounter Package by Ray Miller
*/
////////////////////////////////////////////////////

void main()
{
int iVarNum = GetLocalInt(OBJECT_SELF, "re_iVarNum");
int END;
int iWeight;
int iCounter1;
int iCounter2;
string sChoice;
object oMod = GetModule();
while(!END)
    {
    sChoice = "";
    switch(iCounter1)
        {
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//DO NOT EDIT ABOVE THIS LINE/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//CUSTOM ENCOUNTER TABLE BELOW:///////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        case 0:sChoice = "mhuman_1";// Creature tag goes between the " marks.
        iWeight = 2;        // This is the number of times this mob should be considered for the likelyhood of appearing.
        break;

        case 1:sChoice = "mhuman_2";
        iWeight = 2;
        break;

        case 2:sChoice = "mhuman_3";
        iWeight = 2;
        break;

        case 3:sChoice = "mhuman_4";
        iWeight = 2;
        break;

        case 4:sChoice = "mhuman_5";
        iWeight = 2;
        break;

        case 5:sChoice = "mhuman_6";
        iWeight = 2;
        break;

        case 6:sChoice = "mhuman_7";
        iWeight = 2;
        break;

        case 7:sChoice = "mhuman_8";
        iWeight = 2;
        break;

        case 8:sChoice = "mhuman_9";
        iWeight = 2;
        break;

        case 9:sChoice = "mhuman_10";
        iWeight = 2;
        break;

        case 10:sChoice = "fhuman_1";
        iWeight = 2;
        break;

        case 11:sChoice = "fhuman_2";
        iWeight = 2;
        break;

        case 12:sChoice = "fhuman_3";
        iWeight = 2;
        break;

        case 13:sChoice = "fhuman_4";// Creature tag goes between the " marks.
        iWeight = 2;        // This is the number of times this mob should be considered for the likelyhood of appearing.
        break;

        case 14:sChoice = "fhuman_5";
        iWeight = 2;
        break;

        case 15:sChoice = "fhuman_6";
        iWeight = 2;
        break;

        case 16:sChoice = "fhuman_7";
        iWeight = 2;
        break;

        case 17:sChoice = "fhuman_8";
        iWeight = 2;
        break;

        case 18:sChoice = "fhuman_9";
        iWeight = 2;
        break;

        case 19:sChoice = "fhuman_10";
        iWeight = 2;
        break;

        case 20:sChoice = "melf";
        iWeight = 1;
        break;

        case 21:sChoice = "felf";
        iWeight = 1;
        break;

        case 22:sChoice = "mhalfelf";
        iWeight = 1;
        break;

        case 23:sChoice = "fhalfelf";
        iWeight = 1;
        break;

        case 24:sChoice = "mdwarf";
        iWeight = 1;
        break;

        case 25:sChoice = "fhalforc";
        iWeight = 1;
        break;

        case 26:sChoice = "mhalfling";
        iWeight = 1;
        break;

        case 27:sChoice = "fhalfling";
        iWeight = 1;
        break;

        case 28:sChoice = "mgnome";
        iWeight = 1;
        break;

        case 29:sChoice = "fgnome";
        iWeight = 1;
        break;

        case 30:sChoice = "mhalforc";
        iWeight = 1;
        break;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END OF CUSTOM ENCOUNTER TABLE!  DO NOT EDIT BELOW THIS LINE//////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        default:END = TRUE;
        break;
        }
    if(GetStringLowerCase(sChoice) != "")
        {
        for(iCounter2 = 1; iCounter2 <= iWeight; iCounter2++)
            {
            SetLocalString(oMod, "re_sCreatureList" + IntToString(iVarNum), sChoice);
            iVarNum++;
            }
        }
    iCounter1++;
    }
SetLocalInt(OBJECT_SELF, "re_iVarNum", iVarNum);
}
