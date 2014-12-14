//-----------------------------------------------------------------
// -- scrPushPlayerY();
//----------------------------------------------------------------- 
// - Pushes player out of wall vertically.
// - Arguments : 0
// - Returns   : Nothing

    var InitAngle, Object;
 
         InitAngle = scrWrapAngle(AngleMode*90) ;
   
    
    repeat(160){
        if(scrPlayerCollisionASensor(TerrainId, -17) && scrPlayerCollisionCSensor(TerrainId, 0) == false){
            x -= Sin[InitAngle];
            y -= Cos[InitAngle];
        }else
            break;
    }
    repeat(160){
        if(scrPlayerCollisionBSensor(TerrainId, -17) && scrPlayerCollisionDSensor(TerrainId, 0) == false){
            x -= Sin[InitAngle];
            y -= Cos[InitAngle];
        }else
            break;
    }

/*
    repeat(300){
        if(scrPlayerCollisionASensor(TerrainId, -15) && scrPlayerCollisionCSensor(TerrainId, 0)){
            x += Cos[InitAngle];
            y -= Sin[InitAngle];
        }else
            break;
    }
    repeat(300){
        if(scrPlayerCollisionBSensor(TerrainId, -15) && scrPlayerCollisionDSensor(TerrainId, 0)){
            x -= Cos[InitAngle];
            y += Sin[InitAngle];
        }else
            break;
    } 

    