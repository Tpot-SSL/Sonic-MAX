 //------------------------------------------------------------------------------------------------------------------------\\
 // scrRecordInit(recordingmode, file, finishscript);
 //-----recordingmode-----
 // 0 = Recording. 
 // 1 = Playing.
 //-----file-----
 // "file" is the file name of where you would like to record.
 //------------------------------------------------------------------------------------------------------------------------\\
 //This script has to be called whenever the recording or playing of recording is starting, usually in a "create" event.
 //------------------------------------------------------------------------------------------------------------------------\\ 
    if(argument0 == consRecordRec) // Checks if its recording, and deleting the previous file.
        file_delete(argument1);
 
    ini_open(argument1);//Open file.
    if(argument0 == consRecordRec){
        ini_write_real("Main", "Rm", room);
        ini_write_real("Main", "Chr", global.Character[0]);
    }
    Rec_Ini = argument1;  

    Rec_FinishScript = argument2;


    if(argument0 == consRecordPlay)
        Rec_FrameMax = ini_read_real("Main", "Max", 0);    
  
    Rec_Frame = 0; //Set Frame Variable.

   // ini_close();