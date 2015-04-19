
    _ObjectHandle = collision_rectangle(x-5-(8*ForceRoll), y-10, x+5+(8*ForceRoll), y+10, objForceRoll, false, true);
    if(_ObjectHandle != noone){
        if(abs(angle_difference(_ObjectHandle.image_angle, point_direction(xprevious, yprevious, x, y))) < 45 && ForceRoll == false && Speed != 0){
            scrPlayerResetTrail();            
            Action       = ActionRolling;
            audio_play_sound(sndPlayerRoll, 1, false);
         //   Angle360Detection = true;
            ForceRoll    = true;
        }else if((abs(angle_difference(_ObjectHandle.image_angle, point_direction(xprevious, yprevious, x, y))) > 135 || Speed == 0) && ForceRoll == true){
            ForceRoll    = false;
        }                                       
    }

    // ---- Fans -----------
    Fan = false;
    with(objParentFan){
        if(Dir == consUp && Active == true && other.y > y-Length && other.y < (y-sprite_yoffset)+sprite_height && other.x > x-32 && other.x < x+32){
            Dist                  = point_distance(x, other.y, x, y);
            other.Gravity         = -(5-(3.5*(Dist/Length)));
            other.Ground          = false;
            other.Action          = ActionSpring;
            other.Animation       = "Corkscrew";
            other.Fan             = true;
        }else if(Dir == consLeft && other.x > x-Length && other.x < x+Length2
        && other.y > y-Height && other.y < (y)+sprite_height+16 && Active == true){
            Dist       = point_distance(other.x, y, x, y);
            other.x   -= 12-(12*(Dist/Length));
        }else if(Dir == consRight && other.x < (x)+Length && other.x > (x)-Length2
        && other.y > y-Height && other.y < (y)+sprite_height+16 && Active == true){
            Dist           = point_distance(other.x, y, x, y);
            other.x       += 12-(12*(Dist/Length));
        }
    }

    if(instance_exists(TerrainId) && Ground == true && TerrainId != noone && instance_exists(TerrainId)){
        _ObjectHandle  = collision_rectangle(x-9, y, x+9, y+21, objParentSlide, true, true);
        if(TerrainId == _ObjectHandle){
            if(_ObjectHandle.Constant == true)
                Speed = _ObjectHandle.Speed;
            else{
                Speed += _ObjectHandle.Speed;
                if(_ObjectHandle.MaxSpeed > 0){
                    Speed = min(abs(Speed), _ObjectHandle.MaxSpeed)*sign(Speed);
                }
            }
            Action = ActionSlide;
        }else if(Action == ActionSlide && _ObjectHandle == noone)
            Action = ActionNormal;
    }else if(Action == ActionSlide)
            Action = ActionNormal;
