string hexc = "0123456789ABCDEF";

key integer2Key(integer x)
{
    integer x0 = x & 0xF;
    string res = llGetSubString(hexc, x0, x0);
    x = (x >> 4) & 0x0FFFFFFF; // otherwise we get infinite loop on negatives.
    while( x != 0 )
    {
        x0 = x & 0xF;
        res = llGetSubString(hexc, x0, x0) + res;
        x = x >> 4;
    }
    return (key)res;
}

integer key2Integer(key id)
{
    return 0x80000000 | (integer)("0x"+(string)id);
}