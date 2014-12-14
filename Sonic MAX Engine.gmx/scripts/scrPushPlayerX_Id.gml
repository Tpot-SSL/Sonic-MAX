//-----------------------------------------------------------------
// -- scrPushPlayerX();
//----------------------------------------------------------------- 
// - Pushes player out of wall horizontally.
// - Arguments : 0
// - Returns   : Nothing

    var InitAngle, X, Y, X2, Y2, Object;

    InitAngle = scrWrapAngle(AngleMode*90) // Round angle to nearest 10.   
    
   // instance_deactivate_object(objParentPlatform);

 
    X = x+4*Sin[InitAngle];
    Y = y+4*Cos[InitAngle];
    
    X2   = x+10*Cos[InitAngle]+4*Sin[InitAngle];
    Y2   = y+4*Cos[InitAngle]-10*Sin[InitAngle];
    repeat(12){
        Object = collision_line(X, Y, X2, Y2, argument0, true ,true)
        if(Object != noone &&(Object.Layer == Layer || Object.Layer == -1) && Object.Platform == false && Speed >= 0){
            x -= Cos[InitAngle];
            y += Sin[InitAngle];
            X2   = x+10*Cos[InitAngle]+4*Sin[InitAngle];
            Y2   = y+4*Cos[InitAngle]-10*Sin[InitAngle];
            //ObjectC[0] = true;
        }else
            break;
    }
    X = x+4*Sin[InitAngle];
    Y = y+4*Cos[InitAngle];
    
    X2   = x-10*Cos[InitAngle]+4*Sin[InitAngle];
    Y2   = y+4*Cos[InitAngle]+10*Sin[InitAngle];
   
    repeat(12){
        Object = collision_line(X, Y, X2, Y2, argument0, true ,true)
        if(Object != noone &&(Object.Layer == Layer || Object.Layer == -1) && Object.Platform == false && Speed <= 0){
            x += Cos[InitAngle];
            y -= Sin[InitAngle];
            X2   = x-10*Cos[InitAngle]+4*Sin[InitAngle];
            Y2   = y+4*Cos[InitAngle]+10*Sin[InitAngle];
            //ObjectC[1] = true;
        }else
            break;
    }
    if(Ground == false){
        X = x-6*Sin[InitAngle];
        Y = y-6*Cos[InitAngle];
        
        X2   = x+10*Cos[InitAngle]-6*Sin[InitAngle];
        Y2   = y-6*Cos[InitAngle]-10*Sin[InitAngle];
        repeat(12){
            Object = collision_line(X, Y, X2, Y2, argument0, true ,true)
            if(Object != noone &&(Object.Layer == Layer || Object.Layer == -1) && Object.Platform == false && Speed >= 0){
                x -= Cos[InitAngle];
                y += Sin[InitAngle];
                X2   = x+10*Cos[InitAngle]-6*Sin[InitAngle];
                Y2   = y-6*Cos[InitAngle]-10*Sin[InitAngle];
                //ObjectC[0] = true;
            }else
                break;
        }
        X = x-6*Sin[InitAngle];
        Y = y-6*Cos[InitAngle];
        
        X2   = x-10*Cos[InitAngle]-6*Sin[InitAngle];
        Y2   = y-6*Cos[InitAngle]+10*Sin[InitAngle];
       
        repeat(12){
            Object = collision_line(X, Y, X2, Y2, argument0, true ,true)
            if(Object != noone &&(Object.Layer == Layer || Object.Layer == -1) && Object.Platform == false && Speed <= 0){
                x += Cos[InitAngle];
                y -= Sin[InitAngle];
                X2   = x-10*Cos[InitAngle]-6*Sin[InitAngle];
                Y2   = y-6*Cos[InitAngle]+10*Sin[InitAngle];
                //ObjectC[1] = true;
            }else
                break;
        }
    }