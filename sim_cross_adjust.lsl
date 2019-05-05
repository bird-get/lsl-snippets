vector simCrossAdjust;
vector getSimBorder(vector pos, vector direction, integer simCrossing) //# pos must be global; direction must be normalized;
{
    if(llEdgeOfWorld(pos, direction) && simCrossing)
        return ZERO_VECTOR;
    
    direction = <direction.x + 0.000001, direction.y + 0.000001, direction.z + 0.000001>;
    simCrossAdjust = ZERO_VECTOR;
    float multiplicand;
    float multiplicand_supporting;
    vector flatPos = <pos.x, pos.y, 0>;
    vector border = flatPos;
    //direction.x == 0 && direction.y == 0 is being excluded through the EdgeOfWorld

    if(direction.x > 0)
    {
        border.x = 256;
        simCrossAdjust.x = 3;
    }
    else 
    {
        border.x = 0;
        simCrossAdjust.x = -3;
    }
    
    multiplicand = llVecDist(flatPos, border) / llFabs(direction.x);
    
    border = flatPos;
    //Y Axis
    if(direction.y > 0)
    {
        border.y = 256;
        simCrossAdjust.y = 3;
    }
    else
    {
        border.y = 0;
        simCrossAdjust.y = -3;
    }
    
    multiplicand_supporting = llVecDist(flatPos, border) / llFabs(direction.y);
    
    if(multiplicand_supporting < multiplicand)
    {
        simCrossAdjust.x = 0;
        multiplicand = multiplicand_supporting;
    }
    else
        simCrossAdjust.y = 0;
    
    if(multiplicand == 0)
        return ZERO_VECTOR;
    
    if(direction.z > 0)
        border.z = 4096;
    else
        border.z = 0;
        
    multiplicand_supporting = llVecDist(<0, 0, pos.z>, <0, 0, border.z>) / llFabs(direction.z);
    if(multiplicand_supporting < multiplicand)
        multiplicand = multiplicand_supporting;
    return pos + direction * multiplicand + simCrossAdjust * simCrossing;
}