
    if(PlayerId > 0 || instance_exists(objMonitor) == false)
        exit;
    
    _ObjectHandle = collision_rectangle(x-11+Speed, y-16-(8*(Gravity < 0)), x+11+Speed, y+20, objMonitor, false, true);
    if(_ObjectHandle != noone){
        if((Action == ActionRolling || Action == ActionGlide) || (Action == ActionJumping && Gravity > 0)){
            if(KeyA || JumpVariable == false)
                Gravity *= -1;
            else
                Gravity = max(-4, Gravity*-1);
            
            InputAlarm = 0;

            with(_ObjectHandle){
                PlayerId = other.id;
                instance_destroy();
            }

        }else if(y > _ObjectHandle.y+8 && Gravity <= 0 && Action != ActionRolling){
            Gravity = 0;
            scrPushPlayerYDown();
            if(SKMonitors == false){
                with(_ObjectHandle){
                    Bump = true;
                    Gravity = -2;
                }
            }
        }else if( y <= _ObjectHandle.y+8 && Gravity <= 0 && Action != ActionRolling){
            scrPushPlayerX();
        }  
        
    }
