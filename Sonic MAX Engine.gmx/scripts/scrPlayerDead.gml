    
    if(Action == ActionDead || Action == ActionOuttaHere)
        exit;
    
    audio_play_sound(argument0, 1, false);
    
    Action             = ActionDead;
    Speed              = 0;
    Angle              = 0;
    AngleMode          = 0;
    Gravity            = -7;
    CameraLock         = true;
    Camera.CameraLock  = true;

    if(PlayerId == 0){
        global.Lives   -= 1;
    
        if(global.GameTime >= 599000 || global.Lives == 0)
            instance_create(0, 0, objGameOver);
    }
