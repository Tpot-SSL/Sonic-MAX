
    if(Ground == true)
        Action = ActionNormal;
    else if(KeyAPressed && Ground == false && UseCurlButton == true && Fan == false){
        Action = ActionJumping;
        JumpAnimSpeed  = 1/max((5-abs(Speed)), 1);
        //audio_play_sound(sndShieldInstashield, 1, false);
        JumpVariable = 0;    
    }
