//-----------------------------------------------------------------
// -- scrPlayerCollisionSquish();
//----------------------------------------------------------------- 
// - Finds if Player is squished.
// - Arguments : 0
// - Returns   : If the player is being squished(Boolean)


    var Object;

    Object = collision_rectangle(x-2, y-2, x+2, y+2, objParentSquishTerrain, true, true);
    
    if((Object != noone &&(Object.Layer == Layer || Object.Layer == -1) && Object.Platform == false))
        return true;
    else{    
        Object = collision_rectangle(x-2, y-2, x+2, y+2, objParentTerrain, true, true);
        if((Object != noone && TerrainId != noone &&(Object.Layer == Layer || Object.Layer == -1) && Object.Platform == false) && TerrainId.object_index == objMovingSolid)
            return true;
    }
        
    return false;