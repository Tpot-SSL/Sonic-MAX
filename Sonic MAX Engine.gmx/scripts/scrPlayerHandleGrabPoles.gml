
   // if(instance_exists(objParentGrabPole)){    
        _ObjectHandle = collision_rectangle(x-4, y-4, x+4, y+4, objParentGrabPole, false, true);
        if(_ObjectHandle != noone && Gravity > 0 && Action == ActionJumping){
            Action = ActionGrab;
            if(global.Haptic == true && objGlobal.OS == "Android"){
                immersion_play_effect(0);
            }
            y = _ObjectHandle.bbox_top+16;
            GrabHandle = _ObjectHandle;
            Speed = 0;
            Gravity = 0;
        }
    //}
