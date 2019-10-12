
#macro jump_streng 5
#macro grv_streng 0.4


//!#mfunc KICK {"args":[],"order":[]}
#macro KICK_mf0  o_leg.kick_stage = 1; audio_play_sound(sfx_d, 0, false); o_goat.grv -= jump_streng / 2;
//!#mfunc HAND {"args":[],"order":[]}
#macro HAND_mf0  o_hand.kick_stage = 1; audio_play_sound(sfx_k, 0, false);

//!#mfunc msg {"args":[],"order":[]}
#macro msg_mf0  show_debug_message("l");


grv = 0;


enum STATES {
    WALK,
    EAT, 
    STAND
}

state = STATES.WALK;