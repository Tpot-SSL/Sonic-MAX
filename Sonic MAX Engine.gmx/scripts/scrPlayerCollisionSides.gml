//-----------------------------------------------------------------
// -- scrPlayerCollisionSides();
//----------------------------------------------------------------- 
// - Finds Collision on left side.
// - Arguments : 0
// - Returns   : Colliding with Terrain on both sides(boolean)


   // InitAngle = scrWrapAngle(AngleMode*90); // Round angle to nearest 10.   

   
    Object = collision_line(x-11, y+4, x+11, y+4, objParentTerrain, true, true)
    if((Object != noone &&(Object.Layer == Layer || Object.Layer == -1) && Object.Platform == false))
        return true;
        
    return false;
    