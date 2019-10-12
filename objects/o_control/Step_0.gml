
if place_free( camx + wi, 460) {
    instance_create_depth( camx + wi, 300, 0, o_solid);
}

camx += spd;
camera_set_view_pos( camera, camx, 0);

if camx > o_goat.x {
    show_message( "fail");
    game_restart();
}


with( o_prop_parent) {
    if x + sprite_get_width( sprite_index) < other.camx 
        instance_destroy();
}

if !countdown {
    
    part_time++;
    if part_time >= part_max {
        part_time = 0;
        pattern_r++;
        
        if pattern_r > 7 {
            pattern++;
            pattern_r = 0;
        }
    }
    
    if  pattern_r == 7 {
        
        var hold = keyboard_check( vk_space);
        
        
        if hold {
            if !audio_is_playing( sfx_hold) {
                var _snd = audio_play_sound( sfx_hold, 10, false);
                audio_sound_set_track_position( _snd, audio_sound_length( sfx_hold) * ( part_time / part_max));
            }
        } else {
            audio_stop_sound(sfx_hold);
        }
    }
    
} else {
    countdown--;
    
    if countdown <= 0 {
        audio_play_sound( snd_main, 10, false);
    }
}

if prop_spawn {

    var _get, _instr, _prop, _xp, _rep;
    
    _rep = 0;
    var a = 0;
    while a < array_length_1d(patterns) {
        _get = patterns[ a];
        for( var b = 0; b < array_length_1d( _get) b++) {
            _instr = _get[b];
            
            for( var c = 0; c < array_length_1d( _instr); c++) {
                if _instr[ c] == 1 {
                    
                    if b == 0 {
                        _prop = o_stone;
                    } else if b == 1 {
                        _prop = o_grass;
                    }
                    
                    _xp = wi / 2 + (spd * part_tick * 16 *_rep) - offset;
                    instance_create_depth(  _xp + spd * part_tick * (c + 1) + countdown * spd, 300, 0, _prop);
                }
            }
        }
        
        _rep++;
        if _rep mod 8 == 0 {
            a++;
        }
    }
    
    prop_spawn = false;
}