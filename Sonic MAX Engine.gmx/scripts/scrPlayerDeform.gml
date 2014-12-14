    
    if(SuperForm == false)
        exit;
    if(global.CurrentSong == sndSuperSonic){
        audio_stop_sound(sndSuperSonic);
        global.CurrentSong = ds_map_find_value(LvlMusic, room);
        if(audio_is_playing(sndLife) == false)
            audio_resume_sound(global.CurrentSong);
    }
    SuperForm        = false;
    HyperForm        = false;
    Deform           = true;
    CurrentPalette   = sprite_get_number(DeformPalette)-1;
    scrReloadAnimations(true);