//-----------------------------------------------------------------
// -- scrPlayerSpeedMovement();
//----------------------------------------------------------------- 
// - Controls Player's speed movement.
// - Arguments : 0
// - Returns   : Nothing
    

    var SpeedSplit;
    
    // --------- Movement -------------------------
        Speed = scrClampValue(Speed, -128, 128)
        
        if(PlayerId == 0){               
            SplitSpeedAmount = 5;
        }else
            SplitSpeedAmount = 6;

        SpeedSplit = floor(max(abs((Speed*SpeedMultiplier)/SplitSpeedAmount), 1));
            
        if(SpeedSplit > 0)
            SpeedValue = (Speed*SpeedMultiplier)/(SpeedSplit); // - Split speed so we can check collisions more precisely.
        else
            SpeedValue = 0;
        SpeedMax = abs(Speed)*SpeedMultiplier;

        i = 2;
        repeat(ceil(SpeedSplit)){
            if(Speed == 0)
                SpeedValue = 0;

            SpeedValue = min(SpeedMax, abs(SpeedValue))*sign(SpeedValue);
            SpeedMax -= SpeedValue

            x += SpeedValue*Cos[Angle]; // - Increase x by speed and angle.
            y -= SpeedValue*Sin[Angle]; // - Increase y by speed and angle.

            scrPlayerHandleMonitors();
            if(CollisionPushMode == 0){
                scrPushPlayerX(); // - Push player out horizontally.
                scrPushPlayerY();
            }else
                scrPushPlayerSafe();
            

            scrPlayerWallCollision();
            
              
         // --------- Ground Collisions -------------
            if(Ground == true){
                TerrainIdLast = TerrainId;
                scrCheckGroundLevel(); // - Check ground position.      
                scrPushPlayerY();   
                AngleLast2  = AngleLast; 
                AngleLast   = Angle;         

                Angle = scrCheckAngle();          

                if((Angle > 315 || Angle < 45) && AngleMode != 0){
                    AngleModeLast  = AngleMode;
                    AngleMode      = 0;    
                    
                    if(Angle360Detection == false && AngleModeLast != 0 && (!scrPlayerCollisionASensor(objParentTerrain, 0) 
                    || !scrPlayerCollisionBSensor(objParentTerrain, 0)))
                        AngleMode = AngleModeLast;            
                    else if(AngleBothSensors == false || abs(angle_difference(AngleMode*90, Angle)) > 10 ||(scrPlayerCollisionASensor360(objParentTerrain, 0) 
                    && scrPlayerCollisionBSensor360(objParentTerrain, 0)))
                        Angle = scrCheckAngle(); 
                    
                }else if((Angle > 45 && Angle < 135) && AngleMode != 1){                            
                    AngleModeLast   = AngleMode;
                    AngleMode       = 1; 
                    if(Angle360Detection == false &&(!scrPlayerCollisionASensor(objParentTerrain, 0)) && AngleModeLast != 1){
                        AngleMode = AngleModeLast;  
                        Angle     = AngleLast;
                    }else if(Speed < 0 && AngleMode == 0 && AngleModeSwitchMode == 1){
                        x   -= 12;
                        x    = floor(x);
                    }else if((Speed > 0 || AngleMode != 0 || AngleModeSwitchMode == 1 ||(AngleLast < 45 && AngleLast > 0))){
                        AngleMode = 1;
                        if(AngleBothSensors == false || abs(angle_difference(AngleMode*90, Angle)) > 10 ||(scrPlayerCollisionASensor360(objParentTerrain, 0) 
                        && scrPlayerCollisionBSensor360(objParentTerrain, 0)))
                            Angle = scrCheckAngle(); 
                    }else{
                        AngleMode = AngleModeLast;  
                        Angle     = AngleLast;
                    }
                    
                }else if((Angle > 135 && Angle < 225) && AngleMode != 2){
                    AngleModeLast = AngleMode;
                    AngleMode = 2;
                    if(Angle360Detection == false && AngleModeLast != 2 &&(!scrPlayerCollisionASensor(objParentTerrain, 0) 
                    || !scrPlayerCollisionBSensor(objParentTerrain, 0)))
                        AngleMode = AngleModeLast;   
                    else if(AngleBothSensors == false || abs(angle_difference(AngleMode*90, Angle)) > 10 ||(scrPlayerCollisionASensor360(objParentTerrain, 0) 
                    && scrPlayerCollisionBSensor360(objParentTerrain, 0)))
                        Angle = scrCheckAngle(); 
                    
                }else if((Angle > 225 && Angle < 315) && AngleMode != 3){
                    AngleModeLast = AngleMode;
                    AngleMode = 3;
                    if(Angle360Detection == false && AngleModeLast != 3 && (!scrPlayerCollisionBSensor(objParentTerrain, 0) || !scrPlayerCollisionASensor(objParentTerrain, 0)))
                        AngleMode = AngleModeLast;            
                    else if(Speed > 0 && AngleMode == 0 && AngleModeSwitchMode == 1){
                        x   += 12;
                        x    = ceil(x);
                        y   += 12;
                    }else if(Speed < 0 || AngleMode != 0 || AngleModeSwitchMode == 1 || ((AngleLast > 315 && AngleLast < 360))){
                        AngleMode = 3; 
                        if(AngleBothSensors == false || abs(angle_difference(AngleMode*90, Angle)) > 10 ||(scrPlayerCollisionASensor360(objParentTerrain, 0) 
                        && scrPlayerCollisionBSensor360(objParentTerrain, 0)))
                            Angle = scrCheckAngle(); 
                    }else
                        AngleMode = AngleModeLast;                   
                }
            }

            scrPlayerWallCollision();

            if(Ground && ((!scrPlayerCollisionASensor(objParentTerrain, 0) 
            && !scrPlayerCollisionBSensor(objParentTerrain, 0))) && ForceRoll == false){               
                // --------- Fall off if not colliding with ground. ---------------
                if(TerrainId != noone && instance_exists(TerrainId) && TerrainId.Shape == consTerrainDefaultRamp &&(AngleMode == 1 || AngleMode == 3))
                    Angle = TerrainId.Angle;
                Gravity    = -Speed*Sin[Angle]; // - Set gravity based on current angle.
                Speed      = Speed*Cos[Angle];  // - Set speed based on current angle.
                if(Action == ActionRolling){
                    x             += (5*Sin[Angle]);
                    y             += (5*Cos[Angle]);
                }
                Angle      = 0;     // - Reset Angle.
                AngleMode  = 0;     // - Reset Angle Mode.
                Ground     = false; // - Reset Ground.
                TerrainId  = noone;
           }  
            i++;
        }
        
        if((Angle >= 45 && Angle <= 315) &&(abs(Speed) < 2.5) && ForceRoll == false){
            if(Angle < 90 || Angle > 270) {           
                InputAlarm  = 30;    
            }else{
                Gravity     = -Sin[Angle]*Speed;
                Speed       = Cos[Angle]*Speed;
                Ground      = false;
                Angle       = 0;
                TerrainId   = noone;
                AngleMode   = 0;
                InputAlarm  = 30;
            }
        }  
