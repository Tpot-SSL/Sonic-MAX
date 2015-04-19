

    if(instance_exists(objParentBalloon) && Ground == false){
        _ObjectHandle = collision_rectangle(x-15, y-15, x+15, y+15, objParentBalloon, false, true);
        if(_ObjectHandle != noone){
            Gravity             = -7;
            JumpVariable        = false;
            scrPlayerResetTrail();
            Action              = ActionJumping;
            InputAlarm          = 0;
            Ground              = false;
            Angle               = 0;
            AngleMode           = 0;
            audio_play_sound(sndObjectBalloonPop, 1, false);
            with(_ObjectHandle)
                instance_destroy();
        }
    }
