    i = 0;
    repeat(instance_number(objSpringParent)){
        _ObjectHandle = scrInstanceNthNearest(x, y, objSpringParent, i);
        if(distance_to_object(_ObjectHandle) > 256)
            break;
        if(_ObjectHandle != noone){
            if(_ObjectHandle.Corner == false){
                if(_ObjectHandle.image_angle == 0 && AngleMode == 0 &&(Gravity >= 0)&& scrPlayerCollisionRightSensor(_ObjectHandle) == false && scrPlayerCollisionLeftSensor(_ObjectHandle) == false 
                && (scrPlayerCollisionASensorObject(_ObjectHandle, 0) || scrPlayerCollisionBSensorObject(_ObjectHandle, 0))){
                    Ground    = false;
                    AngleMode = 0;
                    Angle     = 0;
                    Gravity   = -_ObjectHandle.Power;
                    if(global.Haptic == true && objGlobal.OS == "Android"){
                        immersion_play_effect(42);
                    }
                    Action    = ActionSpring;
                    _ObjectHandle.image_speed = 0.2;
                    audio_play_sound(sndObjectSpring, 1, false);
                }else if(_ObjectHandle.image_angle == 90 && scrPlayerCollisionRightSensor(_ObjectHandle) && Speed >= 0){
                    Speed     = -_ObjectHandle.Power;
                    image_xscale = -1;
                    _ObjectHandle.image_speed = 0.2;
                    if(global.Haptic == true && objGlobal.OS == "Android"){
                        immersion_play_effect(42);
                    }
                    InputAlarm = 16;
                    audio_play_sound(sndObjectSpring, 1, false);
                }else if(_ObjectHandle.image_angle == 180 && Gravity < 0 && (scrPlayerCollisionCSensor(_ObjectHandle, 2) || scrPlayerCollisionDSensor(_ObjectHandle, 2))){
                    Ground    = false;
                    AngleMode = 0;
                    Angle     = 0;
                    Gravity   = _ObjectHandle.Power;
                    if(global.Haptic == true && objGlobal.OS == "Android"){
                        immersion_play_effect(42);
                    }
                    Action    = ActionSpring;
                    _ObjectHandle.image_speed = 0.2;
                    audio_play_sound(sndObjectSpring, 1, false);
                }else if(_ObjectHandle.image_angle == 270 && scrPlayerCollisionLeftSensor(_ObjectHandle) && Speed <= 0){     
                    Speed     = _ObjectHandle.Power;
                    image_xscale = 1;
                    _ObjectHandle.image_speed = 0.2;
                    if(global.Haptic == true && objGlobal.OS == "Android"){
                        immersion_play_effect(42);
                    }
                    InputAlarm = 16;
                    audio_play_sound(sndObjectSpring, 1, false);
                }
            }else{
                if(_ObjectHandle.image_angle == 0 &&(scrPlayerCollisionASensor(_ObjectHandle, -14) || scrPlayerCollisionBSensor(_ObjectHandle, -14)) && Gravity >= 0){
                    Ground    = false;
                    Angle     = 0;
                    AngleMode = 0;
                    Speed     = _ObjectHandle.Power;
                    Gravity   = -_ObjectHandle.Power;
                    if(global.Haptic == true && objGlobal.OS == "Android"){
                        immersion_play_effect(42);
                    }
                    Action    = ActionSpring;
                    image_xscale = 1;
                    _ObjectHandle.image_speed = 0.2;
                    Animation = "Corkscrew";
                    audio_play_sound(sndObjectSpring, 1, false);
                }
                if(_ObjectHandle.image_angle == 90 && (scrPlayerCollisionASensor(_ObjectHandle, -14) || scrPlayerCollisionBSensor(_ObjectHandle, -14)) && Gravity >= 0){
                    Ground    = false;
                    Speed     = -_ObjectHandle.Power;
                    Gravity   = -_ObjectHandle.Power;
                    if(global.Haptic == true && objGlobal.OS == "Android"){
                        immersion_play_effect(42);
                    }
                    Angle     = 0;
                    AngleMode = 0;
                    Action    = ActionSpring;
                    image_xscale = -1;
                    _ObjectHandle.image_speed = 0.2;
                    Animation = "Corkscrew";
                    audio_play_sound(sndObjectSpring, 1, false);
                }
                if(_ObjectHandle.image_angle == 180 && (scrPlayerCollisionCSensor(_ObjectHandle, 5) || scrPlayerCollisionDSensor(_ObjectHandle, 5)) && Gravity <= 0 && Ground == false){
                    Ground    = false;
                    Speed     = -_ObjectHandle.Power;
                    Gravity   = _ObjectHandle.Power;
                    if(global.Haptic == true && objGlobal.OS == "Android"){
                        immersion_play_effect(42);
                    }
                    _ObjectHandle.image_speed = 0.2;
                    Angle     = 0;
                    AngleMode = 0;
                    Action    = ActionSpring;
                    image_xscale = -1;
                    Animation = "Corkscrew";
                    audio_play_sound(sndObjectSpring, 1, false);
                }
                if(_ObjectHandle.image_angle == 270 && (scrPlayerCollisionCSensor(_ObjectHandle, 5) || scrPlayerCollisionDSensor(_ObjectHandle, 5)) && Gravity <= 0 && Ground == false){     
                    Ground    = false;
                    Speed     = _ObjectHandle.Power;
                    Gravity   = _ObjectHandle.Power;
                    if(global.Haptic == true && objGlobal.OS == "Android"){
                        immersion_play_effect(42);
                    }
                    _ObjectHandle.image_speed = 0.2;
                    Angle     = 0;
                    AngleMode = 0;
                    Action    = ActionSpring;
                    image_xscale = 1;
                    Animation = "Corkscrew";
                    audio_play_sound(sndObjectSpring, 1, false);
                }
            }    
        } 
        i++;   
    }
