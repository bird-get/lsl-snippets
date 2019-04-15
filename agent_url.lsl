// More info:
// http://wiki.secondlife.com/wiki/Viewer_URI_Name_Space

// To do:
// • Escape URL
// • Make faster

string agentURL(string type, string id, string mode, string displayText)
{
    return "[secondlife:///app/"+llDumpList2String([type, id, mode], "/") + " " + displayText + "]";
}