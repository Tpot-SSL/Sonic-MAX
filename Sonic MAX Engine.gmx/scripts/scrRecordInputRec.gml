
    scrRecordWriteKey(KeyLeftPressed,  "L", Rec_Frame, 1);
    scrRecordWriteKey(KeyRightPressed, "R", Rec_Frame, 1);
    scrRecordWriteKey(KeyUpPressed,    "U", Rec_Frame, 1);
    scrRecordWriteKey(KeyDownPressed,  "D", Rec_Frame, 1);

    scrRecordWriteKey(KeyAPressed, "A", Rec_Frame, 1);
    scrRecordWriteKey(KeyBPressed, "B", Rec_Frame, 1);
    scrRecordWriteKey(KeyCPressed, "C", Rec_Frame, 1);
    scrRecordWriteKey(KeySPressed, "S", Rec_Frame, 1);

    var KL = keyboard_check_released(global.InputLeft);
    var KR = keyboard_check_released(global.InputRight);
    var KU = keyboard_check_released(global.InputUp);
    var KD = keyboard_check_released(global.InputDown);

    var KA = keyboard_check_released(global.InputA);
    var KB = keyboard_check_released(global.InputB);
    var KC = keyboard_check_released(global.InputC);
    var KS = keyboard_check_released(global.InputSuper);

    scrRecordWriteKey(KL, "L", Rec_Frame, 2);
    scrRecordWriteKey(KR, "R", Rec_Frame, 2);
    scrRecordWriteKey(KU, "U", Rec_Frame, 2);
    scrRecordWriteKey(KD, "D", Rec_Frame, 2);
    
    scrRecordWriteKey(KA, "A", Rec_Frame, 2);
    scrRecordWriteKey(KB, "B", Rec_Frame, 2);
    scrRecordWriteKey(KC, "C", Rec_Frame, 2);
    scrRecordWriteKey(KS, "S", Rec_Frame, 2);
   