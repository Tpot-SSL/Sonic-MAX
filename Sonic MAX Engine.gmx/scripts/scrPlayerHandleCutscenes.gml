
    if(instance_exists(objCutsceneModifier)){
        _ObjectHandle = collision_rectangle(x-10, y-10, x+10, y+10, objCutsceneModifier, false, true);
        if(_ObjectHandle != noone){
            
            if(_ObjectHandle.ModifySpeed == true)   
                Speed = _ObjectHandle.Speed;
    
            if(_ObjectHandle.ModifyGravity == true)   
                Gravity = _ObjectHandle.Gravity;
    
            if(_ObjectHandle.Script != -1)   
                script_execute(_ObjectHandle.Script);
    
            if(_ObjectHandle.Action != -1)   
                Action = _ObjectHandle.Action;  
    
            if(_ObjectHandle.Animation != "")   
                Animation = _ObjectHandle.Animation; 
    
            if(_ObjectHandle.Flip != 0)   
                image_xscale = _ObjectHandle.Flip;  
    
            if(_ObjectHandle.UseAnim != -1)  
                AllowAnim     = _ObjectHandle.UseAnim;
    
            if(_ObjectHandle.UseAction != -1)  
                AllowAction   = _ObjectHandle.UseAction; 
     
            if(_ObjectHandle.KeyL != -1)  
                KeyLeft  = _ObjectHandle.KeyL;
            if(_ObjectHandle.KeyR != -1)  
                KeyRight = _ObjectHandle.KeyR;
            if(_ObjectHandle.KeyU != -1)  
                KeyUp    = _ObjectHandle.KeyU;
            if(_ObjectHandle.KeyD != -1) 
                KeyDown  = _ObjectHandle.KeyD;
    
            if(_ObjectHandle.KeyA != -1) 
                KeyAPressed = _ObjectHandle.KeyA;
            if(_ObjectHandle.KeyAH != -1) 
                KeyA = _ObjectHandle.KeyAH;
            if(_ObjectHandle.KeyB != -1) 
                KeyBPressed = _ObjectHandle.KeyB;
            if(_ObjectHandle.KeyS != -1) 
                KeySPressed = _ObjectHandle.KeyS;
        }
    }
