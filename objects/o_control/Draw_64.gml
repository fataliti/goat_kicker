
draw_text( 5, 5, part_time);
draw_text( 5, 25, part_time/part_max);
draw_text( 5, 45, pattern_r);

draw_line_width( part_ofs_x, l1, part_ofs_x + part_wi, l1, 2);
draw_line_width( part_ofs_x, l2, part_ofs_x + part_wi, l2, 2);
draw_line_width( part_ofs_x, l3, part_ofs_x + part_wi, l3, 2);

draw_circle( part_ofs_x + part_wi * ( part_time/part_max), l0, 6, false);
draw_line_width(  part_ofs_x + part_wi * ( part_time/part_max), l0, part_ofs_x + part_wi * ( part_time/part_max), l3, 2)


var _get, _instr;
_get = patterns[ pattern];
for( var b = 0; b < array_length_1d( _get) b++) {
    _instr = _get[b];
    for( var c = 0; c < array_length_1d(_instr); c++) {
        if _instr[ c] == 1 {
            draw_circle( part_ofs_x + part_part * c, l1 + l_inc * b, 10, false);
        }
    }
}


