
var legs = keyboard_check_pressed( ord("D"));
var hand = keyboard_check_pressed( ord("K"));
var hide = keyboard_check( vk_space);

if o_control.pattern_r == 7 {
    
    if hide {
        image_alpha = 0.5;
    } else {
        image_alpha = 1;
    }
    
    if o_control.part_time > o_control.part_max * 0.25 {
        if !hide {
            x -= spd / 2;
        }
    }
} else {
    image_alpha = 1;
}


var _x = o_control.camx + wi;
var _nir = instance_nearest( bbox_right, bbox_bottom, o_prop_sound);

with( _nir) {
    if x < _x && !activated {
        if distance_to_object( other) < dist {
            if object_index == o_stone {
                if legs {
                    activated = true;
                    KICK_mf0;
                }
                if place_meeting( x, y, other) && !activated {
                    other.x -= spd / 2;
                }
                
            } else if object_index == o_grass {
                if hand {
                    activated = true;
                    HAND_mf0;
                }
                
                if place_meeting( x, y, other) && !activated {
                    other.x -= spd / 2;
                }
            }
        }
    }
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

x += spd;
y += grv;
x += abs(grv);
if x > o_control.camx + wi/2 
    x = o_control.camx + wi/2;

