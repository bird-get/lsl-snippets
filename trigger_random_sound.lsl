triggerRandomSound(list sounds)
{
    llTriggerSound(llList2String(sounds, llRound(llFrand(llGetListLength(sounds) - 1))), 1.0);
}

triggerRandomSoundDouble(list sounds)
{
    string sound = llList2String(sounds, llRound(llFrand(llGetListLength(sounds) - 1)));
    llTriggerSound(sound, 1.0);
    llTriggerSound(sound, 1.0);
}

triggerRandomSoundTriple(list sounds)
{
    string sound = llList2String(sounds, llRound(llFrand(llGetListLength(sounds) - 1)));
    llTriggerSound(sound, 1.0);
    llTriggerSound(sound, 1.0);
    llTriggerSound(sound, 1.0);
}