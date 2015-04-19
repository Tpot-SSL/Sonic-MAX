    
    if(Action == ActionHurt || Action == ActionDead || Invincibility > 0 || SuperForm || Action == ActionTransform)  
        exit;
    var Object;
    Object = argument0;
    if(Shield <= 0){    
        if(global.Rings > 0){
            Action      = ActionHurt;
            if(scrPlayerCollisionCSensor(objParentTerrain, 6) == false && scrPlayerCollisionDSensor(objParentTerrain, 6) == false)
                Gravity     = -4;
            else
                Gravity     = 0;
            Ground      = false;
            Speed       = 2*sign(x-Object.x);
            if(global.CPUPlayer[PlayerId] == false){                
                scrCreateRingLoss();
                if(argument1 != sndPlayerSpike)
                    audio_play_sound(sndRingLoss, 1, false);
                else
                    audio_play_sound(sndPlayerSpike, 1, false);
            }
        }else{
            scrPlayerDead(argument1);
        }
    }else{
        Shield      = 0;
        Action      = ActionHurt;
        if(argument1 != sndPlayerSpike)
            audio_play_sound(sndPlayerDead, 1, false);
        else
            audio_play_sound(sndPlayerSpike, 1, false);
        Gravity     = -4;
        Ground      = false;
        Speed       = 2*sign(x-Object.x);     
    }
