
    if(KeyUp && scrPlayerCollisionCSensor(10, objParentTerrain) == false && scrPlayerCollisionDSensor(10, objParentTerrain) == false){
        y             -= 1;
        image_index   += 0.25;
    }else if(KeyDown){
        y             += 1;  
        image_index   += 0.25; 
    }
    
    if(KeyAPressed){
        Gravity         = -4;
        Speed           = -image_xscale*4;
        Ground          = false;
        JumpVariable    = true;
        Action          = ActionJumping;
        scrPlayerResetTrail();
        
        audio_play_sound(sndPlayerJump, 1, false);
        
        Angle       = 0;
        FloorAngle  = 0;
        AngleMode   = 0;
    }
    if(Ground == true)
        Action = ActionNormal;
    
    if(collision_line(x, y+4, x+(13*image_xscale), y+4, objParentTerrain, true, true) == false)
        Action = ActionNormal;
    
    if(scrPlayerCollisionRightSensor(objParentTerrain) == false && image_xscale == 1){
        if(collision_line(x, y-5, x+13, y-5, objParentTerrain, true, true) == noone){
            Action = ActionClimbRise;
            x += 15;
            y -= 15;
            Ground = true;
        }else
            Action = ActionNormal;
    }
    else if(scrPlayerCollisionLeftSensor(objParentTerrain) == false && image_xscale == -1){
        if(collision_line(x, y-5, x-13, y-5, objParentTerrain, true, true) == noone){
            Action = ActionClimbRise;
            x -= 15;
            y -= 15;
            Ground = true;
        }else
            Action = ActionNormal;
     }
    
