        
        //Angle       = round(Angle/1.40625)*1.40625;
        Gravity     = -dsin(Angle)*Speed;
        Speed       = dcos(Angle)*Speed;
        Ground      = false;
        Angle       = 0;
        TerrainId   = noone;
        
        AngleMode   = 0;