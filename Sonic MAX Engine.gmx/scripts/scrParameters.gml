    
    var i, String;
    Room = -1;
    LvlParameter = false;
    for(i=0; i <= parameter_count(); i+=1){
        String = parameter_string(i+1);
       // show_message(String);
        if(LvlParameter == true){
            //show_message(real(string_digits(String)));
            Room = ds_list_find_value(global.LevelList, real(string_digits(String)));   
            LvlParameter = false;
        }
        //String = string_lower(String);
        switch(String){
            case "-sonic":
                global.Character[0] = consCharacterSonic;
                LvlParameter = false;
                break;
            case "-tails":
                global.Character[0] = consCharacterTails;
                LvlParameter = false;
                break;
            case "-cputails":
                global.Character[1] = consCharacterTails;
                LvlParameter = false;
                break;
            case "-debug":
                global.DebugMode = true;
                LvlParameter = false;
                break;
            case "-levelselect":
                Room = roomLevelSelect;
                LvlParameter = false;
                break;
            case "-knuckles":
                global.Character[0] = consCharacterKnuckles;
                LvlParameter = false;
                break;
            case "-level":
                LvlParameter = true;                
                break;
        }
        
        
    }
    if(Room != -1){
        room_goto(Room);
        return true;
    }
    return false;
    