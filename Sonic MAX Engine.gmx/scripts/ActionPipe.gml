    
    x += lengthdir_x(Speed, PipeDir);
    y += lengthdir_y(Speed, PipeDir);

    FlagsAllowXMovement = false;
    FlagsAllowYMovement = false;

    Pipe = collision_rectangle(x-8, y-8, x+8, y+8, objPipeDir, true, true);
    if(Pipe != noone){
        if(Pipe.image_angle != PipeDir){
            PipeDir     = Pipe.image_angle;

            x           = Pipe.x;
            y           = Pipe.y;

            audio_stop_sound(sndPlayerRoll);
            audio_play_sound(sndPlayerRoll, 1, false);
        }
    }

    Pipe = collision_rectangle(x-4, y-4, x+4, y+4, objPipeStart, true, true);
    if(Pipe != noone){
        if(Pipe.image_angle == 360-PipeDir){
            Gravity     = lengthdir_y(Speed*1.5, PipeDir);
            Speed       = lengthdir_x(Speed*1.5, PipeDir);

            FlagsAllowXMovement = true;
            FlagsAllowYMovement = true;

            Action      = ActionRolling;

            audio_stop_sound(sndPlayerRoll);
            audio_play_sound(sndPlayerRoll, 1, false);
        }
    }
