

    if(KeyA == false && Gravity < JumpRelease && JumpVariable == true)
        Gravity = JumpRelease;

    scrPlayerHandleMonitors();
    if(Ground == true){
        ShieldUsable = true;
        ShieldAction = false;
        Action = ActionNormal;
    }else if(KeyAPressed && ShieldUsable == true && Shield != 1 && CharacterId == consCharacterSonic &&((SuperForm == false)|| UseShieldSuper == true)){
        ShieldAnimation = 0;        
        switch(Shield){
            case 0:
                if(SuperForm == false){
                    audio_play_sound(sndShieldInstashield, 1, false);

                    if(JumpVariable < 0)
                        JumpVariable = 0;
                        
                    Shield          = consShieldInstashield;
                    //show_debug_message(Shield);
                }
                break;
            case 2:
                ShieldAction = true;
                Speed        = 0;
                Gravity      = 8;
                audio_play_sound(sndShieldActionBubble, 1, false);
                break;
            case 3:
                Gravity = -5.5;
                JumpVariable = false;
                Spark       = instance_create(x, y-10, objShieldSpark);
                Spark.Dir   = 0;
                Spark       = instance_create(x, y-10, objShieldSpark);
                Spark.Dir   = 180;
                Spark       = instance_create(x, y-10, objShieldSpark);
                Spark.Dir   = 225;
                Spark       = instance_create(x, y-10, objShieldSpark);
                Spark.Dir   = 315;
                audio_play_sound(sndShieldActionLightning, 1, false);
                break;
            case 4:
                ShieldAction = true;
                Speed        = 8*image_xscale;
                Gravity      = 0;
                audio_play_sound(sndShieldActionFire, 1, false);

                if(CameraLag == true){
                    objCamera.CameraLock   = true;
                    objCamera.alarm[0]     = 16;
                }
                break;
        }
        ShieldUsable = false;
    }else if(KeyAPressed && CharacterId == consCharacterTails){
        Action     = ActionFly;
        FlyFlag    = 2;
        if(Underwater == false)
            audio_play_sound(sndFly, 1, true);
    }else if(KeyAPressed && CharacterId == consCharacterKnuckles){
        Action = ActionGlide;
        if(Gravity < 0)
            Gravity = 0;
        Speed = 4*image_xscale;
        TurnSpeed = 0;
    }else if(KeySPressed && SuperForm == false && global.Rings >= 50 && global.ChaosEmeralds == 127 && CharacterId == consCharacterSonic 
    && UseSuperForms == true && DisableSuper == false){
        Speed       = 0;
        Gravity     = 0;
        Action      = ActionTransform;
        audio_play_sound(sndPlayerTransform, 1, false);
        audio_pause_sound(global.CurrentSong);
        audio_play_sound(sndSuperSonic, 1, true);
        global.CurrentSong = sndSuperSonic;
    }else if(KeySPressed && HyperForm == true && ShieldUsable == true){
        if(KeyUp == true){
            Speed       = 0;
            Gravity     = -8;
        }else{
            Speed       = 8*image_xscale;
            Gravity     = 0; 
        }
        ShieldUsable = false;
        JumpVariable = false;
        if(CameraLag == true){
            objCamera.CameraLock   = true;
            objCamera.alarm[0]     = 16;
        }
        audio_play_sound(sndPlayerSpindash, 1, false);
    }else if(KeyBPressed && CharacterId == consCharacterSonic && UseHoming == true && ShieldUsable == true)
        scrPlayerHomingAttack();
    
        

