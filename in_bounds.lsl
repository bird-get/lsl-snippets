integer inBounds(vector NE, vector SW, vector checkPos)
{
    if(checkPos.x < NE.x &&
    checkPos.y < NE.y &&
    checkPos.z < NE.z &&
    checkPos.x > SW.x &&
    checkPos.y > SW.y &&
    checkPos.z > SW.z)
        return TRUE;
    else return FALSE;
}