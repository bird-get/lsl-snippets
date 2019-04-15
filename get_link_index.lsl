// This snippet will return the link number for a given link name.

integer getLinkIndex(string name)
{
    integer i = llGetNumberOfPrims();
    do
        if(llGetLinkName(i) == name)
            return i;
    while(--i > 0);
    return 0;
}