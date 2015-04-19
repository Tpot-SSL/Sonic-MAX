
    if(KeyDown == false)
        Action = ActionNormal;
        
    if(KeyAPressed == true && Spindash > 0){
        SpindashRev = 0;
        SpindashFrame = global.Frame;
        if(Spindash == 1){
            audio_stop_sound(sndPlayerSpindashRev);
            audio_play_sound(sndPlayerSpindashRev, 1, false);
        }else if(Spindash == 2){
            audio_stop_sound(sndPeelout);
            audio_play_sound(sndPeelout, 1, false);
        }
        Action      = ActionSpindash;
    }else if(KeyAPressed && Ground == true)
        scrPlayerJump();
