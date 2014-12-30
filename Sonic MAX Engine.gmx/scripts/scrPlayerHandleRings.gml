    
    _ObjectHandle = collision_rectangle(x-9, y-18, x+9, y+20, objRing, false, true);
    if(_ObjectHandle != noone){
        if(_ObjectHandle.Alarm <= 0){
            with(_ObjectHandle){
                instance_create(x, y, objRingSparkle)
                instance_destroy();
            }
            if(global.Haptic == true && objGlobal.OS == "Android"){
                immersion_play_effect(24);
            }
            global.Rings += 1;
            if(global.Rings == global.RingsLife){
                global.Lives += 1;
                global.RingsLife += 100;
                audio_play_sound(sndLife, 1, false);
                if(audio_is_playing(sndInvincibility) == false)
                    audio_pause_sound(global.CurrentSong);
                else
                    audio_sound_gain(sndInvincibility, 0, 0);

                objController.LifeMusic = true;
            }
            if(Sounds3D_Ring == true)
                audio_play_sound_at(sndObjectRing, x, y, 0, 0, 30, 1, false, 1);
            else{
                if(RingStereoMix == true){
                    audio_stop_sound(sndObjectRing);
                    audio_play_sound(sndObjectRing, 1, false);
                }else{
                    switch(RingStereoMix){
                        case 0:
                            audio_stop_sound(sndRingLeft);
                            audio_play_sound(sndRingLeft, 1, false)
                            RingStereoMix = 0.5;
                            break;
                        case 0.5:
                            audio_stop_sound(sndRingRight);
                            audio_play_sound(sndRingRight, 1, false)
                            RingStereoMix = 0;
                            break;
                    }                       
                }
            }
        }
    }
