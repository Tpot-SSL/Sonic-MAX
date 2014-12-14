
    if(instance_exists(objChaosEmerald)){
        _ObjectHandle = collision_rectangle(x-7, y-8, x+7, y+10, instance_nearest(x, y, objChaosEmerald), false, true);
        if(_ObjectHandle != noone){
            audio_stop_sound(sndGetEmerald);
            audio_play_sound(sndGetEmerald, 1, false);
            
            with(_ObjectHandle){
                global.ChaosEmeralds += power(2, Id-1);
                instance_destroy();
            }
        }
    }