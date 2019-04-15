list easeLinkPosAt(integer link, vector start, vector end, float delta)
{
    return [PRIM_LINK_TARGET, link, PRIM_POS_LOCAL, start+(end-start)*delta];
}

easeLinkPos(integer link, vector start, vector end, integer steps, float duration)
{
    duration /= steps;
    float d = 1./steps;
    integer i;
    for(; i<=steps; i++)
    {
        llSetLinkPrimitiveParamsFast(0, easeLinkPosAt(link, start, end, i*d));
        llSleep(duration);
    }
}