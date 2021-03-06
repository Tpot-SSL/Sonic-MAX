//-----------------------------------------------------------------
// -- scrPlayerCollisionASensor(object index, offset);
//----------------------------------------------------------------- 
// - Finds Collision on the ground on left side.
// - Arguments : 2
// - argument0 : Object to check collision with(object index or instance id)
// - argument1 : Vertical Offset(real)
// - Returns   : Colliding with Left Ground Terrain(boolean)


    var InitAngle, X2, Y2, Object;

    if(Angle360Detection == true)
        InitAngle = scrWrapAngle(round(Angle/10)*10); // Round angle to nearest 10.   
    else
        InitAngle = scrWrapAngle(round(Angle/45)*45); // Round angle to nearest 45.   
    
    X2 = x-(9*Cos[InitAngle]);
    Y2 = y+(9*Sin[InitAngle]);
    
    
    Height = GroundSensorHeight;

    repeat(Height+argument1){
        Object = collision_point(X2, Y2, argument0, true, true);
    
        if(Object != noone &&(Object.Layer == Layer || Object.Layer == -1) &&(Object.Platform == false 
        ||(Object.Platform == true  && AngleMode == 0) || (Object.Platform == 2  && Action != ActionJumping))){ 
            return true;
            break;
        }else{
            X2 += Sin[InitAngle];
            Y2 += Cos[InitAngle];
        }
    }
    return false;
