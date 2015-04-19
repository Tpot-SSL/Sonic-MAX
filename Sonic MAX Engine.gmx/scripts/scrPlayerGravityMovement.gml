//-----------------------------------------------------------------
// -- scrPlayerGravityMovement();
//----------------------------------------------------------------- 
// - Controls Player's speed movement.
// - Arguments : 0
// - Returns   : Nothing
    

    var GravitySplit;
    var Object = noone;
    var Object2 = noone; 
    var Object3 = noone;
    if(Ground)
       exit;    
    // --------- Movement -------------------------
        Gravity = scrClampValue(Gravity, -128, 128)
        GravitySplit = floor(max(abs((Gravity*SpeedMultiplier))/2, 1))
        
            
        if(GravitySplit > 0)
            GravityValue = (Gravity*SpeedMultiplier)/(GravitySplit); // - Split speed so we can check collisions more precisely.
        else
            GravityValue = 0;
        GravityMax = Gravity*SpeedMultiplier;


        repeat(ceil(GravitySplit)){
            if(GravityMax == 0 && Gravity != 0)
                break;
            GravityValue = min(abs(GravityMax), abs(GravityValue))*sign(GravityValue);
            GravityMax = max(abs(GravityMax)-abs(GravityValue), 0)*sign(GravityValue);
            
            y += GravityValue; // - Increase y by speed and angle.
            scrPlayerHandleMonitors();
            scrPlayerHandleBreakableTerrain();
            scrPlayerWallCollision();
            
            scrPushPlayerX();
            scrPushPlayerYDown();
           
            if(Action == ActionJumping)
                Length = 10;
            else
                Length = 20;

            Object   = collision_line(x-9, y-Length, x-9, y, objParentTerrain, true, true);
            if((Object == noone ||(Object.Layer != Layer && Object.Layer != -1) ||(Object.Platform == true)))
                Object2  = collision_line(x+9, y-Length, x+9, y, objParentTerrain, true, true)
            if((Object2 == noone ||(Object2.Layer != Layer && Object2.Layer != -1) ||(Object2.Platform == true)))
                Object3  = collision_line(x, y-Length, x, y, objParentTerrain, true, true)
        
            if(Gravity >= 0 && (scrPlayerCollisionASensor(objParentTerrain, -16) 
            || scrPlayerCollisionBSensor(objParentTerrain, -16)) && Object == noone && Object2 == noone && Object3 == noone){
                if(ShieldAction == true && Shield == consShieldWater){
                    Gravity         = -7.5;
                    Ground          = false;
                    ShieldAction    = false;
                    ShieldUsable    = true;
                    scrPushPlayerY();
                    exit;
                }else{
                    scrPlayerResetTrail(); 
                    scrPushPlayerYLand();
                    Ground          = true;
                    EnemyChain      = 0;
                    Landed          = true;
                    Angle           = 0;
                    ShieldAction    = false;
                    AngleMode       = 0; 
                    scrCheckGroundLevel();
                    scrPushPlayerX();
                           
                    ShieldUsable    = true;    

                   
                    Angle = scrCheckAngle(); 
                    
                    if((Angle > 315 || Angle < 45))
                        AngleMode = 0;
                    else if((Angle > 45 && Angle < 135))
                        AngleMode = 1;
                    else if((Angle > 135 && Angle < 225))
                        AngleMode = 2;
                    else if((Angle > 225 && Angle < 315))
                        AngleMode = 3;
                    
                    if(abs(Speed) <= abs(Gravity) && Angle >= 22.5 && Angle <= 337.5 && TerrainId.object_index != objObjectSeesaw){
                        Speed   = -Gravity*sign(global.Sin[Angle]);
                        if(Angle < 45 || Angle > 315) 
                            Speed *= 0.5;
                    else if(TerrainId.object_index == objObjectSeesaw)
                        Angle = 0;
                    }if(abs(Speed) > 0.5 && KeyDown && Ground 
                    &&(RollMoveLock == false ||(KeyRight == false && KeyLeft == false))&&(Action == ActionNormal || Action == ActionJumping)){
                        scrPlayerResetTrail();
                        audio_play_sound(sndPlayerRoll, 1, false);
                        Action = ActionRolling;
                    }
                    if(Action == ActionHurt){
                        Invincibility        = 1;
                        InvincibilityTimer   = 120;
                        Action               = ActionNormal;
                    }
    
                    Gravity     = 0;   
                    GravityMax  = 0;
                    
                    exit;   
                }
            }

            if((Object != noone &&(Object.Layer == Layer || Object.Layer == -1) &&(Object.Platform != true)) || 
            (Object2 != noone &&(Object2.Layer == Layer || Object2.Layer == -1) &&(Object2.Platform != true)) ||
            (Object3 != noone &&(Object3.Layer == Layer || Object3.Layer == -1) &&(Object3.Platform != true))){                                    
                Y          = y;          
                AngleMode  = 2;
                
                if(Gravity < -0.5){
                    Angle     = 180;
                    Ground = true;
                    Landed          = true;
                    scrCheckGroundLevel();      
                    scrPushPlayerX(); 
                    scrPushPlayerY();     
                    Angle = scrCheckAngle(); 

                    if(((Angle > 90 && Angle <= 135)||(Angle >= 225 && Angle < 270)) && Gravity < -1.5 && TerrainId != noone && 
                    (Action == ActionNormal || Action == ActionJumping || Action == ActionSpring || Action == ActionRolling)){
                        scrPlayerResetTrail();
                        if((Angle > 45 && Angle < 135))
                            AngleMode = 1;
                        else if((Angle > 135 && Angle < 225))
                            AngleMode = 2;
                        else if((Angle > 225 && Angle < 315))
                            AngleMode = 3;
                        

                        Ground        = true;
                        Speed         = -Gravity*sign(Sin[Angle]);

                        Gravity       = 0; 
                        EnemyChain    = 0;
                        
                        GravityMax    = 0;

                        if(KeyDown == true &&(Action == ActionNormal || Action == ActionJumping)){
                            scrPlayerResetTrail();
                            audio_play_sound(sndPlayerRoll, 1, false);
                            Action = ActionRolling;
                        }
                        exit;
                    }else{
                        if(Gravity < 0)
                            Gravity = 0;
                            
                        TerrainId     = noone;
                        Ground        = false;
                        Angle         = 0;
                        Landed        = false;
                        AngleMode     = 0;

                        scrPushPlayerX();
                        
                        y             = Y;                        
                        scrPushPlayerYDown();
                        
                        TerrainId     = noone;
                        GravityMax    = 0;
                        exit;
                    }
                }else{
                    if(Gravity < 0)
                        Gravity = 0;
                    
                    TerrainId     = noone;
                    Ground        = false;
                    Angle         = 0;
                    Landed        = false;
                    AngleMode     = 0;

                    scrPushPlayerX();
                    scrPushPlayerYDown();
                    TerrainId    = noone;
                    GravityMax   = 0;
                    exit;
                }
            }
            
            scrPlayerHandleSprings();
            scrPlayerHandleMonitors();
        }
