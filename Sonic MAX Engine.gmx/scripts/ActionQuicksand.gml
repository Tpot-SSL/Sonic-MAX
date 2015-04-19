
        if(Ground == false && Gravity >= 0){
            y += QuicksandGravity;
            Gravity = 0;  
        }else if(Ground == false){
            //y += Gravity;
            Gravity += GravityRate;
        }

        if(KeyAPressed){
            scrPlayerJump();
            Action    = ActionQuicksand;
            Gravity   = JumpRelease;
        }
        

        if(KeyLeft && Speed > -TopSpeed)
            Speed = max(Speed-0.02, -2);            
        else if(KeyRight && Speed < TopSpeed)
            Speed = min(Speed+0.02, 2);
    
        if(Speed > 0 && !KeyRight)
            Speed = max(Speed-0.04, 0);
            
        if(Speed < 0 && !KeyLeft)
            Speed = min(Speed+0.04, 0);
    
        if(place_meeting(x, y, objParentQuicksand) == false || Ground){
            Action = ActionJumping;
        }
