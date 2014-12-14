    argument0 = string(argument0);
    while(string_length(argument0) < argument1){
        argument0 = "0"+argument0;
    }
    return argument0;