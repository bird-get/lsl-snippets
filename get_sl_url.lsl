string getSLURL()
{
    string globe = "http://maps.secondlife.com/secondlife";
    string region = llGetRegionName();
    vector pos = llGetPos();
    string posx = (string)llRound(pos.x);
    string posy = (string)llRound(pos.y);
    string posz = (string)llRound(pos.z);
    return (globe + "/" + llEscapeURL(region) +"/" + posx + "/" + posy + "/" + posz);
}