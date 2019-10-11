

var jump = keyboard_check( ord("W"));
var kick = keyboard_check_pressed( ord("E"));

if !place_meeting( x, y + 1, o_solid) {
    grv += grv_streng;
} else {
    if jump {
        grv -= jump_streng;
        KICK_mf0;   
    }
}


var col_grass = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, o_grass, false, true);
if col_grass != noone {
    if col_grass.eated == false {
        state = STATE.EAT;
        col_grass.eated = true;   
    }
}


switch(state) {
    case STATE.WALK:
        x += spd;
    break;
    
    case STATE.EAT:
        if kick {
            KICK_mf0;
            state = STATE.WALK;
            grv -= jump_streng / 2;
        }
    break;
} 




if place_meeting( x, y + grv, o_solid) {
    while !place_meeting( x, y + sign(grv), o_solid){
        y += sign(grv);
    }
    grv = 0;
}

y += grv;