//-----------------------------------------------------------------
// -- scrPlayerCollisionDSensor(object index, offset);
//----------------------------------------------------------------- 
// - Finds Collision on right side(above player).
// - Arguments : 2
// - argument0 : Object to check collision with(object index or instance id)
// - argument1 : Vertical Offset(real)
// - Returns   : Colliding with Right Terrain above the player(boolean)

    var InitAngle, X, Y, X2, Y2, Object;

    InitAngle = scrWrapAngle(AngleMode*90); // Round angle to nearest 10.   
    if(Action == ActionJumping || Action == ActionRolling)
        Length = 10;
    else
        Length = 20;
       // ----- Set mask under the Player depending on InitAngle -----
    X = x-((Length+argument1)*Sin[InitAngle])+(9*Cos[InitAngle]); 
    
    // ----- Set mask under the Player depending on InitAngle -----
    Y = y-((Length+argument1)*Cos[InitAngle])-(9*Sin[InitAngle]);

    Y2 = y-(9*Sin[InitAngle]);
    
    X2 = x+(9*Cos[InitAngle]); 
    

    Object = collision_line(X2, Y2, X, Y, argument0, true, true);
    
    if(Object != noone && instance_exists(Object) &&(Object.Layer == Layer || Object.Layer == -1) && Object.Platform != true)
        return true;
        
    return false;
