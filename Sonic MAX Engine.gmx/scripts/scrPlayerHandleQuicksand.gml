
    if(instance_exists(objParentQuicksand)){
        Obj = collision_rectangle(x-4, y-4, x+4, y+4, objParentQuicksand, true, true);
        if(Obj != noone && Gravity >= 0 && Ground == false){
            if(Gravity >= 0){
                Action = consActionQuicksand;
                Gravity = 0;
            }else{
               /* if(KeyAPressed){
                    scrPlayerJump();
                    Gravity = JumpRelease;
                } */  
            }
        }
    }