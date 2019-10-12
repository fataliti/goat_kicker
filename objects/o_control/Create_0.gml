
var kaz = "ә, ғ, қ, ң, ө, ұ, ү, h, і";

#macro wi 960
#macro he 540
#macro spd 20
#macro sec room_speed


camera = camera_create_view( 0, 0, room_width, room_height);
camx   = 0;
view_set_camera( 0, camera);


instance_create_depth( room_width / 2, 300, 0, o_goat);
instance_create_depth( 0, 0, 0, o_leg);
instance_create_depth( 0, 0, 0, o_hand);

var xx = 0;
while xx < room_width {
    instance_create_depth( xx, 300, 0, o_solid);
    xx += 32;
}



countdown = room_speed * 2;
//  паттерны
//  [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

var p_1_bass = [ 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
var p_1_clap = [ 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0];
var p_1 = [ p_1_bass, p_1_clap];

var p_2_bass = [ 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0];
var p_2_clap = [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0];
var p_2 = [ p_2_bass, p_2_clap];

var p_3_bass = [ 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0];
var p_3_clap = [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0];
var p_3 = [ p_3_bass, p_3_clap];

var p_4_bass = [ 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0];
var p_4_clap = [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0];
var p_4 = [ p_4_bass, p_4_clap];

var p_5_bass = [ 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0];
var p_5_clap = [ 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0];
var p_5 = [ p_5_bass, p_5_clap];

patterns = [ p_1, p_2, p_3, p_4, p_5, [[],[]] ];
pattern = 0;
pattern_r = 0;

part_time = 0;

part_wi     =  wi-60
part_ofs_x  =  30
part_max    =  120
part_part   = part_wi / 16;
part_tick   = part_max / 16;

l_inc = 40;
l0 = 350
l1 = 390
l2 = 430
l3 = 470


prop_spawn = true;