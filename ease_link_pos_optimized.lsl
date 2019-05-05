list easeLinkPosAt(integer link, vector start, vector end, float delta)
{
    return [PRIM_LINK_TARGET, link, PRIM_POS_LOCAL, start+(end-start)*delta];
}

easeLinkPos(integer link, vector start, vector end, float duration)
{
    float s = llGetTime();
    float t;
    do
    {
        t = (llGetTime()-s)/duration;
        llSetLinkPrimitiveParamsFast(0, easeLinkPosAt(link, start, end, t));
        llSleep(0.066666666); //Sleep 3 frames
    }
    while(t < 1);
}