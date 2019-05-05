vector relativeAngles()
{
    rotation rot = llGetRot();
    vector eulerRot = llRot2Euler(rot);
    rotation zRot = llEuler2Rot(<0,0,eulerRot.z>);
    rotation fwd  = llRotBetween(<1,0,0>, <1,0,0> * zRot);
    rotation left = llRotBetween(<1,0,0>, <0,1,0> * zRot);
    rotation up   = llRotBetween(<1,0,0>, <0,0,1> * zRot);

    return <
        llAngleBetween(rot, fwd),
        llAngleBetween(rot, left) - PI_BY_TWO, 
        llAngleBetween(rot, up)
        >;
}

integer checkUpright(float degreeCapX, float degreeCapY)
{
    vector angles = relativeAngles();
    degreeCapX *= DEG_TO_RAD;
    degreeCapY *= DEG_TO_RAD;
    if(angles.x > degreeCapX || angles.y > degreeCapY)
        return FALSE;
    else return TRUE;
}