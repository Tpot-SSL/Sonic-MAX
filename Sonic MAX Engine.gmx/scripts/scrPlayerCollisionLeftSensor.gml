//-----------------------------------------------------------------
// -- scrPlayerCollisionLeftSensor(object index);
//----------------------------------------------------------------- 
// - Finds Collision on left side.
// - Arguments : 1
// - argument0 : Object to check collision with(object index or instance id)
// - Returns   : Colliding with Left Terrain(boolean)


    InitAngle = scrWrapAngle(AngleMode*90); // Round angle to nearest 10.   

    X = x+4*dsin(InitAngle);
    Y = y+4*dcos(InitAngle);
    
    X2   = x-12*dcos(InitAngle)+4*dsin(InitAngle);
    Y2   = y+4*dcos(InitAngle)+12*dsin(InitAngle);
    Object = collision_line(X, Y, X2, Y2, argument0, true ,true)
    if((Object != noone &&(Object.Layer == Layer || Object.Layer == -1) && Object.Platform != true))
        return true;
        
    return false;
    
