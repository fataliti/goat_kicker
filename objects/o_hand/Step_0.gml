

ofsx = o_control.camx + wi + sprite_get_width( sprite_index) - o_goat.x ;
max_x = ofsx - sprite_get_width( sprite_index) - 128;

x = o_goat.x + ofsx - max_x * (cur_x / max_x) - 64;
y = init_y; //- max_y * (cur_x / max_x);

if kick_stage == 1 {
    if cur_x < max_x {
        cur_x += lerp( cur_x, max_x, 0.1);
    } else {
        kick_stage++;
    }
} else {
    if cur_x > 0  {
        cur_x *= 0.9;
    } else {
        cur_x = 0;
    }
}
