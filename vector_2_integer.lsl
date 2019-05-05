vector2Integer(vector vec)
{
    string x = (string)llRound(vec.x);
    string y = (string)llRound(vec.y);
    string z = (string)llRound(vec.z);

    if(llStringLength(x) == 1) x = "00" + x;
    else if(llStringLength(x) == 2) x = "0" + x;

    if(llStringLength(y) == 1) y = "00" + y;
    else if(llStringLength(y) == 2) y = "0" + y;

    if(llStringLength(z) == 1) z = "00" + z;
    else if(llStringLength(z) == 2) z = "0" + z;
}

integer2Vector(integer int)
{

}