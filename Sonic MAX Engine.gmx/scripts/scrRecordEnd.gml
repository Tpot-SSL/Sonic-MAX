 //---------------------------------------------\\
 //scrRecordEnd(recordingmode);
 //-----recordingmode-----
 // 0 = Recording. 
 // 1 = Playing.
 //---------------------------------------------\\
 //Played at end of recording/playing session.
 //---------------------------------------------\\      


    if(PlayerId != 0)
        exit;

    if(argument0 == consRecordRec){;
        ini_write_real("Main", "Max", Rec_Frame); 
    }
    ini_close();