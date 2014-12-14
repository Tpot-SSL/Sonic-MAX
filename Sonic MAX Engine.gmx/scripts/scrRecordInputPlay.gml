    KeyLeftPressed     = scrRecordReadKey("L", Rec_Frame, 1);
    KeyUpPressed       = scrRecordReadKey("U", Rec_Frame, 1);
    KeyDownPressed     = scrRecordReadKey("D", Rec_Frame, 1);
    KeyRightPressed    = scrRecordReadKey("R", Rec_Frame, 1);

    KeyAPressed     = scrRecordReadKey("A", Rec_Frame, 1);
    KeyBPressed     = scrRecordReadKey("B", Rec_Frame, 1);
    KeyCPressed     = scrRecordReadKey("C", Rec_Frame, 1);
    KeySPressed     = scrRecordReadKey("S", Rec_Frame, 1);

    if(KeyLeftPressed == true)
        KeyLeft = true;
    
    if(KeyRightPressed == true)
        KeyRight = true;

    if(KeyUpPressed == true)
        KeyUp = true;

    if(KeyDownPressed == true)
        KeyDown = true;

    if(KeyAPressed == true)
        KeyA = true;
    
    if(KeyBPressed == true)
        KeyB = true;

    if(KeyCPressed == true)
        KeyC = true;

    if(KeySPressed == true)
        KeyS = true;


    if(scrRecordReadKey("L", Rec_Frame, 2) == true)
        KeyLeft = false;
    
    if(scrRecordReadKey("R", Rec_Frame, 2) == true)
        KeyRight = false;

    if(scrRecordReadKey("U", Rec_Frame, 2) == true)
        KeyUp = false;

    if(scrRecordReadKey("D", Rec_Frame, 2) == true)
        KeyDown = false;

    if(scrRecordReadKey("A", Rec_Frame, 2) == true)
        KeyA = false;
    
    if(scrRecordReadKey("B", Rec_Frame, 2) == true)
        KeyB = false;

    if(scrRecordReadKey("C", Rec_Frame, 2) == true)
        KeyC = false;

    if(scrRecordReadKey("S", Rec_Frame, 2) == true)
        KeyS = false;