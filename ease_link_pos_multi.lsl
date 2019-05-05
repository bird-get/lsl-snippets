list easeLinkPosAt(integer link, vector start, vector end, float delta)
{
    return [PRIM_LINK_TARGET, link, PRIM_POS_LOCAL, start+(end-start)*delta];
}

easeLinkPosMulti(list links, list starts, list ends, integer steps, float duration)
{
    duration /= steps;
    float d = 1./steps;
    integer i;
    for(; i<=steps; i++)
    {
    	integer i2;
    	list params;
    	for(; i2<=llGetListLength(links); i2++)
    	{
    		integer link = llList2Integer(links, i2);
    		vector start = llList2Vector(starts, i2);
    		vector end = llList2Vector(ends, i2);
    		params += easeLinkPosAt(link, start, end, i*d);
	    }
	    llSetLinkPrimitiveParamsFast(0, params);
	    llSleep(duration);
    }
}