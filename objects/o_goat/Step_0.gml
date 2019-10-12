
var legs = keyboard_check_pressed( ord("D"));
var hand = keyboard_check_pressed( ord("K"));


switch(state) {
    case STATES.WALK:
        x += spd;
        
        
        var call_legs = false;
        var call_hand = false; 
        
        var _x = o_control.camx + wi;
        with( o_prop_sound) {
            if x < _x && !activated {
                if collision_rectangle(x-mascx, y-mascy, bbox_right, y, o_goat, false, true) {
                    if object_index == o_stone {
                        if legs {
                            activated = true;
                            KICK_mf0;
                        }
                        if place_meeting( x, y, o_goat) && !activated {
                            other.state = STATES.STAND;
                            activated = true;    
                        }
                        
                    } else if object_index == o_grass {
                        if hand {
                            activated = true;
                            HAND_mf0;
                        }
                        
                        if place_meeting( x, y, o_goat) && !activated {
                            other.state = STATES.EAT;
                            activated = true;
                        }
                    }
                }
            }
        }

    break;
    
    case STATES.EAT:
        if hand {
            HAND_mf0;
            state = STATES.WALK;
            
        }
    break;
    
    
    case STATES.STAND:
        
        if legs {
            KICK_mf0;
            state = STATES.WALK;
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
x += abs(grv);
if x > o_control.camx + wi/2 
    x = o_control.camx + wi/2;

