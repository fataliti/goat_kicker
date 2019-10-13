

ofsx = o_goat.x - o_control.camx + 48;
max_x = ofsx - 172;

x = o_goat.x - ofsx + max_x * (cur_x / max_x);
y = init_y - max_y * (cur_x / max_x);

if kick_stage == 1 {
    if cur_x < max_x {
        cur_x += lerp( cur_x, max_x, 0.1);/*2 + cur_x * 0.15*/
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




