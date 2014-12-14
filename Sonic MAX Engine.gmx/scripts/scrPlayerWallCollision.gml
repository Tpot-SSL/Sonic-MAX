//-----------------------------------------------------------------
// -- scrPlayerWallCollision();
//----------------------------------------------------------------- 
// - Sets player's speed to 0 when colliding with walls.
// - Arguments : 0
// - Returns   : Nothing

    var InitAngle = scrWrapAngle(AngleMode*90); // Round angle to nearest 10.   

    var X = x+4*Sin[InitAngle];
    var Y = y+4*Cos[InitAngle];
    
    var X2   = X+11*Cos[InitAngle];
    var Y2   = Y-11*Sin[InitAngle];

    Collide = collision_line(X, Y, X2, Y2, objParentTerrain, true ,true);    
    if((Collide != noone &&(Collide.Layer == Layer || Collide.Layer == -1) && Collide.Platform != true) && Speed >= 0){
        scrPushPlayerX_Id(Collide);
        Speed = 0;
    }


    X = x+4*Sin[InitAngle];
    Y = y+4*Cos[InitAngle];
    
    X2   = x-11*Cos[InitAngle]+4*Sin[InitAngle];
    Y2   = y+4*Cos[InitAngle]+11*Sin[InitAngle];
    Collide = collision_line(X, Y, X2, Y2, objParentTerrain, true ,true);
    if((Collide != noone &&(Collide.Layer == Layer || Collide.Layer == -1) && Collide.Platform != true) && Speed <= 0){
        scrPushPlayerX_Id(Collide);
        Speed = 0;
    }


    if(Ground == false){
        X = x-7*Sin[InitAngle];
        Y = y-7*Cos[InitAngle];
        
        X2   = X+11*Cos[InitAngle];
        Y2   = Y-11*Sin[InitAngle];
        Collide = collision_line(X, Y, X2, Y2, objParentTerrain, true ,true);    
        if((Collide != noone &&(Collide.Layer == Layer || Collide.Layer == -1) && Collide.Platform != true) && Speed >= 0){
            scrPushPlayerX_Id(Collide);
            Speed = 0;
        }
    
    
        X = x-7*Sin[InitAngle];
        Y = y-7*Cos[InitAngle];
        
        X2   = x-11*Cos[InitAngle]-7*Sin[InitAngle];
        Y2   = y-7*Cos[InitAngle]+11*Sin[InitAngle];
        Collide = collision_line(X, Y, X2, Y2, objParentTerrain, true ,true);
        if((Collide != noone &&(Collide.Layer == Layer || Collide.Layer == -1) && Collide.Platform != true) && Speed <= 0){
            scrPushPlayerX_Id(Collide);
            Speed = 0;
        }
    }
    