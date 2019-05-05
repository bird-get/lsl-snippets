// Version 1.2

// LBA_REV			// (float) 		Revision.
// LBA_MIN_VEL		// (integer) 	Minimum velocity for collision based damage.
// LBA_MAX_HP		// (integer) 	Maximum amount of HP.
// LBA_AT_CAP 		// (integer) 	Maximum amount of damage you can take in one shot.
// LBA_MIN_DELAY	// (float) 		Minimum time between hits.
// LBA_LINK_TEXT 	// (integer) 	Where your HP text will be shown.
// LBA_VERBOSE		// Define if script has to be verbose.

// #define LBA_REV 1.2
// #define LBA_MIN_VEL 10
// #define LBA_MAX_HP 100
// #define LBA_AT_CAP 100
// #define LBA_MIN_DELAY .5
// #define LBA_LINK_TEXT 1
// #define LBA_VERBOSE 1

#define LBA_dealDamage(targetKey, damage) llRegionSayTo(targetKey, -500, (string)targetKey + ",damage," + (string)damage)

integer hp;
list hit;

LBA_init()
{
	llListen(-500, "", "", "");
    hp = LBA_MAX_HP;
    LBA_handleHP();
}

integer LBA_handleHP()
{
	// Returns FALSE when HP is depleted.
	integer t;
    string display = "[";
    for(t = 10; t != 0; --t)
    {
        if(hp > ((10-t) * LBA_MAX_HP/10)) display += "█";
        else display += "-";
    }
    display += "]";
    string info = "v." + llGetSubString((string)LBA_REV, 0, 3) + "," + (string)hp + "," + (string)LBA_MAX_HP + "," + (string)LBA_AT_CAP + "," + llGetSubString((string)LBA_MIN_DELAY, 0, 4);
    llSetLinkPrimitiveParamsFast(LBA_LINK_TEXT, [PRIM_TEXT, "[LBA] \n [" + (string)((integer)hp) + "/" + (string)((integer)LBA_MAX_HP) + "] \n " + display, <1.-(float)hp/LBA_MAX_HP, (float)hp/LBA_MAX_HP,0.>, 1, PRIM_LINK_TARGET, 1, PRIM_DESC, info]);
    if(hp > 0) return TRUE;
    else return FALSE;
}

integer LBA_handleCollisionDamage(integer n)
{
	// Returns FALSE when HP is depleted.
	integer i;
    for(i = 0; i < n; ++i)
    {
        if(llDetectedOwner(i) != llGetOwner())
        {
            integer type = llDetectedType(i);
            if(type & 0x2 && ~type & 0x1 && llVecMag(llDetectedVel(i)) > LBA_MIN_VEL)
            {
                if(hp > 0)
                {
                    --hp;
                    LBA_handleHP();
                }
                else return FALSE;
            }
        }
    }
    return TRUE;
}

LBA_handleListen(string name, key id, string msg)
{
	if(hp <= 0) return;
    list data = llParseString2List(msg, [",",":"], []);
    if(llGetListLength(data) > 1)
    {
        key target = llList2Key(data,0);
        if(target == llGetKey() || target == llGetOwner()) // Check whether we are the target.
        {
            key ownerKey = llGetOwnerKey(id); // The person who is shooting us.
            string ownerName = llKey2Name(ownerKey);
            if(ownerName == "") ownerName = (string)ownerKey;

            // TODO Try to find a better way to prevent spam. llGetTime() and lag might break. Building a list is laggy.  
            float time = llGetTime();
            integer loc = llListFindList(hit, [ownerKey]);

            if(loc != -1) //Checks to see if you're being spammed with damage commands by one person.
            {
                if((time - llList2Float(hit, loc + 1)) < LBA_MIN_DELAY) return;
                else hit = llListReplaceList(hit, [time], loc + 1, loc + 1);
            }
            else hit += [ownerKey, time];

            msg = llToLower(msg);
            string message = "\n Hit by: " + ownerName + "; by object: " + name;
            if(llList2String(data, 1) == "damage")
            {
                float v2 = llList2Float(data, 2);
                integer damage;
                if(v2 < 1 && v2 > 0 || v2 < 0 && v2 > - 1) damage = (integer)(v2 * LBA_MAX_HP); //Does a Percentage.
                else damage=(integer)v2; //Converts damage into a whole number.

                //AT
                #if LBA_AT_CAP > 0
                    if(damage > LBA_AT_CAP) damage = LBA_AT_CAP;
                #endif

                hp -= damage;

                #if LBA_VERBOSE > 0
	                message += "; Damage: " + (string)damage;
	                llOwnerSay(message);
	            #endif

                llRegionSay(-999, msg + " \\ " + name + " \\ " + (string)ownerKey);
            }
        }
        if(hp <= 0) hp=0;
        if(hp >= LBA_MAX_HP) hp = LBA_MAX_HP;
        LBA_handleHP();
    }
}

// default
// {
// 	on_rez(integer start_param)
//     {
//         if(start_param)
//         {
//             hp = start_param;
//             LBA_handleHP();
//         }
//     }

// 	state_entry()
// 	{
// 		LBA_init();
// 	}

// 	collision_start(integer n)
// 	{
// 		LBA_handleCollisionDamage(n);
// 	}

// 	listen(integer channel, string name, key id, string msg)
//     {
//     	LBA_handleListen(name, id, msg);
//     }
// }
