var _xscl, _wi, _of_scale;

_wi = sprite_get_width( sprite_index) ;

_xscl = cur_x / _wi;

if _xscl < 1
    _xscl = 1; 

var _x = x;
if _x < o_control.camx + wi
    _x = o_control.camx + wi;

draw_sprite_ext( sprite_index, 0, _x , y, _xscl, 1, 0, c_white, 1);


