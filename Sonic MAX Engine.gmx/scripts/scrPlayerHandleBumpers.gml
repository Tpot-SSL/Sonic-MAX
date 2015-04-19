
    if(instance_exists(objBumper)){
        _ObjectHandle = collision_rectangle(x-15, y-15, x+15, y+15, objBumper, true, true)
        if(_ObjectHandle != noone){
            //BumperAngle = point_direction(_ObjectHandle.x, _ObjectHandle.y, x, y);
            X = x-_ObjectHandle.x;
            Y = y-_ObjectHandle.y;
            Magnitude = sqrt(X*X+Y*Y);
            X /= Magnitude;
            Y /= Magnitude;
            if(sign(X) == sign(Speed) && sign(Y) == sign(Gravity)){
                exit;
            }
            Speed    = X*7;
            Gravity  = Y*7;
            JumpVariable   = false;
            audio_play_sound(sndObjectBumper, 1, false);
            if(global.Haptic == true && objGlobal.OS == "Android"){
                immersion_play_effect(10);
            }
            if(ShieldAction == true)
                ShieldAction = false;
            if(Action != ActionJumping && Action != ActionRolling)
                Action = ActionNormal;
            if(_ObjectHandle.Bounce < 10){
                ScoreAdd        = instance_create(x, y, objScoreAdd)
                ScoreAdd.Score  = 10;
            }
            _ObjectHandle.Bounce += 1;
            _ObjectHandle.Index = 3;
        }
    }
    if(instance_exists(objHexBumper)){
        _ObjectHandle = collision_rectangle(x+4, y-10, x+15, y+10, objHexBumper, true, true)
        if(_ObjectHandle != noone){
            audio_play_sound(sndObjectBumper, 1, false);
            Speed    = global.Cos[180]*7;
            Gravity  = global.Sin[180]*-7;
            JumpVariable   = false;
            if(global.Haptic == true && objGlobal.OS == "Android"){
                immersion_play_effect(10);
            }

            if(ShieldAction == true)
                ShieldAction = false;

            _ObjectHandle.Bounce += 1;
            _ObjectHandle.Index = 3;
        }
         _ObjectHandle = collision_rectangle(x-4, y-10, x-15, y+10, objHexBumper, true, true)
        if(_ObjectHandle != noone){
            audio_play_sound(sndObjectBumper, 1, false);
            Speed    = global.Cos[0]*7;
            Gravity  = global.Sin[0]*-7;
            JumpVariable   = false;
            if(global.Haptic == true && objGlobal.OS == "Android"){
                immersion_play_effect(10);
            }

            _ObjectHandle.Bounce += 1;
            if(ShieldAction == true)
                ShieldAction = false;
            _ObjectHandle.Index = 3;
        }
         _ObjectHandle = collision_rectangle(x-7, y, x+7, y-18, objHexBumper, true, true)
        if(_ObjectHandle != noone){
            audio_play_sound(sndObjectBumper, 1, false);
            if(x < _ObjectHandle.x)
                BumperAngle = 245;
            else if(x > _ObjectHandle.x)
                BumperAngle = 295;
            else
                BumperAngle = 270;

            Speed    = global.Cos[BumperAngle]*7;
            Gravity  = global.Sin[BumperAngle]*-7;
            if(global.Haptic == true && objGlobal.OS == "Android"){
                immersion_play_effect(10);
            }

            if(ShieldAction == true)
                ShieldAction = false;
            JumpVariable   = false;

            _ObjectHandle.Bounce += 1;
            _ObjectHandle.Index = 3;
        }
         _ObjectHandle = collision_rectangle(x-7, y, x+7, y+18, objHexBumper, true, true)
        if(_ObjectHandle != noone){
            audio_play_sound(sndObjectBumper, 1, false);
            if(x < _ObjectHandle.x)
                BumperAngle = 115;
            else if(x > _ObjectHandle.x)
                BumperAngle = 65;
            else
                BumperAngle = 90;

            Speed    = global.Cos[BumperAngle]*7;
            Gravity  = global.Sin[BumperAngle]*-7;
            if(global.Haptic == true && objGlobal.OS == "Android"){
                immersion_play_effect(10);
            }
            if(ShieldAction == true)
                ShieldAction = false;
            JumpVariable   = false;

            _ObjectHandle.Bounce += 1;
            _ObjectHandle.Index = 3;
        }
    }
