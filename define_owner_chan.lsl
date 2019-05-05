// This code will generate a channel which is always the same per key.
// Keep the difference between START and END at 5 or less than 5 for a number that is a valid channel.
// It is recommended to use a different START and END than used in this script to prevent others from getting the channel.

integer OWNER_CHANNEL;
#define START 27
#define END 32

#define defineOwnerChan() OWNER_CHANNEL = (integer)("0x"+llGetSubString(llGetOwner(), START, END));