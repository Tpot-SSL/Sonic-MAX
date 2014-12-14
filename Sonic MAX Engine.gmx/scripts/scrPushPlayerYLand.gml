//-----------------------------------------------------------------
// -- scrPushPlayerY();
//----------------------------------------------------------------- 
// - Pushes player out of wall vertically.
// - Arguments : 0
// - Returns   : Nothing

    var InitAngle, Object;
 
    if(Ground == true && Landed == false)
        exit;
    InitAngle = scrWrapAngle(AngleMode*90)  
    
    repeat(160){
        if(scrPlayerCollisionASensor(objParentTerrain, -17) && scrPlayerCollisionCSensor(objParentTerrain, 0) == false){
            x -= Sin[InitAngle];
            y -= Cos[InitAngle];
        }else
            break;
    }
    repeat(160){
        if(scrPlayerCollisionBSensor(objParentTerrain, -17) && scrPlayerCollisionDSensor(objParentTerrain, 0) == false){
            x -= Sin[InitAngle];
            y -= Cos[InitAngle];
        }else
            break;
    }