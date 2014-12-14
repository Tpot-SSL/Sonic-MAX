
    Value = argument0;
    ActiveBits = 0;
    Bits   = argument1;
    Power  = power(2, Bits-1);
    while(Power >= 1){
        if(Value >= Power){
            Value -= Power;
            ActiveBits++;
        } 
        Bits--;
        Power  = power(2, Bits-1);
    }
    return ActiveBits;