void main()
{
object oDoor = OBJECT_SELF;
AssignCommand(oDoor, ActionWait(5.0f));
AssignCommand(oDoor, ActionCloseDoor(oDoor));
// AssignCommand(oDoor, ActionDoCommand(SetLocked(oDoor, TRUE)));
}
