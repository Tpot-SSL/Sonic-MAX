 

    if(instance_exists(objParentHarmful)){   
        _ObjectHandle = collision_rectangle(x-12, y-15, x+12, y+20, objParentHarmful, false, true)
        if(_ObjectHandle != noone){
            if(_ObjectHandle.Type == consHarmfulTypeProjectile && Shield > 0){
                _ObjectHandle.Spd         = lengthdir_x(10, point_direction(x, y, _ObjectHandle.x, _ObjectHandle.y));
                _ObjectHandle.YSpd        = lengthdir_y(10, point_direction(x, y, _ObjectHandle.x, _ObjectHandle.y));
                _ObjectHandle.Gravity     = 0.21875;
                _ObjectHandle.mask_index  = sprMaskNull;
                exit;
            }
            if((_ObjectHandle.Type == consHarmfulTypeFire && Shield == consShieldFire)||(_ObjectHandle.Type == consHarmfulTypeElectric && Shield == consShieldElectric) || Shield == consShieldInstashield)
                exit;
    
            scrPlayerHurt(_ObjectHandle, sndPlayerDead);
        }
         _ObjectHandle = collision_rectangle(x-12, y-15, x+12, y+22, objParentHarmfulSolid, true, true)
        if(_ObjectHandle != noone){
            if((_ObjectHandle.Type == consHarmfulTypeFire && Shield == consShieldFire)||(_ObjectHandle.Type == consHarmfulTypeElectric && Shield == consShieldElectric) || Shield == consShieldInstashield)
                exit;
    
            scrPlayerHurt(_ObjectHandle, sndPlayerDead);
        }
    }
    