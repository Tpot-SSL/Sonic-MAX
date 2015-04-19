
    if(Gravity > 0.5){
        Gravity = max(0.5, Gravity-0.125);   
    }else if(Gravity < 0.5){
        Gravity = min(0.5, Gravity+0.125);   
    }
        if(TurnSpeed == 0)
            Speed += 0.015625*image_xscale;
        
    if(image_xscale == 1 && KeyLeftPressed && TurnSpeed == 0){
        TurnSpeed = abs(Speed);
        if(image_xscale == 1){
            TurnCos = 0;
        }else{
            TurnCos = 180;
        }
    }else if(KeyRightPressed && TurnSpeed != 0 && TurnCos < 180){
        TurnCos = 360-TurnCos;
    }else if(image_xscale == -1 && KeyRightPressed && TurnSpeed == 0){
        TurnSpeed = abs(Speed);
        if(image_xscale == 1){
            TurnCos = 0;
        }else{
            TurnCos = 180;
        }
    }else if(KeyLeftPressed && TurnSpeed != 0 && TurnCos > 180){
        TurnCos = 360-TurnCos;
    }
    if(TurnSpeed != 0){
        TurnCos = floor(scrWrapAngle(TurnCos+2.8125));
        Speed = TurnSpeed*global.Cos[TurnCos]; 
        if(abs(global.Cos[TurnCos]) >= 0.7){
            image_index = 0;
        }else if(abs(global.Cos[TurnCos]) >= 0.3 && abs(global.Cos[TurnCos]) < 0.7){
            image_index = 1;
        }else if(abs(global.Cos[TurnCos]) >= 0 && abs(global.Cos[TurnCos]) < 0.3){
            image_index = 2;
        }
        if(TurnCos == 90){
            image_xscale *= -1;
        }else if(TurnCos == 270){
            image_xscale *= -1;
        }
        if(TurnCos == 0){
            TurnSpeed  = 0;
            image_index = 0;
        }else if(TurnCos == 180){
            TurnSpeed  = 0;
            image_index = 0;
        }
    }
    if(KeyA == false){
        Speed *= 0.25;
        Action = ActionGlideFall;
    }
    
    if(scrPlayerCollisionRightSensor(objParentTerrain) == true && Speed > 0 && scrPlayerCollisionBSensor(-16, objParentTerrain) == false){
        Action  = ActionClimb;
        audio_play_sound(sndClimb, 1, false);
        Speed   = 0;
        Gravity = 0;
    }else if(scrPlayerCollisionLeftSensor(objParentTerrain) == true && Speed < 0 && scrPlayerCollisionASensor(-16, objParentTerrain) == false){
        Action  = ActionClimb;
        audio_play_sound(sndClimb, 1, false);
        Speed   = 0;
        Gravity = 0;
    }
    
    if(Ground == true && AngleMode == 0){
        Action = ActionGlideSlide;
    }else if(Ground == true){
        Action = ActionNormal;
    }

    
