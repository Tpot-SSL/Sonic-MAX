    Angle      = 0;
    AngleMode  = 0;

    var Player;
    Player1   = global.Player[0];


    switch(CharacterId){
        case consCharacterTails:        
            Dir       = point_direction(x, y, Player1.x, Player1.y);
            x        += lengthdir_x(3, Dir);
            y        += lengthdir_y(3, Dir);
        
            FlagsAllowXMovement = false;
            FlagsAllowYMovement = false;
            FlagsAllowObjectHandle = false;
        
            if(sign(lengthdir_x(1, Dir)) != 0)
                image_xscale = sign(lengthdir_x(1, Dir))
        
            Speed     = 0;
            Gravity   = 0;
            if(distance_to_object(Player1) < 5){
                Action      = ActionFly;
                FlagsAllowXMovement = true;
                FlagsAllowYMovement = true;
                FlagsAllowObjectHandle = true;
            }
            break;
        case consCharacterKnuckles:
            Dir       = point_direction(x, y, Player1.x, Player1.y);
            x        += lengthdir_x(3, Dir);
            y        += lengthdir_y(3, Dir);
        
            FlagsAllowXMovement = false;
            FlagsAllowYMovement = false;
            FlagsAllowObjectHandle = false;
        
            if(sign(lengthdir_x(1, Dir)) != 0)
                image_xscale = sign(lengthdir_x(1, Dir))
        
            Speed     = 0;
            Gravity   = 0;
            if(distance_to_object(Player1) < 5){
                Action      = ActionGlideFall;
                Speed       = 0.75;
                FlagsAllowXMovement = true;
                FlagsAllowYMovement = true;
                FlagsAllowObjectHandle = true;
            }
            break;
        default:
            Dir       = point_direction(x, y, Player1.x, Player1.y-4);
            //x        += lengthdir_x(max(min(abs(x-Player1.x)/8, 16), 4), Dir);
            x = Player1.x-20;
            y        -= 6;
            RespawnTimer++;
           // Speed     = max(min(Speed+lengthdir_x(0.09375, Dir), 4), -4);
            //Gravity   = -5; 

            FlagsAllowXMovement = false;
            FlagsAllowYMovement = false;
            FlagsAllowObjectHandle = false;
        
            if(sign(lengthdir_x(1, Dir)) != 0)
                image_xscale = sign(lengthdir_x(1, Dir))
        
            if(y <= Player1.y &&(distance_to_object(Player1) < 5 || y < Player1.y-40 || RespawnTimer > 60)){
                Action                  = ActionJumping;
                Gravity                 = -3;
                Speed                   = max(min(distance_to_object(Player1)/8, Player1.Speed, 16), 2);
                JumpVariable            = true;

                FlagsAllowXMovement     = true;
                FlagsAllowYMovement     = true;
                FlagsAllowObjectHandle  = true;
            }
            break;        
    }
    
