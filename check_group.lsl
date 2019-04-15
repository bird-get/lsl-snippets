integer checkGroup(key id, list groups)
{
    if(id == llGetOwner()) return TRUE;
    integer i;
    for(i = 0; i < llGetListLength(groups); i++)
    {
        if(llList2Key(llGetObjectDetails(id, [OBJECT_GROUP]), 0) == llList2Key(groups, i))
            return TRUE;
    }
    return FALSE;
}