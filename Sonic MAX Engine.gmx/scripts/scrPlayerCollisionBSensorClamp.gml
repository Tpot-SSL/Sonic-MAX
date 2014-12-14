//-----------------------------------------------------------------
// -- scrPlayerCollisionBSensor(object index, offset);
//----------------------------------------------------------------- 
// - Finds Collision on ground on right side.
// - Arguments : 2
// - argument0 : Object to check collision with(object index or instance id)
// - argument1 : Vertical Offset(real)
// - Returns   : Colliding with Right Ground Terrain(boolean)

    var InitAngle, X2, Y2, Object;
    
    InitAngle = scrWrapAngle(AngleMode*90) // Round angle to nearest 10.   
    
    X2 = scrClampValue(x+(9*Cos[InitAngle]), TerrainId.bbox_left, TerrainId.bbox_right); 
    Y2 = scrClampValue(y-(9*Sin[InitAngle]), TerrainId.bbox_top, TerrainId.bbox_bottom);
    
    repeat(GroundSensorHeight+argument1){
        Object = collision_point(X2, Y2, argument0, true, true);
    
        if(Object != noone &&(Object.Layer == Layer || Object.Layer == -1) &&(Object.Platform == false 
        ||(Object.Platform == true  && AngleMode == 0))){
            return true;
            break;
        }else{
            X2 += Sin[InitAngle];
            Y2 += Cos[InitAngle];
        }
    }
        
    return false;