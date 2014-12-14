    RingTotal = min(global.Rings, 32);
    RingAngle = 101.25 
    RingSpeed = 4
    
    
 
    while(RingTotal){
        Ring = instance_create(x-8, y-16, objRing);
        Ring.Alarm = 64;
        
        Ring.Gravity    = -dsin(round(RingAngle))*RingSpeed;
        Ring.Speed      = dcos(round(RingAngle))*RingSpeed;
        Ring.Motion     = true;
        if(RingTotal mod 2 != 0){
            RingAngle += 22.5;
            Ring.Speed *= -1;
        }   
        RingTotal -= 1;
        if(RingTotal == 16){
            RingSpeed = 2;
            RingAngle = 101.25;
        }
    }
    global.Rings = 0;