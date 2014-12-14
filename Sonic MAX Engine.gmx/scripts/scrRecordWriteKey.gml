//scrWriteKey(key, keyname, frame number, keytype)

   // ini_open(Rec_Ini);//Open file.

    if(argument0 == false)
        exit; 

    var Frm = argument2;    

    switch(argument3){
        case 0:
            if(keyboard_check(argument0))
                ini_write_string("F"+string(Frm), argument1, "1");
            break;
   
        case 1:
            if(keyboard_check_pressed(argument0))
                ini_write_string("F"+string(Frm), string(argument1)+"_P", "1");
            break;
  
        case 2:
            if keyboard_check_released(argument0)
                ini_write_string("F"+string(Frm), string(argument1)+"_R", "1");
            break; 
    }
  //  ini_close();