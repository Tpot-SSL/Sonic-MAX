

    if(KS_Active = true){
        if(KS_Pos >= array_length_1d(KS_Array)){ 
            if(KS_Delete == true){
                KS_Active = false;
            }else{
                scrResetKeySequence();
            }
            return true;
        }
        if(keyboard_check_pressed(KS_Array[KS_Pos])){
            KS_Pos++;
            KS_TimerPos       = 0;
            keyboard_lastkey  = -1;
            return false;
        }
        if(KS_WrongKey == true && keyboard_lastkey != KS_Array[KS_Pos] && keyboard_lastkey != -1){
            KS_Pos       = 0;
            KS_TimerPos  = 0;
            keyboard_lastkey  = -1;
            return false;
        }
        if(KS_Timer > 0){
            KS_TimerPos++;
            if(KS_TimerPos >= KS_Timer){
                KS_TimerPos = 0;
                KS_Pos      = 0;
                keyboard_lastkey  = -1;
                return false;
            }
            
        }
    }
    return false;