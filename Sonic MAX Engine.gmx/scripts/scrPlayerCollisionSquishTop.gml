//-----------------------------------------------------------------
// -- scrPlayerCollisionSquishTop();
//----------------------------------------------------------------- 
// - Finds if Player is squished from above.
// - Arguments : 0
// - Returns   : If the player is being squished(Boolean)

    var Object;


    Object = collision_rectangle(x-2, y-2, x+2, y+2, objParentTerrain, true, true);
    

    if((Object != noone &&(Object.Layer == Layer || Object.Layer == -1) && Object.Platform == false))
        scrPlayerDead(sndPlayerDead);  