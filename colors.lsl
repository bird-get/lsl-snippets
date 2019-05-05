#define COLOR_WHITE <1,1,1>
#define COLOR_BLACK <0,0,0>
#define COLOR_GRAY <.5,.5,.5>
#define COLOR_DARK_GRAY <.25,.25,.25>

#define COLOR_RED <1,0,0>
#define COLOR_GREEN <0,1,0>
#define COLOR_BLUE <0,0,1>
#define COLOR_YELLOW <1,1,0>
#define COLOR_ORANGE <1,.5,0>
#define COLOR_PINK <1,0,1>
#define COLOR_PURPLE <.5,0,1>
#define COLOR_BROWN <.5,.25,0>
#define COLOR_DARK_RED <.5,0,0>
#define COLOR_DARK_GREEN <0,.5,0>
#define COLOR_DARK_BLUE <0,0,.5>

#define COLOR_TAN <0.824, 0.706, 0.549>

vector string2color(string str)
{
    if(str == "red") return COLOR_RED;
    else if(str == "green") return COLOR_GREEN;
    else if(str == "blue") return COLOR_BLUE;
    else if(str == "yellow") return COLOR_YELLOW;
    else if(str == "orange") return COLOR_ORANGE;
    else if(str == "pink") return COLOR_PINK;
    else if(str == "purple") return COLOR_PURPLE;
    else if(str == "brown") return COLOR_BROWN;
    else if(str == "dark red") return COLOR_DARK_RED;
    else if(str == "dark green") return COLOR_DARK_GREEN;
    else if(str == "dark blue") return COLOR_DARK_BLUE;
    else if(str == "random") return <llFrand(.5) + .5), llFrand(.5) + .5), llFrand(.5) + .5));
}