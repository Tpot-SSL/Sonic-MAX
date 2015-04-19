
    FlyTimer    -= 1;
    GravityRate  = 0;

    InputAlarm = 0;    

    if(FlyTimer == 0 && Underwater == false){
        audio_stop_sound(sndFly); 
        audio_play_sound(sndFlyFall, 1, true);  
    }
    if(Gravity <= -1)
        FlyFlag = 1;  

    if(FlyFlag > 1){         

        Gravity -= 0.125;
        FlyFlag++;
        if(FlyFlag == 32)
            FlyFlag = 1;

       
    }else{
       if(FlyTimer > 0 && Gravity > -1 && KeyAPressed)
           FlyFlag = 2;
       Gravity += 0.03125;
    }
    
    TopSpeed = 6/(Underwater+1);   

    if(Ground){
        FlyTimer    = 480;
        FlyFlag     = 0;
        Action      = ActionNormal;
    }
