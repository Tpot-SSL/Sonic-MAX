//-----------------------------------------------------------------
// -- scrPlayerCollisionCSensor(object index, offset);
//----------------------------------------------------------------- 
// - Finds Collision on left side(above player).
// - Arguments : 2
// - argument0 : Object to check collision with(object index or instance id)
// - argument1 : Vertical Offset(real)
// - Returns   : Colliding with Left Terrain above the player(boolean)

    var InitAngle, X, Y, X2, Y2;

    InitAngle =  scrWrapAngle(AngleMode*90); // Round angle to nearest 10.   

       // ----- Set mask under the Player depending on InitAngle -----
    X = x+((22+argument1)*dsin(InitAngle))-(9*dcos(InitAngle)); 
    
    // ----- Set mask under the Player depending on InitAngle -----
    Y = y+((22+argument1)*dcos(InitAngle))+(9*dsin(InitAngle));

    Y2 = y+(9*dsin(InitAngle));
    
    X2 = x-(9*dcos(InitAngle)); 
    

    Object = collision_line(X2, Y2, X, Y, argument0, true, true);
    
    if(Object != noone)
        return true;
        
    return false;
