//-----------------------------------------------------------------
// -- scrPushPlayerYDown();
//----------------------------------------------------------------- 
// - Pushes player out of wall downwards.
// - Arguments : 0
// - Returns   : Nothing

    //InitAngle = scrWrapAngle(AngleMode*90)// Round angle to nearest 10.   
    
    repeat(40){
        Object = collision_rectangle(x-9, y-9, x+9, y, objParentTerrain, true ,true)
        if(Object != noone &&(Object.Layer == Layer || Object.Layer == -1) &&(Object.Platform == false)){
            //x -= dsin(InitAngle);
            //Gravity = 0;
            y += 1;
        }else
            break;
    }