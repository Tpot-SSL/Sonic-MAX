//-----------------------------------------------------------------
// -- scrPlayerCollisionBSensor(object index, offset);
//----------------------------------------------------------------- 
// - Finds Collision on ground on right side.
// - Arguments : 2
// - argument0 : Object to check collision with(object index or instance id)
// - argument1 : Vertical Offset(real)
// - Returns   : Colliding with Right Ground Terrain(boolean)

    var InitAngle, X2, Y2, Object;
    
    InitAngle = scrWrapAngle(round(Angle/10)*10); // Round angle to nearest 10.   

    X2 = x+(9*Cos[InitAngle]);     
    Y2 = y-(9*Sin[InitAngle]); 
    
    if(AngleMode == 0 &&(Angle < 7 || Angle > 353))
        Height = GroundSensorHeightMin;
    else
        Height = GroundSensorHeight;
    
    repeat(Height+argument1){
        Object = collision_point(X2, Y2, argument0, true, true);
    
        if(Object != noone &&(Object.Layer == Layer || Object.Layer == -1) &&(Object.Platform == false 
        ||(Object.Platform == true && AngleMode == 0))){
            return true;
            break;
        }else{
            X2 += Sin[InitAngle];
            Y2 += Cos[InitAngle];
        }
    }
        
    return false;
