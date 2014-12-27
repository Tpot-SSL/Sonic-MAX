//-----------------------------------------------------------------
// -- scrCheckGroundLevel();
//----------------------------------------------------------------- 
// - Finds ground level and object, and sets players position.
// - Arguments : 0
// - Returns   : Nothing

   // var InitAngle;   
    
    InitAngle = scrWrapAngle(AngleMode*90);
    
    var LeftX2    = floor(x)-(9*Cos[InitAngle]);
    var LeftY2    = floor(y)+(9*Sin[InitAngle]);
    var LeftX     = floor(x)+(20*Sin[InitAngle]);
    var LeftY     = floor(y)+(20*Cos[InitAngle]);

    var RightX2 = floor(x)+(9*Cos[InitAngle]);
    var RightY2 = floor(y)-(9*Sin[InitAngle]);
    var RightX  = floor(x)+(20*Sin[InitAngle]);
    var RightY  = floor(y)+(20*Cos[InitAngle]);

    var MiddleX2 = floor(x);
    var MiddleY2 = floor(y);
    var MiddleX  = floor(x)+(20*Sin[InitAngle]);
    var MiddleY  = floor(y)+(20*Cos[InitAngle]);

    Add = 0;
  
    
    if(Layer == 0)
        instance_deactivate_object(objParentLayer1);
    else if(Layer == 1)
        instance_deactivate_object(objParentLayer0);
    
    TerrainLeft     = noone;

    repeat(GroundSensorHeight+Add){
        TerrainLeft = collision_point(LeftX2, LeftY2, objParentTerrain, true, true);
        /*if(TerrainLeft != noone){
            TerrainLeft2 = collision_point(LeftX2-(Sin[InitAngle]), LeftY2-(Cos[InitAngle]), TerrainLeft, true, true)
            if(TerrainLeft2 != noone &&(TerrainLeft2.Layer == Layer || TerrainLeft2.Layer == -1) &&(TerrainLeft2.Platform == false 
            ||(TerrainLeft2.Platform == true && AngleMode == 0) || (Object.Platform == 2  && Action != consActionJumping))){
                TerrainLeft = noone;
                LeftX2 = x+20*Sin[InitAngle]-9*Cos[InitAngle];
                LeftY2 = y+20*Cos[InitAngle]+9*Sin[InitAngle]; 
                break;
            }
        }*/
        if(TerrainLeft != noone &&(TerrainLeft.Layer == Layer || TerrainLeft.Layer == -1) &&(TerrainLeft.Platform == false 
        ||(TerrainLeft.Platform == true && AngleMode == 0)|| (TerrainLeft.Platform == 2  && Action != consActionJumping))){ 
            LeftX  = LeftX2;
            LeftY  = LeftY2;
            break;
        }else{
            LeftX2 += Sin[InitAngle];
            LeftY2 += Cos[InitAngle];
            TerrainLeft = noone;
        }
    }

    TerrainRight     = noone;
    repeat(GroundSensorHeight+Add){
        TerrainRight = collision_point(RightX2, RightY2, objParentTerrain, true, true);
        /*if(TerrainRight != noone){
            TerrainRight2 = collision_point(RightX2-(Sin[InitAngle]), RightY2-(Cos[InitAngle]), TerrainRight, true, true)
            if(TerrainRight2 != noone &&(TerrainRight2.Layer == Layer || TerrainRight2.Layer == -1) &&(TerrainRight2.Platform == false 
            ||(TerrainRight2.Platform == true && AngleMode == 0) || (Object.Platform == 2  && Action != consActionJumping))){
                TerrainRight = noone;
                RightX2 = x+20*Sin[InitAngle];
                RightY2 = y+20*Cos[InitAngle];   
                break;
            }
        }*/
        if(TerrainRight != noone &&(TerrainRight.Layer == Layer || TerrainRight.Layer == -1) &&(TerrainRight.Platform == false 
        ||(TerrainRight.Platform == true && AngleMode == 0)|| (TerrainRight.Platform == 2  && Action != consActionJumping))){ 
            RightX  = RightX2;
            RightY  = RightY2;
            break;
        }else{
            RightX2 += Sin[InitAngle];
            RightY2 += Cos[InitAngle];
            TerrainRight = noone;
        }
    }
 
    TerrainMiddle   = noone;
    repeat(GroundSensorHeight){
        TerrainMiddle = collision_point(MiddleX2, MiddleY2, objParentTerrain, true, true)
        if(TerrainMiddle != noone){
            TerrainMiddle2 = collision_point(MiddleX2-(Sin[InitAngle]), MiddleY2-(Cos[InitAngle]), TerrainMiddle, true, true)
            if(TerrainMiddle2 != noone &&(TerrainMiddle2.Layer == Layer || TerrainMiddle2.Layer == -1) &&(TerrainMiddle2.Platform == false 
            ||(TerrainMiddle2.Platform == true && AngleMode == 0) || (Object.Platform == 2  && Action != consActionJumping))){
                TerrainMiddle = noone;
                MiddleX2 = x+20*Sin[InitAngle];
                MiddleY2 = y+20*Cos[InitAngle];   
                break;
            }
        }
        if(TerrainMiddle != noone &&(TerrainMiddle.Layer == Layer || TerrainMiddle.Layer == -1) &&(TerrainMiddle.Platform == false 
        ||(TerrainMiddle.Platform == true && AngleMode == 0)|| (TerrainMiddle.Platform == 2  && Action != consActionJumping))){ 
            MiddleX  = MiddleX2;
            MiddleY  = MiddleY2;
            break;
        }else{
            MiddleX2 += Sin[InitAngle];
            MiddleY2 += Cos[InitAngle];
            TerrainMiddle = noone;
        }
    }
      
    if(AngleMode == 0){ 
        if((MiddleY < LeftY && MiddleY < RightY)&& TerrainMiddle != noone){
                TerrainId = TerrainMiddle;                
        }else if((RightY < LeftY || x > TerrainLeft.bbox_right)&& TerrainRight != noone &&(x >= TerrainRight.bbox_left)){
                TerrainId = TerrainRight;                
        }else if((LeftY < RightY || x < TerrainRight.bbox_left) && TerrainLeft != noone && x <= TerrainLeft.bbox_right){
                TerrainId = TerrainLeft;               
        }else{
            if(TerrainMiddle != noone)
                TerrainId  = TerrainMiddle;  
            else if(TerrainRight != noone)
                TerrainId  = TerrainRight; 
            else if(TerrainLeft != noone)
                TerrainId  = TerrainLeft;         
        }
        /*if((Angle < 15 || Angle > 345)&&((scrPlayerCollisionBSensor360(objParentTerrain, 0) == false && scrPlayerCollisionASensor360(objParentTerrain, 0) == false && Speed > 0)
        ||(scrPlayerCollisionASensor360(objParentTerrain, 0) == false && scrPlayerCollisionBSensor360(objParentTerrain, 0) == false && Speed < 0))){
            y = min(LeftY-20, RightY-20, MiddleY-20);        
        }else{
            if(TerrainLeft != noone &&(LeftY <= RightY || TerrainRight == noone)&&(LeftY <= MiddleY || TerrainMiddle == noone))
                y = LeftY-20;
            else if(TerrainRight != noone &&(RightY <= LeftY || TerrainLeft == noone) &&(RightY <= MiddleY || TerrainMiddle == noone))
                y = RightY-20;
            else if(TerrainMiddle != noone && MiddleY <= RightY && MiddleY <= LeftY)
                y = MiddleY-20;
        }
        */
        if(TerrainRight != noone && TerrainLeft != noone && TerrainMiddle != noone){          
            y = min(LeftY, RightY, MiddleY)-20;              
        }else if(TerrainLeft == noone &&(TerrainMiddle != noone || abs((RightY-20)-floor(y)) <= 1) && TerrainRight != noone){
            y = RightY-20;  
            //Angle = scrWrapAngle(round(point_direction(MiddleX, MiddleY, RightX, RightY)))
        }else if(TerrainRight == noone &&(TerrainMiddle != noone || abs((LeftY-20)-floor(y)) <= 1) && TerrainLeft != noone){

           // Angle = scrWrapAngle(round(point_direction(LeftX, LeftY, MiddleX, MiddleY)))
            y = LeftY-20; 
        }
    }else if(AngleMode == 1){
        if((MiddleX < LeftX && MiddleX < RightX)&& TerrainMiddle != noone){
                TerrainId = TerrainMiddle;                
        }else if((RightX < LeftX || y < TerrainLeft.bbox_top)&& TerrainRight != noone && y <= TerrainRight.bbox_bottom){
                TerrainId = TerrainRight;                
        }else if((LeftX < RightX || y > TerrainRight.bbox_bottom) && TerrainLeft != noone &&(y >= TerrainLeft.bbox_top)){
                TerrainId = TerrainLeft;               
        }else{
            if(TerrainMiddle != noone)
                TerrainId  = TerrainMiddle;  
            else if(TerrainRight != noone)
                TerrainId  = TerrainRight; 
            else if(TerrainLeft != noone)
                TerrainId  = TerrainLeft;         
        }
        if(TerrainRight != noone && TerrainLeft != noone && TerrainMiddle != noone){          
            x = min(LeftX, RightX, MiddleX)-20;              
        }else if(TerrainLeft == noone && (TerrainMiddle != noone || abs((RightX-20)-x) <= 1))
            x = RightX-20;  
        else if(TerrainRight == noone && (TerrainMiddle != noone || abs((LeftX-20)-x) <= 1))
            x = LeftX-20;             
        
    }else if(AngleMode == 2){
        if((MiddleY > LeftY && MiddleY > RightY)&& TerrainMiddle != noone){
                TerrainId = TerrainMiddle;                
        }else if((RightY > LeftY || x < TerrainLeft.bbox_left)&& TerrainRight != noone && x <= TerrainRight.bbox_right){
                TerrainId = TerrainRight;                
        }else if((LeftY > RightY || x > TerrainRight.bbox_right) && TerrainLeft != noone && x >= TerrainLeft.bbox_left){
                TerrainId = TerrainLeft;               
        }else{
            if(TerrainMiddle != noone)
                TerrainId  = TerrainMiddle;  
            else if(TerrainRight != noone)
                TerrainId  = TerrainRight; 
            else if(TerrainLeft != noone)
                TerrainId  = TerrainLeft;         
        }               
        
        if(TerrainRight != noone && TerrainLeft != noone && TerrainMiddle != noone){          
            y = max(LeftY, RightY, MiddleY)+20;              
        }else if(TerrainLeft == noone &&(TerrainMiddle != noone || abs((RightY-20)-y) < 2))
            y = RightY+20;  
        else if(TerrainRight == noone &&(TerrainMiddle != noone || abs((LeftY-20)-y) < 2))
            y = LeftY+20; 
    }else if(AngleMode == 3){
        if((MiddleX > LeftX && MiddleX > RightX)&& TerrainMiddle != noone){
                TerrainId = TerrainMiddle;                
        }else if((RightX > LeftX || y > TerrainLeft.bbox_bottom)&& TerrainRight != noone && y >= TerrainRight.bbox_top){
                TerrainId = TerrainRight;                
        }else if((LeftX > RightX || y < TerrainRight.bbox_top) && TerrainLeft != noone && y <= TerrainLeft.bbox_bottom){
                TerrainId = TerrainLeft;               
        }else{
            if(TerrainMiddle != noone)
                TerrainId  = TerrainMiddle;  
            else if(TerrainRight != noone)
                TerrainId  = TerrainRight; 
            else if(TerrainLeft != noone)
                TerrainId  = TerrainLeft;         
        }
        if(TerrainRight != noone && TerrainLeft != noone && TerrainMiddle != noone){          
            x = max(LeftX, RightX, MiddleX)+20;              
        }else if(TerrainLeft == noone && (TerrainMiddle != noone || abs((RightX-20)-x) < 2))
            x = RightX+20;  
        else if(TerrainRight == noone && (TerrainMiddle != noone || abs((LeftX-20)-x) < 2))
            x = LeftX+20; 
    }

    AnglePos[2,0] = LeftX;
    AnglePos[2,1] = LeftY;

    AnglePos[3,0] = RightX;
    AnglePos[3,1] = RightY;
