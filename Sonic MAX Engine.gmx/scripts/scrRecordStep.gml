//------------------------------------\\
//scrRecordStep()
//------------------------------------\\
//Played in step event when recording.
//------------------------------------\\  
  
    Rec_Frame += 1;  

    if(argument0 == consRecordPlay){
        if(Rec_Frame == Rec_FrameMax)
            script_execute(Rec_FinishScript);
    
    }