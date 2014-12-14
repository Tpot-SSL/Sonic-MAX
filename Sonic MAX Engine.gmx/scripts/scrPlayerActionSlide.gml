

    if(Ground == false)
        Action = consActionNormal;
    else if(KeyAPressed)
        scrPlayerJump();
    
    if(sign(Speed) != 0)
        image_xscale = sign(Speed);