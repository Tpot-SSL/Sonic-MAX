

    if(instance_exists(objConveyer) == false)
        exit;
    
    if(Ground == true && TerrainId != noone && instance_exists(TerrainId)){
        _ObjectHandle  = collision_rectangle(x-9, y, x+9, y+21, objConveyer, true, true);
        if(TerrainId == _ObjectHandle)
            x += _ObjectHandle.Speed;
    }