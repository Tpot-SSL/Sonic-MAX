
    _ObjectHandle = collision_line(x, y+4, x+(14*image_xscale), y+4, objPushableTerrain, true, true);
    if((image_xscale == 1 &&(KeyRight == false || scrPlayerCollisionRightSensor(objParentTerrain) == false)) 
    || (image_xscale == -1 &&(KeyLeft == false || scrPlayerCollisionLeftSensor(objParentTerrain) == false)) || Ground == false){
        audio_stop_sound(sndPush1);
        Action = ActionNormal;
    }else if(KeyAPressed && Ground == true){
        audio_stop_sound(sndPush1);
        scrPlayerJump();
    }else if(_ObjectHandle != noone && PlayerId == 0 && _ObjectHandle.Ground == true){
        with(_ObjectHandle){
            if(other.image_xscale == 1 && collision_point(bbox_right, other.y+4, objParentTerrain, true, true) == noone && Ground == true){
                if(audio_is_playing(sndPush1) == false)
                    audio_play_sound(sndPush1, 1, true);
                x    += 0.25;
                other.x           = floor(x-11);
            }else if(other.image_xscale == -1 && collision_point(bbox_left-1, other.y+4, objParentTerrain, true, true) == noone && Ground == true){
                if(audio_is_playing(sndPush1) == false)
                    audio_play_sound(sndPush1, 1, true);
                x    -= 0.25;
                other.x           = floor(x+sprite_width+11);
            }else
                audio_stop_sound(sndPush1);
        }
    }
