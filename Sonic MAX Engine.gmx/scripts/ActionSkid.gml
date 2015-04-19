
    if(Speed > 0 && KeyLeft)
        Speed = max(Speed-SkidRate, 0);
    else if(Speed < 0 && KeyRight)
        Speed = min(Speed+SkidRate, 0);
    else if(Speed != 0)
        Speed -= min(abs(Speed), Acceleration)*sign(Speed);
        
    if(Animation == "Walking" ||(KeyLeft && Speed < 0) ||(KeyRight && Speed > 0) || Speed == 0)
        Action = ActionNormal;   
    else if(KeyAPressed && Ground == true)
        scrPlayerJump();
        
    if(global.Frame mod 5 == 0)
        instance_create(x, y+13, objSkidDust);
