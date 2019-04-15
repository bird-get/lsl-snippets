rotation normal2Rot(vector normal) // Raycast normal to rotation
{
    vector left = llVecNorm(normal % <0,0,1>);
    return llAxes2Rot(left % normal, left, normal);
}