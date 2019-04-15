string randomLetter()
{
    string letters = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    integer random = (integer)llFrand(llStringLength(letters));
    return llGetSubString(letters,random,random);
}