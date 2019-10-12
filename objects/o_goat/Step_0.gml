
var legs = keyboard_check_pressed( ord("D"));
var hand = keyboard_check_pressed( ord("K"));
var hold = keyboard_check( vk_space);

switch(state) {
    case STATES.WALK:
        x += spd;
        
        var col_grass = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, o_grass, false, true);
        if col_grass != noone {
            if col_grass.activated == false /*&& col_grass.x < x*/{
                msg_mf0;
                audio_play_sound(sfx_k, 0, false);
                //state = STATES.EAT;
                col_grass.activated = true;   
            }
        }
        
        var col_stone = collision_rectangle( bbox_left, bbox_top, bbox_right, bbox_bottom, o_stone, false, true);
        if col_stone != noone /*&& col_stone.x < x*/{
            if col_stone.activated == false {
                audio_play_sound(sfx_d, 0, false);
                //stcol_stoneate = STATES.EAT;
                col_stone.activated = true;
                msg_mf0;
            }
        }
        
        if legs && place_meeting( x, y + 1, o_solid) {
            KICK_mf0;  
            grv -= jump_streng;
        }
    break;
    
    case STATES.EAT:
        if hand {
            HAND_mf0;
            state = STATES.WALK;
            grv -= jump_streng / 2;
        }
    break;
} 


if !place_meeting( x, y + 1, o_solid) {
    grv += grv_streng;
} 

if place_meeting( x, y + grv, o_solid) {
    while !place_meeting( x, y + sign(grv), o_solid){
        y += sign(grv);
    }
    grv = 0;
}

y += grv;