
    XStart   = CorkscrewHandle.x;
    XEnd     = CorkscrewHandle.x+384;
    Width    = 384; 
    Height   = 70;
    FlagsAllowY = false;
    Gravity     = 0;
    Ground      = true;
    if(x > XStart && x < XEnd){
        y = CorkscrewHandle.y-20-(Height/2)+((Height/2)*dcos(scrWrapAngle((((x-XStart)/Width)*(360)))));
    }else if(Speed > 0 && x >= XEnd){
        FlagsAllowY  = true;
        if(Animation == "Rolling")
            Action       = ActionRolling;
        else
            Action       = ActionNormal;
    }else if(Speed < 0 && x <= XStart){
        FlagsAllowY  = true;
         if(Animation == "Rolling")
            Action       = ActionRolling;
        else
            Action       = ActionNormal;
    }
    if(Animation != "Rolling"){
        image_index = ((image_number-1)*((x-XStart)/(Width)));
         if(((Speed >= 4.5 && KeyLeft) || (Speed <= -4.5 && KeyRight))){
            Action = ActionSkid;   
            audio_play_sound(sndPlayerSkid, 1, false);
        }
    }else{
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
    }
    if(abs(Speed) < 6){
        FlagsAllowY  = true;
         if(Animation == "Rolling")
            Action       = ActionRolling;
        else
            Action       = ActionNormal;
    }

    if(KeyAPressed)
        scrPlayerJump();
    
