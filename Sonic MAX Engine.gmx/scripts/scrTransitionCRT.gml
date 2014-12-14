    WView = min(room_width, view_wview[0]);
    HView = min(room_height, view_hview[0]);
    TransitionSprite = sprite_create_from_surface(application_surface, 0, 0, WView, HView, false, false, 0, 0);
                                      
    TransitionAlpha = 1;
    TransitionXScale = 1;
    TransitionYScale = 1;
    TransitionX = view_xview[0]-(view_wview[0]+20);
    TransitionStep = 0;
    TransitionRoom = argument0;

    Transition = consTransitionCRT;