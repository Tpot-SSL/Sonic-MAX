    
    
    if(instance_exists(objCheckpoint)){
        _ObjectHandle = collision_rectangle(x-9, y-10, x+9, y+20, objCheckpoint, false, true)
        if(_ObjectHandle != noone){
            if(_ObjectHandle.Index == 0 && _ObjectHandle.AngleSpeed == 0)  {
                audio_play_sound(sndObjectCheckpoint, 1, false);
                global.Checkpoint       = true;
                global.CheckpointX      = _ObjectHandle.x;
                global.CheckpointY      = _ObjectHandle.y+28;
                global.CheckpointTime   = global.GameTime;
                _ObjectHandle.AngleSpeed = 12;
            }
        }
    }
