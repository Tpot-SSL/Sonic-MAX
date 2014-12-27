

//-----------------------------------------------------------------
// -- scrPushPlayerX();
//----------------------------------------------------------------- 
// - Pushes player out of wall horizontally.
// - Arguments : 0
// - Returns   : Nothing

    var InitAngle, X, Y, X2, Y2, Object;

    InitAngle = scrWrapAngle(AngleMode*90) // Round angle to nearest 10.   
    

    LeftCol = 0;
    RightCol = 0;
    TopCol = 0;
    BottomCol = 0;

    X = x+(4*Sin[InitAngle])-(PushPrecision*Cos[InitAngle]);
    Y = y+(4*Cos[InitAngle])+(PushPrecision*Sin[InitAngle]);
    
    repeat(20){
        Object = collision_point(X, Y, objParentTerrain, true ,true)
        if(Object != noone &&(Object.Layer == Layer || Object.Layer == -PushPrecision) && Object.Platform != true){
            X -= Cos[InitAngle]*PushPrecision;
            Y += Sin[InitAngle]*PushPrecision;
        }else
            break;

        LeftCol++;
    }

    X = x+(4*Sin[InitAngle])+(PushPrecision*Cos[InitAngle]);
    Y = y+(4*Cos[InitAngle])-(PushPrecision*Sin[InitAngle]);
    
    repeat(20){
        Object = collision_point(X, Y, objParentTerrain, true ,true)
        if(Object != noone &&(Object.Layer == Layer || Object.Layer == -PushPrecision) && Object.Platform != true){
            X += Cos[InitAngle]*PushPrecision;
            Y -= Sin[InitAngle]*PushPrecision;
        }else
            break;

        RightCol++;
    }

    X = x+(PushPrecision*Sin[InitAngle]);
    Y = y+(PushPrecision*Cos[InitAngle]);

    repeat(20){
        Object = collision_point(X, Y, objParentTerrain, true ,true)
        if(Object != noone &&(Object.Layer == Layer || Object.Layer == -PushPrecision) && Object.Platform != true){
            Y += Cos[InitAngle]*PushPrecision;
            X += Sin[InitAngle]*PushPrecision;
        }else
            break;

        BottomCol++;
    }

    X = x-(PushPrecision*Sin[InitAngle]);
    Y = y-(PushPrecision*Cos[InitAngle]);

    repeat(20){
        Object = collision_point(X, Y, objParentTerrain, true ,true)
        if(Object != noone &&(Object.Layer == Layer || Object.Layer == -PushPrecision) && Object.Platform != true){
            Y -= Cos[InitAngle]*PushPrecision;
            X -= Sin[InitAngle]*PushPrecision;
        }else
            break;
        TopCol++;
    }

    if(LeftCol < RightCol){
         x -= Cos[InitAngle]*(PushPrecision*LeftCol);
         y += Sin[InitAngle]*(PushPrecision*LeftCol);
    }else if(RightCol < LeftCol){
         x += Cos[InitAngle]*(PushPrecision*RightCol);
         y -= Sin[InitAngle]*(PushPrecision*RightCol);
    }else{
        scrPushPlayerX();
    }

    if(BottomCol < TopCol){
         x += Cos[InitAngle]*(PushPrecision*BottomCol);
         y += Sin[InitAngle]*(PushPrecision*BottomCol);
    }else if(TopCol < BottomCol){
         x -= Cos[InitAngle]*(PushPrecision*TopCol);
         y -= Sin[InitAngle]*(PushPrecision*TopCol);
    }else{
        scrPushPlayerY();
    }
   
