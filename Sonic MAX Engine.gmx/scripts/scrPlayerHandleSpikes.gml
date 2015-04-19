

  // --------
    if(Action == ActionHurt || Invincibility > 0 || instance_exists(objSpike) == false)
        exit;


    if(TerrainId != noone && instance_exists(TerrainId) && TerrainId.object_index == objSpike && Ground){
        if(TerrainId.image_angle == 0)
            scrPlayerHurt(TerrainId, sndPlayerSpike)
    }
  
    _ObjectHandle = collision_rectangle(x-9, y-16, x+9, y-24, objSpike, false, true);
    if(_ObjectHandle != noone){
        if(_ObjectHandle.image_angle == 180)
            scrPlayerHurt(_ObjectHandle, sndPlayerSpike);        
    }
    
    _ObjectHandle = collision_line(x, y+4, x+12, y+4, objSpike, false, true);
    if(_ObjectHandle != noone){
        if(_ObjectHandle.image_angle == 90)
            scrPlayerHurt(_ObjectHandle, sndPlayerSpike);        
    }
    _ObjectHandle = collision_line(x, y+4, x-12, y+4, objSpike, false, true);
    if(_ObjectHandle != noone){
        if(_ObjectHandle.image_angle == 270)
            scrPlayerHurt(_ObjectHandle, sndPlayerSpike);        
    }
