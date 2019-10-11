
#macro wi 960
#macro he 540
#macro spd 2
#macro sec room_speed


//!#mfunc KICK {"args":[],"order":[]}
#macro KICK_mf0  o_leg.kick_stage = 1;

camera = camera_create_view( 0, 0, room_width, room_height);
camx   = 0;
view_set_camera( 0, camera);


instance_create_depth( room_width / 2, 499, 0, o_goat);
instance_create_depth( 0, 0, 0, o_leg);

var xx = 0;
while xx < room_width {
    instance_create_depth( xx, 500, 0, o_solid);
    xx += 32;
}


alarm[0] = 1;