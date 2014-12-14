    

    if(file_exists(working_directory+"\Save"+string(argument0)+".txt") == false){
        return 0;
    }
    File = file_text_open_read(working_directory+"\Save"+string(argument0)+".txt");
    file_text_readln(File);
    file_text_readln(File);
    Var =  real(base64_decode(file_text_read_string(File)));
    file_text_close(File);
    return Var;
    //return true;