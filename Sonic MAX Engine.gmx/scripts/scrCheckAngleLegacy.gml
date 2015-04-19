//-----------------------------------------------------------------
// -- scrCheckAngle();
//----------------------------------------------------------------- 
// - Finds angle based on terrain.
// - Arguments : 0
// - Returns   : Nothing 


   
    if(TerrainId == noone || instance_exists(TerrainId) == false){
        return Angle;    
        exit;    
    }
    var InitAngle     = scrWrapAngle(AngleMode*90); // Wraps anglemode.
    if(angle_difference(AngleMode*90, Angle) > 34)
        InitAngle -= 45;
    if(angle_difference(AngleMode*90, Angle) < -34)
        InitAngle += 45;

    InitAngle = scrWrapAngle(InitAngle);
    var BBoxL = TerrainId.bbox_left, BBoxR = TerrainId.bbox_right, BBoxT = TerrainId.bbox_top, BBoxB = TerrainId.bbox_bottom;    

    var TempTerrain;   


    var LeftX2    = x;
    
    var LeftX     = x-(AngleSensorWidth*Cos[InitAngle])+(Sin[InitAngle]*20);
    var LeftY     = y+(AngleSensorWidth*Sin[InitAngle])+(Cos[InitAngle]*20);
    var RightX2   = x;
    if(AngleMode == 0){
        var RightY2   = max(y, BBoxT-AngleSensorWidth);
        var LeftY2    = max(y, BBoxT-AngleSensorWidth);
    }else{
        var RightY2   = y;
        var LeftY2    = y;
    }
    var RightX    = x+(AngleSensorWidth*Cos[InitAngle])+(Sin[InitAngle]*20);
    var RightY    = y-(AngleSensorWidth*Sin[InitAngle])+(Cos[InitAngle]*20);
 
    var Height = AngleSensorHeight;
    if(Landed == false && AngleMode == 0)
        Height = 48;
        

    if(Layer == 0)
        instance_deactivate_object(objParentLayer1);
    else if(Layer == 1)
        instance_deactivate_object(objParentLayer0);
 
        if(AngleMode == 0){
            LeftX2 = scrClampValue(BBoxL+floor(((x-AngleSensorWidth)-BBoxL)/4)*4, BBoxL, (BBoxR-(AngleSensorWidth*2)));
            if(InitAngle == 45)
                 LeftY2 = scrClampValue(BBoxT+floor(((y+AngleSensorWidth)-BBoxT)/4)*4, (BBoxT), (BBoxB));
            else if(InitAngle == 315)
                 LeftY2 = scrClampValue(BBoxT+floor(((y-AngleSensorWidth)-BBoxT)/4)*4, BBoxT, (BBoxB));
        }else if(AngleMode == 1){
            LeftY2 = scrClampValue(BBoxT+floor(((y+AngleSensorWidth)-BBoxT)/4)*4, (BBoxT+(AngleSensorWidth*2)), (BBoxB));
            if(InitAngle == 45)
                LeftX2 = scrClampValue(BBoxL+floor(((x-AngleSensorWidth)-BBoxL)/4)*4, BBoxL, (BBoxR));
            if(InitAngle == 135)
                LeftX2 = scrClampValue(BBoxL+floor(((x+AngleSensorWidth)-BBoxL)/4)*4, (BBoxL) ,(BBoxR));    
        }else if(AngleMode == 2){
            LeftX2 = scrClampValue(BBoxL+floor(((x+AngleSensorWidth)-BBoxL)/4)*4, (BBoxL+(AngleSensorWidth*2)) ,(BBoxR));
            if(InitAngle == 135)
                 LeftY2 = scrClampValue(BBoxT+floor(((y+AngleSensorWidth)-BBoxT)/4)*4, (BBoxT), (BBoxB));
            else if(InitAngle == 225)
                 LeftY2 = scrClampValue(BBoxT+floor(((y-AngleSensorWidth)-BBoxT)/4)*4, BBoxT, (BBoxB));  
        }else if(AngleMode == 3){
            LeftY2 = scrClampValue(BBoxT+floor(((y-AngleSensorWidth)-BBoxT)/4)*4, BBoxT, (BBoxB-(AngleSensorWidth*2)));
            if(InitAngle == 315)
                LeftX2 = scrClampValue(BBoxL+floor(((x-AngleSensorWidth)-BBoxL)/4)*4, BBoxL, (BBoxR));
            if(InitAngle == 225)
                LeftX2 = scrClampValue(BBoxL+floor(((x+AngleSensorWidth)-BBoxL)/4)*4, (BBoxL) ,(BBoxR));
        }
    TempTerrain = noone;  
    repeat(Height){
        Object = collision_point(floor(LeftX2), floor(LeftY2), TerrainId, true, true);
        if((Object != noone &&(Object.Layer == Layer || Object.Layer == -1) &&(Object.Platform == false 
        ||(Object.Platform == true && AngleMode == 0)|| (Object.Platform == 2  && Action != ActionJumping)))){ 
            TempTerrain = Object;
            break;
        }else{
            LeftX2 += Sin[InitAngle];
            LeftY2 += Cos[InitAngle];       
        }
    }
    
    if(TempTerrain != noone){
        LeftX = LeftX2;
        LeftY = LeftY2;   
    }else{
        LeftX = x-(AngleSensorWidth*Cos[InitAngle])+(Sin[InitAngle]*20);
        LeftY = y+(AngleSensorWidth*Sin[InitAngle])+(Cos[InitAngle]*20);
    }

        if(AngleMode == 0){
            RightX2 = scrClampValue(BBoxL+floor(((x+AngleSensorWidth)-BBoxL)/4)*4, BBoxL+(AngleSensorWidth*2), BBoxR);
            if(InitAngle == 45)
                RightY2 = scrClampValue(BBoxT+floor(((y-AngleSensorWidth)-BBoxT)/4)*4, (BBoxT), BBoxB);
            else if(InitAngle == 315)
                RightY2 = scrClampValue(BBoxT+floor(((y+AngleSensorWidth)-BBoxT)/4)*4, BBoxT, (BBoxB));  
        }else if(AngleMode == 1){
            RightY2 = scrClampValue(BBoxT+floor(((y-AngleSensorWidth)-BBoxT)/4)*4, (BBoxT), BBoxB-(AngleSensorWidth*2));
            if(InitAngle == 45)
                 RightX2 = scrClampValue(BBoxL+floor(((x+AngleSensorWidth)-BBoxL)/4)*4, BBoxL, BBoxR);
            else if(InitAngle == 135)
                 RightX2 = scrClampValue(BBoxL+floor(((x-AngleSensorWidth)-BBoxL)/4)*4, (BBoxL), BBoxR);
        }else if(AngleMode == 2){
            RightX2 = scrClampValue(BBoxL+floor(((x-AngleSensorWidth)-BBoxL)/4)*4, (BBoxL), BBoxR-(AngleSensorWidth*2));
            if(InitAngle == 135)
                RightY2 = scrClampValue(BBoxT+floor(((y-AngleSensorWidth)-BBoxT)/4)*4, (BBoxT), BBoxB);
            else if(InitAngle == 225)
                RightY2 = scrClampValue(BBoxT+floor(((y+AngleSensorWidth)-BBoxT)/4)*4, BBoxT, (BBoxB));  
        }else if(AngleMode == 3){
            RightY2 = scrClampValue(BBoxT+floor(((y+AngleSensorWidth)-BBoxT)/4)*4, BBoxT+(AngleSensorWidth*2), (BBoxB));   
            if(InitAngle == 315)
                 RightX2 = scrClampValue(BBoxL+floor(((x+AngleSensorWidth)-BBoxL)/4)*4, BBoxL, BBoxR);
            else if(InitAngle == 225)
                 RightX2 = scrClampValue(BBoxL+floor(((x-AngleSensorWidth)-BBoxL)/4)*4, (BBoxL), BBoxR);
        }
    TempTerrain = noone;
    repeat(Height){
        Object = collision_point(floor(RightX2), floor(RightY2), TerrainId, true, true);
        if((Object != noone &&(Object.Layer == Layer || Object.Layer == -1) &&(Object.Platform == false 
        ||(Object.Platform == true  && AngleMode == 0)|| (Object.Platform == 2  && Action != ActionJumping)))){ 
            TempTerrain = Object;
            break;
        }else{
            RightX2 += Sin[InitAngle];
            RightY2 += Cos[InitAngle]; 
        }
    }
    
    if(TempTerrain != noone){
        RightX = RightX2;
        RightY = RightY2;   
    }else{
        RightX = x+(AngleSensorWidth*Cos[InitAngle])+(Sin[InitAngle]*20);
        RightY = y-(AngleSensorWidth*Sin[InitAngle])+(Cos[InitAngle]*20);
    }
    
    AnglePos[0,0] = LeftX;
    AnglePos[0,1] = LeftY;

    AnglePos[1,0] = RightX;
    AnglePos[1,1] = RightY;

    ReturnAngle = scrWrapAngle(round(point_direction(LeftX, LeftY, RightX, RightY)));   

    if(AngleBothSensors == false || abs(angle_difference(AngleMode*90, Angle)) > 10 ||((scrPlayerCollisionASensor360(objParentTerrain, 0) || Speed >= 0) 
    && (scrPlayerCollisionBSensor360(objParentTerrain, 0) || Speed <= 0)) || Landed == true)  
        return ReturnAngle;
    else
        return Angle;
