
    if(PlayerId != 0)
        exit;


    show_message("Recording is finished.");
    objGlobal.RecordingMode = consRecordIdle;
    room_restart();