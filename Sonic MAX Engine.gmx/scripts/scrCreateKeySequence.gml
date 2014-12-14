
    KS_Array     = argument0;
    KS_Active    = true;
    KS_Timer     = argument1;
    KS_Delete    = argument2;
    KS_WrongKey  = argument3;
    KS_Pos       = 0;
    KS_TimerPos  = 0;

    if(is_array(KS_Array) == false){
        show_error("ERROR: Key Sequence is not an array, and was unable to initialize.", false);
        //KS_Array = -1;
        KS_Active  = false;
        KS_Timer = -1;
    }