
    if(Action == ActionJumping){
        _ObjectHandle = scrPlayerCollisionASensorObj(objBreakableTerrain, -16);
        if(_ObjectHandle != noone && Gravity >= 0){
            with(_ObjectHandle)
                instance_destroy();
            Gravity = -3;
        }
        _ObjectHandle = scrPlayerCollisionBSensorObj(objBreakableTerrain, -16);
        if(_ObjectHandle != noone && Gravity >= 0){
            with(_ObjectHandle)
                instance_destroy();
            Gravity = -3;
        }
    }
    if((Action == ActionRolling && abs(Speed) >= 4.5) || CharacterId == consCharacterKnuckles){
        _ObjectHandle = collision_rectangle(x-20, y-20, x+20, y+20, objBreakableTerrainRoll, false, true);
        while(_ObjectHandle != noone){
            with(_ObjectHandle)
                instance_destroy();
            _ObjectHandle = collision_rectangle(x-20, y-20, x+20, y+20, objBreakableTerrainRoll, false, true)
        }
    }
