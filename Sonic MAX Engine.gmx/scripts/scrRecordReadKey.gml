//scrReadKey(keyname, frame number, keytype)

    var FrameNum, Result;

   // ini_open(Rec_Ini);//Open file.
    FrameNum     = argument1;
    Result       = 0;
    switch(argument2){  
        case 0:
            Result = ini_read_real("F"+string(FrameNum), argument0, 0);
            break;
   
        case 1:
            Result = ini_read_real("F"+string(FrameNum), string(argument0)+"_P", 0);
            break;
   
        case 2:
            Result = ini_read_real("F"+string(FrameNum), string(argument0)+"_R", 0);
            break;
    }
    
   // ini_close();
    return Result;