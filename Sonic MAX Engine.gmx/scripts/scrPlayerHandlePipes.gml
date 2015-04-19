    
    if(instance_exists(objPipeStart) == false)
        exit;

    Pipe = collision_rectangle(x-4, y-4, x+4, y+4, objPipeStart, true, true);
    if(Pipe != noone && Action != ActionPipe){
        if(sign(Pipe.image_angle) == sign(Gravity) || Gravity == 0){
            PipeDir     = Pipe.image_angle;
            x           = Pipe.x;
            y           = Pipe.y;
            Ground      = false;
            Angle       = 0;
            Action      = ActionPipe;
            Speed       = 7;
            audio_play_sound(sndPlayerRoll, 1, false);
        }
    }
