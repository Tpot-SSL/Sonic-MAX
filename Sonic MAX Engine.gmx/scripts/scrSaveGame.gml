

    if(global.Save == -1)
        exit;
    var Level = scrLoadLevel(global.Save)-1;
    file_delete(working_directory+"\Save"+string(global.Save)+".txt")
    File = file_text_open_write(working_directory+"\Save"+string(global.Save)+".txt");
    
    
    file_text_write_string(File, base64_encode(string(max(global.Level, Level))));
    file_text_writeln(File);
    file_text_write_string(File, base64_encode(string(global.Score)));
    file_text_writeln(File);
    file_text_write_string(File, base64_encode(string(global.Character[0])));
    file_text_writeln(File);
    file_text_write_string(File, base64_encode(string(global.Character[1])));
    file_text_writeln(File);
    file_text_write_string(File, base64_encode(string(global.Spindash)));
    file_text_writeln(File);
    file_text_write_string(File, base64_encode(string(global.RotationMode)));
    file_text_writeln(File);
    file_text_write_string(File, base64_encode(string(global.UseTrail)));
    file_text_writeln(File);
    file_text_write_string(File, base64_encode(string(global.ChaosEmeralds)));
    file_text_writeln(File);
    file_text_write_string(File, base64_encode(string(global.Lives)));
    file_text_writeln(File);
    file_text_write_string(File, base64_encode(string(global.UsePeelout)));
    file_text_close(File);
