

    FlagsAllowXMovement = false;
    FlagsAllowYMovement = false;

    if(round(image_index) == 8 && Ground == true){
        Ground       = false;
        Gravity      = -5;
        Speed        = 1*image_xscale; 
        CameraLock   = true;
    }else if(Ground == false){
        y         += Gravity;
        x         += Speed;
        Gravity   += GravityRate;

        if(y >= view_yview[0]+view_hview[0]+128){
            global.Lives = 0;
            if(instance_exists(objGameOver) == false)
                instance_create(0, 0, objGameOver);
        }
        if(y >= view_yview[0]+view_hview[0]+256 && (audio_is_playing(sndGameOver) == false))
            scrGameOver();
        
    }
