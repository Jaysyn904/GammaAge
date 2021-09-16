// trigger_warn_dms

// grabs the name of the entering object (usually a PC) and the area name
// and sends a message on the DM channel containing the information
// To use, place in an Area OnEnter handler or paint the custom "Trigger_Warn"

void main()
{
object oEntering=GetEnteringObject();
string sEnteringName=GetName(oEntering);
object oArea = GetArea(oEntering);
string sAreaName = GetName(oArea);

string sTellMe = sEnteringName + " just entered " + sAreaName;
SendMessageToAllDMs(sTellMe);

}
