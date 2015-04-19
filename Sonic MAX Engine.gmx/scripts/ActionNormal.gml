    
    //-----------------------------------\\   
    //--- Action - Normal ---------------\\   
    //-----------------------------------\\
    // - Idle Action.
    

    // - Pushing -------
        if(Ground == true && Speed == 0 && AngleMode == 0 &&(scrPlayerCollisionRightSensor(objParentTerrain) == true && KeyRight))
                Action = ActionPush;    
        else if(Ground == true && Speed == 0 && AngleMode == 0 &&(scrPlayerCollisionLeftSensor(objParentTerrain) == true && KeyLeft))
                Action = ActionPush;

    // - Skidding -------
        else if(Ground == true && AngleMode == 0 && InputAlarm <= 0 && ((Speed >= 4.5 && KeyLeft) || (Speed <= -4.5 && KeyRight))){
            Action = ActionSkid;   
            audio_play_sound(sndPlayerSkid, 1, false);

    // - Turning around(Not enough speed to skid) -------
        }else if(Ground == true &&((Speed < 0 && KeyRight) || (Speed > 0 && KeyLeft))){
                Speed = max(abs(Speed)-SkidRate, 0)*sign(Speed);

    // - Jumping -------
        }else if(KeyAPressed && Ground == true){
            scrPlayerJump();
    
    // - Crouching -------

        }else if(Speed == 0 &&(KeyDown) && Ground){
            LookTimer   = 0;
            Action      = ActionCrouchDown;
    // - Spindash -------

        }else if(Delay == true && Speed == 0 && global.Player[0].Action == ActionSpindash && Ground){
            SpindashRev = 0;
            SpindashFrame = global.Frame;
            audio_stop_sound(sndPlayerSpindashRev);
            audio_play_sound(sndPlayerSpindashRev, 1, false);
            Action      = ActionSpindash;
    
    // - Looking up -------
        }else if(Speed == 0 && KeyUp && Ground){
            LookTimer   = 0;
            Action      = ActionLookUp;
    
        }
    // - Rolling -------
        else if(abs(Speed) > 0.5+(0.5*(Sonic3RollReq == true)) && KeyDownPressed && Ground &&(RollMoveLock == false ||(KeyRight == false && KeyLeft == false))){
            audio_play_sound(sndPlayerRoll, 1, false);
            scrPlayerResetTrail();
            Action = ActionRolling;

    // - Mid-air Curl Button -------
        }else if(KeyAPressed && Ground == false && UseCurlButton == true && Fan == false){
            Action = ActionJumping;
            JumpAnimSpeed  = 1/max((5-abs(Speed)), 1);
           // audio_play_sound(sndShieldInstashield, 1, false);
            JumpVariable = 0;
    
        }
