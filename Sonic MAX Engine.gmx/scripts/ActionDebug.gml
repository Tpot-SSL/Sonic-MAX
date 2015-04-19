
   // Animation = "";
    Object    = ds_list_find_value(DebugList, DebugPos);

    FlagsAllowXMovement = false;
    FlagsAllowYMovement = false;
    FlagsAllowObjectHandle = false;

   // Speed    = 0;
   // Gravity  = 0;


    sprite_index = object_get_sprite(Object);;
    image_index  = 0;
    if(Object == objRedSpring || Object == objYellowSpring || Object == objRedSpringCorner || Object == objYellowSpringCorner || Object == objSpike){
        image_angle = DebugType*90;
    }

    if(KeyLeft)
        Speed -= 0.5;
    else if(KeyRight)
        Speed += 0.5;
    else
        Speed = 0;

    if(KeyUp)
        Gravity -= 0.5;
    else if(KeyDown)
        Gravity += 0.5; 
    else
        Gravity = 0; 

    Speed = max(min(Speed, 7), -7);   
    Gravity = max(min(Gravity, 7), -7)

    x += Speed;
    y += Gravity;

    AnimationX = floor(x);
    AnimationY = floor(y);

    if(KeyCPressed){
        FlagsAllowXMovement = true;
        FlagsAllowYMovement = true;
        FlagsAllowObjectHandle = true;

        Action = ActionNormal;
        Ground = false;

        KeyCPressed = false;
        KeyC        = false;
    }  
    
    if(KeyAPressed){
        Ins = instance_create(x, y, Object);
        if(Object == objMonitor)
            Ins.Icon = DebugType;
        else if(Object == objRedSpring || Object == objYellowSpring || Object == objRedSpringCorner || Object == objYellowSpringCorner || Object == objSpike)
            Ins.image_angle = DebugType*90        
        else if(Object == objChaosEmerald)
            Ins.Id = DebugType+1;       
    }   
    if(KeyBPressed){
        DebugPos++;
        DebugType = 0;
        if(DebugPos >= ds_list_size(DebugList)){
            DebugPos = 0;
        }
    }
    
    if(KeySPressed){
        DebugType += 1;

        switch(Object){
            case objMonitor:
                if(DebugType > consMonitorLife)
                    DebugType = 0;
                break;
            case objRedSpring:
            case objRedSpringCorner:
            case objYellowSpring:
            case objYellowSpringCorner:  
            case objSpike:
                if(DebugType > 3)
                    DebugType = 0;
                break;
            case objChaosEmerald:
                if(DebugType > 6)
                    DebugType = 0;
                break;
            default:
                DebugType = 0;
        }     
    }   
