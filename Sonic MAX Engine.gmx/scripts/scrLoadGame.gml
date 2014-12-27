    

    if(file_exists(working_directory+"\Save"+string(Save)+".txt") == false || global.Save == -1){
        global.Level = 0;
        global.Score = 0;
        return false;
    }
    File = file_text_open_read(working_directory+"\Save"+string(Save)+".txt");
    
    global.Level = real(base64_decode(file_text_read_string(File)));
    file_text_readln(File);
    global.Score = real(base64_decode(file_text_read_string(File)));
    file_text_readln(File);
    global.Character[0] = real(base64_decode(file_text_read_string(File)));
    file_text_readln(File);
    global.Character[1] = real(base64_decode(file_text_read_string(File)));
    file_text_readln(File);
    global.Spindash = real(base64_decode(file_text_read_string(File)));
    file_text_readln(File);
    global.RotationMode = real(base64_decode(file_text_read_string(File)));
    file_text_readln(File);
    global.UseTrail = real(base64_decode(file_text_read_string(File)));
    file_text_readln(File);
    if(file_text_eof(File) == true)
        global.ChaosEmeralds = 0;
    else
        global.ChaosEmeralds = real(base64_decode(file_text_read_string(File)));
    file_text_readln(File);
    if(file_text_eof(File) == true)
        global.Lives = 3;
    else
        global.Lives = real(base64_decode(file_text_read_string(File)));
    file_text_readln(File);
    if(file_text_eof(File) == true)
        global.UsePeelout = true;
    else   
        global.UsePeelout = real(base64_decode(file_text_read_string(File)));

    file_text_close(File);
    return true;
