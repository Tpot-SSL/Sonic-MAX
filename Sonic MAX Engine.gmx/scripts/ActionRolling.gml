


    if(Speed > 0)
        Speed = max(0, Speed-(Acceleration/2));
    else if(Speed < 0)
        Speed = min(0, Speed+(Acceleration/2));


    if(CharacterId != consCharacterTails && ForceRoll == false){     
        if(KeyLeft && Speed > 0)
           Speed = max(0, Speed-0.125);
         
        if(KeyRight && Speed < 0)
           Speed = min(0, Speed+0.125);
    }else{
        if(KeyLeft && Speed > 0)
           Speed = max(0, Speed-(SkidRate/4));
         
        if(KeyRight && Speed < 0)
           Speed = min(0, Speed+(SkidRate/4));
    }
     if(Ground == false && ForceRoll == false){
         Action         = ActionJumping;
         JumpAnimSpeed  = 1/max((5-abs(Speed)), 1);
         JumpVariable   = false;
         
     }
     if(KeyAPressed && Ground == true && ForceRoll == false){
        scrPlayerJump();
        JumpVariable = -1;
    }
    scrPlayerHandleMonitors();
     if(Speed == 0 && Ground){
         if(ForceRoll == false)
             Action = ActionNormal;
         else{
             audio_play_sound(sndPlayerRoll, 1, false);
             Speed = 4;
         }
     }
     if(FlagRollSpeedCap == true)
         Speed = min(abs(Speed), 16)*sign(Speed);
         
