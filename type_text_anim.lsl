// Max setText length is 254 bytes.

list textLines;

float textVolume = .25;
vector textColor = <1,1,1>;
float textAnimSpeed = .02;

textTypeAnim(integer link, integer add, string text)
{
    list newLines = llParseString2List(text, ["\n"], [""]);

    string displayText;
    if(!add) textLines = [];
    else
    {
        // Count all chars in both lists
        while(llStringLength(llDumpList2String(textLines, "") + llDumpList2String(newLines, "")) > 254 - llGetListLength(textLines) * 2 - llGetListLength(newLines))
        {
            // Remove top line
            textLines = llDeleteSubList(textLines, 0, -llGetListLength(textLines));
        }
    }

    // Dump old test to string for rendering
    string lastText = llDumpList2String(textLines, "\n") + "\n";

    integer stringLength = llStringLength(text);
    integer i;
    if(textAnimSpeed < .09) llLoopSound("c614e951-e113-556a-67aa-caa6161197d9", textVolume);
    for(i = 0; i < stringLength; i++)
    {
        displayText = lastText + llGetSubString(text, 0, i);
        llSetLinkPrimitiveParamsFast(link, [PRIM_TEXT, displayText + "_", textColor, 1]);

        if(textAnimSpeed > .09) llPlaySound("c614e951-e113-556a-67aa-caa6161197d9", textVolume);
        if(textAnimSpeed > 0)
            llSleep(llFrand(textAnimSpeed));
    }
    llSetLinkPrimitiveParamsFast(link, [PRIM_TEXT, displayText, textColor, 1]);
    llStopSound();
    textLines = llParseString2List(displayText, ["\n"], [""]);
}











// string lastText;
// float text_volume = .25;
// vector text_color = <1,1,1>;
// float text_speed = .02;

// textTypeAnim(integer link, integer add, string text)
// {
//     string displayText;
//     if(!add) lastText = "";
//     else lastText += "\n";
//     integer stringLength = llStringLength(text);
//     integer i;
//     if(text_speed < .09) llLoopSound("c614e951-e113-556a-67aa-caa6161197d9", text_volume);
//     for(i = 0; i < stringLength; i++)
//     {
//         displayText = lastText + llGetSubString(text, 0, i);
//         llSetLinkPrimitiveParamsFast(link, [PRIM_TEXT, displayText + "_", text_color, 1]);
//         if(text_speed > .09) llPlaySound("c614e951-e113-556a-67aa-caa6161197d9", text_volume);
//         if(text_speed > 0)
//             llSleep(llFrand(text_speed));
//     }
//     llSetLinkPrimitiveParamsFast(link, [PRIM_TEXT, displayText, text_color, 1]);
//     llStopSound();
//     lastText = displayText;
// }
