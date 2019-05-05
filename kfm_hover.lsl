#define MOVE_RANGE 0.05
#define MOVE_TIME 4
#define MAX_FRAMES 44

hover_init()
{
	list moves = [];
    integer i;
    float d = MOVE_TIME/ MAX_FRAMES;
    if(d < 1./9.)
        d = 1./9.;
    vector last;
    for(;i<=MAX_FRAMES; i++)
    {
        float t = llSin( (float)i/(float)MAX_FRAMES * TWO_PI );
        vector move = <0,0,t*MOVE_RANGE>;
        moves += [move - last, ZERO_ROTATION, d];
        last = move;
    }
    llSetKeyframedMotion(moves, [KFM_MODE, KFM_LOOP]);
}