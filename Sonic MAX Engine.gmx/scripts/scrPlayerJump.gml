        var GSpeed;
        
        scrPlayerResetTrail();

        GSpeed          = Speed;
        Speed           = (global.Cos[Angle]*GSpeed)+(global.Sin[Angle]*(JumpHeight+(0.5*(CharacterId == consCharacterKnuckles))));
        Gravity         = -(global.Sin[Angle]*GSpeed)+(global.Cos[Angle]*(JumpHeight+(0.5*(CharacterId == consCharacterKnuckles))));
        Ground          = false;
        JumpVariable    = true;
        Action          = ActionJumping;
        
        audio_play_sound(sndPlayerJump, 1, false);
        
        Angle       = 0;
        FloorAngle  = 0;
        AngleMode   = 0;
        InputAlarm  = 0;
        JumpAnimSpeed = 1/max((5-abs(Speed)), 1);
