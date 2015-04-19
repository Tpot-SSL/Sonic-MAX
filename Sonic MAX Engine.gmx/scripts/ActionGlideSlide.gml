
    if(Speed > 0)
        Speed = max(Speed-0.125, 0);
    else if(Speed < 0)
        Speed = min(Speed+0.125, 0);
        
    if((Speed == 0 || KeyA == false) && image_index == 0 && Animation == "GlideSlide"){
        Speed           = 0;
        image_index     = 1;
        Animation       = "GlideSlide2";
    } 
    if(Animation == "Idle"){
        Action  = ActionNormal;
    }
        
    if(global.Frame mod 5 == 0){
        instance_create(x, y+13, objSkidDust);
        audio_play_sound(sndGlideSlide, 1, false);
    }
