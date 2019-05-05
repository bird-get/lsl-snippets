vector getRoomSize(vector pos, float range)
{
    vector minX = llList2Vector(llCastRay(pos, pos - <range,0,0>, [RC_REJECT_TYPES, RC_REJECT_AGENTS, RC_MAX_HITS, 1]), 1);
    vector minY = llList2Vector(llCastRay(pos, pos - <0,range,0>, [RC_REJECT_TYPES, RC_REJECT_AGENTS, RC_MAX_HITS, 1]), 1);
    vector minZ = llList2Vector(llCastRay(pos, pos - <0,0,range>, [RC_REJECT_TYPES, RC_REJECT_AGENTS, RC_MAX_HITS, 1]), 1);
    vector maxX = llList2Vector(llCastRay(pos, pos + <range,0,0>, [RC_REJECT_TYPES, RC_REJECT_AGENTS, RC_MAX_HITS, 1]), 1);
    vector maxY = llList2Vector(llCastRay(pos, pos + <0,range,0>, [RC_REJECT_TYPES, RC_REJECT_AGENTS, RC_MAX_HITS, 1]), 1);
    vector maxZ = llList2Vector(llCastRay(pos, pos + <0,0,range>, [RC_REJECT_TYPES, RC_REJECT_AGENTS, RC_MAX_HITS, 1]), 1);
    
    float x = maxX.x - minX.x;
    float y = maxY.y - minY.y;
    float z = maxZ.z - minZ.z;
    return <x,y,z>;
}