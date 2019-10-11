
if place_free( camx + wi, 460) {
    instance_create_depth( camx + wi, 500, 0, o_solid);
}

camx += spd;
camera_set_view_pos( camera, camx, 0);

if camx > o_goat.x {
    show_message( "fail");
    game_end();
}


with( o_prop_parent) {
    if x + sprite_get_width( sprite_index) < other.camx 
        instance_destroy();
}


