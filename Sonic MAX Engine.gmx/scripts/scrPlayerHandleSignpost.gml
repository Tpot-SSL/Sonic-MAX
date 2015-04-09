    
    if(instance_exists(objSignpost) == false)
        exit;
        
    if(PlayerId == 0 && x >= objSignpost.x && objSignpost.Spin == false){
        audio_play_sound(sndSignpost, 1, false);
        objSignpost.Spin    = true;
        if(global.Haptic == true && objGlobal.OS == "Android"){
            immersion_play_effect(53);
        }
        with(Camera){
            x          = objSignpost.x;
            y          = objSignpost.y-20;
        }       
        CameraLock               = true;
        DisableSuper             = true;
        objController.CameraMinX = objSignpost.x-(view_wview[PlayerId]/2);
        instance_activate_object(objRing);
        objController.TimerCount = false;
        scrPlayerDeform();
    }   