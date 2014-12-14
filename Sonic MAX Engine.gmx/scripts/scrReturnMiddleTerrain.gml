//-----------------------------------------------------------------
// -- scrReturnMiddleTerrain(object index);
//----------------------------------------------------------------- 
// - Returns the colliding terrain in the middle of the player.
// - Arguments : 1
// - argument0 : Object to check collision(object index, or instance id).
// - Returns   : Middle Terrain(instance id)


    var InitAngle   = scrWrapAngle(AngleMode*90);    
    var RightX2     = x;
    var RightY2     = y;
    repeat(50){
        Object = collision_point(RightX2, RightY2, argument0, true, true);
        if(Object == noone){ 
            RightX2 += Sin[InitAngle];
            RightY2 += Cos[InitAngle];   
        }else{
            return Object;
            break;
        }
    }
    return noone;