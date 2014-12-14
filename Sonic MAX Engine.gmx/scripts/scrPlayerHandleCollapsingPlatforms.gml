
        _ObjectHandle = instance_nearest(x, y, objCollapsingPlatform);
        if(_ObjectHandle != noone && Ground == true && TerrainId == _ObjectHandle){
            if(_ObjectHandle.Alarm < 0)
                _ObjectHandle.Alarm = 45;    
        }
     