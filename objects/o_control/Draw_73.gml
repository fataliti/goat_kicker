
draw_sprite_tiled( s_layer_1, 0, 0, 0);

with( o_leg) {
    draw_self();
}

with( o_hand) {
    event_perform( ev_draw, 0);
}

with( o_prop_sound) {
    event_perform( ev_draw, 0);
}

with( o_goat) {
    draw_self();
}