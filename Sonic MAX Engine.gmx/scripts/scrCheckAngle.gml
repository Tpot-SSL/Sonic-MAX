//-----------------------------------------------------------------
// -- scrCheckAngle();
//----------------------------------------------------------------- 
// - Finds angle based on terrain.
// - Arguments : 0
// - Returns   : Nothing 


    var TempTerrain;   
    
    if(TerrainId == noone || instance_exists(TerrainId) == false){
        return Angle;    
        exit;    
    } 

    

    var BBoxL = TerrainId.bbox_left, BBoxR = TerrainId.bbox_right, BBoxT = TerrainId.bbox_top, BBoxB = TerrainId.bbox_bottom;
    var Index = ds_list_find_index(global.CollisionList, TerrainId.object_index);
    if(TerrainId.Angle != -1 && TerrainId.Shape != consTerrainOutCurve && TerrainId.Shape != consTerrainCurve && TerrainId.Shape != consTerrainDefaultRamp)
        return round(TerrainId.Angle);
    else if(TerrainId.Shape == consTerrainBlock){
        return AngleMode*90;
    }else if(TerrainId.Shape == consTerrainOutCurve){
        switch(TerrainId.Angle/90){
            case 0:
                return scrWrapAngle(point_direction(BBoxL, BBoxB, x, y)-90);
                break; 
            case 1:
                return scrWrapAngle(point_direction(BBoxL, BBoxT, x, y)-90);
                break;           
            case 2:
                return scrWrapAngle(point_direction(BBoxR, BBoxT, x, y)-90);
                break;
            case 3:
                return scrWrapAngle(point_direction(BBoxR, BBoxB, x, y)-90);
                break;
        }
    }else if(TerrainId.Shape == consTerrainCurve){
        switch(TerrainId.Angle/90){
            case 0:
                return scrWrapAngle(point_direction(BBoxL, BBoxT, x, y)+90);
                break; 
            case 1:
                return scrWrapAngle(point_direction(BBoxL, BBoxB, x, y)+90);
                break;           
            case 2:
                return scrWrapAngle(point_direction(BBoxR, BBoxB, x, y)+90);
                break;
            case 3:
                return scrWrapAngle(point_direction(BBoxR, BBoxT, x, y)+90);
                break;
        }
    }else if(TerrainId.Shape == consTerrainSlant){
        switch(AngleMode){
            case 0:
                return point_direction(BBoxL, BBoxB, BBoxR, BBoxT);
                break;
            case 1:
                return point_direction(BBoxR, BBoxB, BBoxL, BBoxT);
                break;
            case 2:
                return point_direction(BBoxR, BBoxT, BBoxL, BBoxB);
                break;
            case 3:
                return point_direction(BBoxL, BBoxT, BBoxR, BBoxB);
                break;
        }
    }else if(Index != -1){
        Width   = BBoxR-BBoxL;                  
        Height  = BBoxB-BBoxT;
        if(AngleMode == 0){
            X1 = max(min(round(((x-AngleSensorWidth)-BBoxL)), Width-(AngleSensorWidth*2)), 0);
            X2 = max(min(X1+(AngleSensorWidth*2), Width), (AngleSensorWidth*2))
            while(global.CollisionArray[Index, X1] > Height)
                X1++;
            while(global.CollisionArray[Index, X2] > Height)
                X2--;
            
            Y1 = global.CollisionArray[Index, X1];
            Y2 = global.CollisionArray[Index, X2];
            return point_direction(X1, Y1, X2, Y2);
        }else if(AngleMode == 1){
            Y1 = min(max(round(((y+AngleSensorWidth)-BBoxT)), (AngleSensorWidth*2)), Height)+1;
            Y2 = min(max(Y1-(AngleSensorWidth*2), 0), Height-(AngleSensorWidth*2))+1
            while(global.CollisionArray[Index, Width+(Y1)] > Width)
                Y1--;
            while(global.CollisionArray[Index, Width+(Y2)] > Width)
                Y2++;
            X1 = global.CollisionArray[Index, Width+(Y1)];
            X2 = global.CollisionArray[Index, Width+(Y2)];
            return point_direction(X1, Y1, X2, Y2);
        }else if(AngleMode == 2){
            X1 = max(round(((x+AngleSensorWidth)-BBoxL)/2)*2, BBoxL+(AngleSensorWidth*2));
            X2 = max(X1-(AngleSensorWidth*2), BBoxL)
            while(global.CollisionArray[Index, Width+Height+(X1-BBoxL)] < 0)
                X1--;
            while(global.CollisionArray[Index, Width+Height+(X2-BBoxL)] < 0)
                X2++;
            
            Y1 = global.CollisionArray[Index, Width+Height+(X1-BBoxL)];
            Y2 = global.CollisionArray[Index, Width+Height+(X2-BBoxL)];
            return point_direction(X1, Y1, X2, Y2);
        }else if(AngleMode == 3){
            Y1 = max(min(round(((y-AngleSensorWidth)-BBoxT)/2)*2, BBoxB-(AngleSensorWidth*2)), 0);
            Y2 = max(min(Y1+(AngleSensorWidth*2), BBoxB), (AngleSensorWidth*2))
            while(global.CollisionArray[Index, Width+Height+Width+(Y1)] < 0)
                Y1++;
            while(global.CollisionArray[Index, Width+Height+Width+(Y2)] < 0)
                Y2--;
            X1 = global.CollisionArray[Index, Width+Height+Width+(Y1)];
            X2 = global.CollisionArray[Index, Width+Height+Width+(Y2)];
            return point_direction(X1, Y1, X2, Y2);
        }
    }

    if(Angle360Detection == true){      
        var InitAngle     = scrWrapAngle(floor(Angle/10)*10); // Wraps anglemode.
    }else{
        return scrCheckAngleLegacy();
    }

    var LeftX2    = x;
    var LeftY2    = y;
    var LeftX     = x-(AngleSensorWidth*Cos[InitAngle])+(Sin[InitAngle]*20);
    var LeftY     = y+(AngleSensorWidth*Sin[InitAngle])+(Cos[InitAngle]*20);
    var RightX2   = x;
    var RightY2   = y;
    var RightX    = x+(AngleSensorWidth*Cos[InitAngle])+(Sin[InitAngle]*20);
    var RightY    = y-(AngleSensorWidth*Sin[InitAngle])+(Cos[InitAngle]*20);
 
  

    
    if(Layer == 0)
        instance_deactivate_object(objParentLayer1);
    else if(Layer == 1)
        instance_deactivate_object(objParentLayer0);

    if(AngleMode == 0){ 
        LeftX2 = scrClampValue(TerrainId.bbox_left+((x-(AngleSensorWidth*global.Cos[InitAngle]))-TerrainId.bbox_left), TerrainId.bbox_left,     (TerrainId.bbox_right-(AngleSensorWidth*2)));
        LeftY2 = scrClampValue(y+(AngleSensorWidth*global.Sin[InitAngle]), TerrainId.bbox_top,      (TerrainId.bbox_bottom))
    }else if(AngleMode == 1){    
        LeftX2 = scrClampValue((x-(AngleSensorWidth*global.Cos[InitAngle])), TerrainId.bbox_left,     (TerrainId.bbox_right));
        LeftY2 = scrClampValue(TerrainId.bbox_top+((y+(AngleSensorWidth*global.Sin[InitAngle]))-TerrainId.bbox_top), TerrainId.bbox_top+(AngleSensorWidth*2),  (TerrainId.bbox_bottom))
    }else if(AngleMode == 2){    
        LeftX2 = scrClampValue(TerrainId.bbox_left+((x-(AngleSensorWidth*global.Cos[InitAngle]))-TerrainId.bbox_left), TerrainId.bbox_left+(AngleSensorWidth*2),   (TerrainId.bbox_right));
        LeftY2 = scrClampValue(y+(AngleSensorWidth*global.Sin[InitAngle]), TerrainId.bbox_top,      (TerrainId.bbox_bottom))
    }else if(AngleMode == 3){    
        LeftX2 = scrClampValue((x-(AngleSensorWidth*global.Cos[InitAngle])), TerrainId.bbox_left,     (TerrainId.bbox_right));
        LeftY2 = scrClampValue(TerrainId.bbox_top+((y+(AngleSensorWidth*global.Sin[InitAngle]))-TerrainId.bbox_top), TerrainId.bbox_top,      (TerrainId.bbox_bottom-((AngleSensorWidth*2))))
    }

    if(AngleMode == 0){    
        RightX2 = scrClampValue(TerrainId.bbox_left+((x+(AngleSensorWidth*global.Cos[InitAngle]))-TerrainId.bbox_left), TerrainId.bbox_left+(AngleSensorWidth*2), (TerrainId.bbox_right));
        RightY2 = scrClampValue(y-(AngleSensorWidth*global.Sin[InitAngle]), TerrainId.bbox_top, (TerrainId.bbox_bottom))
    }else if(AngleMode == 1){    
        RightX2 = scrClampValue((x+(AngleSensorWidth*global.Cos[InitAngle])), TerrainId.bbox_left, (TerrainId.bbox_right));
        RightY2 = scrClampValue(TerrainId.bbox_top+((y-(AngleSensorWidth*global.Sin[InitAngle]))-TerrainId.bbox_top), TerrainId.bbox_top, (TerrainId.bbox_bottom-(AngleSensorWidth*2)))
    }else if(AngleMode == 2){    
        RightX2 = scrClampValue(TerrainId.bbox_left+((x+(AngleSensorWidth*global.Cos[InitAngle]))-TerrainId.bbox_left), TerrainId.bbox_left, (TerrainId.bbox_right-((AngleSensorWidth*2))));
        RightY2 = scrClampValue(y-(AngleSensorWidth*global.Sin[InitAngle]), TerrainId.bbox_top, (TerrainId.bbox_bottom))
    }else if(AngleMode == 3){    
        RightX2 = scrClampValue((x+(AngleSensorWidth*global.Cos[InitAngle])), TerrainId.bbox_left, (TerrainId.bbox_right));
        RightY2 = scrClampValue(TerrainId.bbox_top+((y-(AngleSensorWidth*global.Sin[InitAngle]))-TerrainId.bbox_top), TerrainId.bbox_top+(AngleSensorWidth*2), (TerrainId.bbox_bottom))
    }

    TempTerrain = noone;  
    repeat(AngleSensorHeight){
        Object = collision_point(LeftX2, LeftY2, objParentTerrain, true, true);
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
    
    TempTerrain = noone;
    repeat(AngleSensorHeight){ 
        Object = collision_point(RightX2, RightY2, objParentTerrain, true, true);
        if((Object != noone &&(Object.Layer == Layer || Object.Layer == -1) &&(Object.Platform == false 
        ||(Object.Platform == true  && AngleMode == 0) || (Object.Platform == 2  && Action != ActionJumping)))){ 
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
    
    AngleFinal = scrWrapAngle(round(point_direction(LeftX, LeftY, RightX, RightY)));
    return AngleFinal;
