
    if(instance_exists(objCorkscrew)){
    // ---- Corkscrews --------------------------------------------------------------------  
        _ObjectHandle = collision_rectangle(x, y-5, x+(16*sign(Speed)), y+28, objCorkscrew, true, true);
        if(_ObjectHandle != noone &&(Action == consActionNormal || Action == consActionRolling || Action == consActionCorkscrew)
        &&(Ground || Action = consActionCorkscrew)&& abs(Speed) >= 6 &&(Angle >= 340 || Angle <= 20)){
            Action            = consActionCorkscrew;
            CorkscrewHandle   = _ObjectHandle;
        }
    }