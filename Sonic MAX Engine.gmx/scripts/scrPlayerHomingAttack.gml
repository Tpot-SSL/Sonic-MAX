

    HomingIns = scrPlayerFindHoming(objParentEnemy);
    audio_play_sound(sndPlayerSpindash, 1, false);

    if(HomingIns == noone || distance_to_object(HomingIns) > 100){
        Speed     = 10*image_xscale;
        Gravity   = 0;
        AirDash   = true;       
    }else{
        Dir       = point_direction(x, y, HomingIns.x, HomingIns.y);
        Speed     = lengthdir_x(10, Dir);
        Gravity   = lengthdir_y(10, Dir);
        Homing    = true;
    }

    Action        = ActionJumping;
    JumpVariable  = false;
    ShieldUsable  = false;
