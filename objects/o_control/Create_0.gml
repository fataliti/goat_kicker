
var kaz = "ә, ғ, қ, ң, ө, ұ, ү, h, і";

#macro wi 960
#macro he 540
#macro spd 8
#macro sec room_speed
#macro mascx 56
#macro mascy 96
#macro offset 10

#macro spawn_height 380

camera = camera_create_view( 0, 0, room_width, room_height);
camx   = 0;
view_set_camera( 0, camera);


instance_create_depth( room_width / 2, spawn_height, 0, o_goat);
instance_create_depth( 0, 0, 0, o_leg);
instance_create_depth( 0, 0, 0, o_hand);

var xx = 0;
while xx < room_width {
    instance_create_depth( xx, spawn_height, 0, o_solid);
    xx += 32;
}



countdown = room_speed * 3;
//  паттерны

var p_1_bass = [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var p_1_clap = [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0];
var p_1 = [ p_1_clap, p_1_bass, ];

var p_2_bass = [ 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0];
var p_2_clap = [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0];
var p_2 = [ p_2_clap, p_2_bass ];

var p_3_bass = [ 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0];
var p_3_clap = [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0];
var p_3 = [ p_3_clap, p_3_bass ];

var p_4_bass = [ 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0];
var p_4_clap = [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0];
var p_4 = [ p_4_clap, p_4_bass ];

var p_5_bass = [ 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0];
var p_5_clap = [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0];
var p_5 = [ p_5_clap, p_5_bass ];

patterns = [ p_1, p_2, p_3, p_4, p_5, [[],[]] ];
pattern = 0;
pattern_r = 0;

part_time = 0;


sound_ofs   =  (960 - 806) / 2;
part_wi     =  wi-(960-(806 - 44));
part_ofs_x  =  (960 - 806 + 44) / 2;
part_max    =  120;
part_part   = part_wi / 16;
part_tick   = part_max / 16;


panel_y = 400;
l_inc = 31;
l0 = 398;
l1 = l0 + 31 * 1;
l2 = l0 + 31 * 2;
l3 = l0 + 31 * 3;

prop_spawn = true;


_snd_hold = -1;