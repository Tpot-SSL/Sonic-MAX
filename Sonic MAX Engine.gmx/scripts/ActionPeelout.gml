    if(KeyUp == false){
        if(global.Frame >= SpindashFrame+30){
            Speed = 12*image_xscale;
            audio_play_sound(sndPlayerSpindash, 1, false);
            scrPlayerResetTrail();
            Action = ActionNormal;
        }else{
            Action = ActionNormal;
        }
    }
