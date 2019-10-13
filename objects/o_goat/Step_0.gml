
var legs = keyboard_check_pressed( ord("D"));
var hand = keyboard_check_pressed( ord("K"));
var hide = keyboard_check( vk_space);

sprite_index = s_goat_anim;

if o_control.pattern_r == 7 {
    
    if hide {
        image_alpha = 0.5;
    } else {
        image_alpha = 1;
    }
    
    if o_control.part_time > o_control.part_max * 0.25 {
        
        //show_debug_message (" no hide")
        
        if !hide && state == STATES.WALK {
            x -= spd / 2;
        }
    }
} else {
    image_alpha = 1;
}

switch(state) {
    case STATES.WALK:
        x += spd;
        
        
        var call_legs = false;
        var call_hand = false; 
        
        var _x = o_control.camx + wi;
        
        var _nir = instance_nearest( bbox_right, bbox_bottom, o_prop_sound);
        
        
        with( _nir) {
            if x < _x && !activated {
                if /*collision_rectangle(x-mascx, y-mascy, bbox_right, y, o_goat, false, true)*/ distance_to_object( other) < mascx {
                    if object_index == o_stone {
                        if legs {
                            activated = true;
                            KICK_mf0;
                        }
                        if place_meeting( x, y, other) && !activated {
                            //show_debug_message( "aaaaaa")
                            other.x -= spd / 2;
                            //other.state = STATES.STAND;
                            //msg();
                            //audio_play_sound( sfx_d, 10, false)
                            //activated = true;    
                        }
                        
                    } else if object_index == o_grass {
                        if hand {
                            activated = true;
                            HAND_mf0;
                        }
                        
                        if place_meeting( x, y, other) && !activated {
                            //show_debug_message( "aaaaaa")
                            other.x -= spd / 2;
                            //other.state = STATES.EAT;
                            //msg();
                            //audio_play_sound( sfx_k, 10, false);
                            //activated = true;
                        }
                    }
                }
            }
        }

    break;
    
    case STATES.EAT:

        x += spd / 2;
        if hand {
            HAND_mf0;
            state = STATES.WALK;
            
        }
    break;
    
    
    case STATES.STAND:
        x += spd / 2;
        
        if legs {
            KICK_mf0;
            state = STATES.WALK;
        }
    break;
} 


if !place_meeting( x, y + 1, o_solid) {
    grv += grv_streng;
    
    // if abs(grv) > 1 {
        // image_index = 0;
    // }
} 

if place_meeting( x, y + grv, o_solid) {
    while !place_meeting( x, y + sign(grv), o_solid){
        y += sign(grv);
    }
    grv = 0;
}

y += grv;
x += abs(grv);
if x > o_control.camx + wi/2 
    x = o_control.camx + wi/2;

