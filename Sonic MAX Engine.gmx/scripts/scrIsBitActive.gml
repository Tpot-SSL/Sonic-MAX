
    Value = argument0;
    Bits   = argument1;
    Bit    = argument2;
    var i = Bits;
    repeat(Bits){
       ActiveBit[i] = false;
       i--;
    }
    Power  = power(2, Bits-1);
    while(Power >= 1){
         if(Value >= Power){
             ActiveBit[Bits] = true; 
             Value -= Power;           
         } 
        Bits--;
        Power  = power(2, Bits-1);
    }
    
    return ActiveBit[Bit];