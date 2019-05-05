// Please include "randomLetter.lsl"

string createSimplePassword(integer length)
{
    integer i;
    string password;
    do
    {
        password = password + randomLetter();
    }
    while(++i < length);
    return password;
}