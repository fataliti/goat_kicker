

draw_text( 5, 5, part_time);
draw_text( 5, 25, part_time/part_max);
draw_text( 5, 45, pattern_r);


draw_sprite( s_soundboard, 0, sound_ofs, panel_y );

draw_line_width( part_ofs_x, l1, part_ofs_x, l3, 2);
draw_line_width( part_ofs_x + part_wi, l1, part_ofs_x + part_wi, l3, 2);
draw_line_width( part_ofs_x, l1, part_ofs_x + part_wi, l1, 2);
draw_line_width( part_ofs_x, l2, part_ofs_x + part_wi, l2, 2);
draw_line_width( part_ofs_x, l3, part_ofs_x + part_wi, l3, 2);

var curs_x = part_ofs_x + part_wi * ( part_time/part_max);
draw_circle( curs_x, l0, 6, false);
draw_line_width(  part_ofs_x + part_wi * ( part_time/part_max), l0, part_ofs_x + part_wi * ( part_time/part_max), l3, 2);



//var letrs = [ "D" , "K"];
var _get, _instr, _xp;
_get = patterns[ pattern];

for( var b = 0; b < array_length_1d( _get) b++) {
    _instr = _get[b];
    for( var c = 0; c < array_length_1d(_instr); c++) {
        if _instr[ c] == 1 {
            
            _xp = part_ofs_x + part_part * c;
            
            if _xp + part_part > curs_x { 
                draw_circle( _xp, l1 + l_inc * b, 10, false);
                //draw_text_color(_xp, l1 + l_inc * b, letrs[ b], c_red, c_red, c_red, c_red, 1); 
                draw_sprite( s_keys, b, _xp, l1 + l_inc * b);
            }
        }
    }
}


var _pat_next;

if pattern_r <= 6 {
    _pat_next = pattern;
} else {
    _pat_next = pattern + 1;
}



draw_set_alpha( 0.25);
if _pat_next != 6 {
    _get = patterns[ _pat_next];    
    
    for( var b = 0; b < array_length_1d( _get) b++) {
        _instr = _get[b];
        for( var c = 0; c < array_length_1d(_instr); c++) {
            if _instr[ c] == 1 {
                
                _xp = part_ofs_x + part_part * c;
                
                if _xp  < curs_x { 
                    //draw_circle( _xp, l1 + l_inc * b, 10, false);
                    draw_sprite( s_keys, b, _xp, l1 + l_inc * b);
                }
            }
        }
    }
}
draw_set_alpha(1);


if pattern_r == 6 {
    draw_set_alpha(0.25);
    draw_sprite( s_space, 0, wi/2, l3);
    draw_set_alpha(1);
}

if pattern_r == 7 {
    draw_sprite( s_space, 0,wi/2, l3);
}


