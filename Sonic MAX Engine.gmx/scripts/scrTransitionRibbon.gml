//    TransitionSprite = sprite_create_from_surface(application_surface, 0, 0, view_wview[0], view_hview[0], false, false, 0, 0);

    WView = min(room_width, view_wview[0]);
                                      
    TransitionAlpha     = 1;
    TransitionXScale    = 1;
    TransitionYScale    = 1;
    TransitionSpeed     = 5;
    TransitionX         = view_xview[0]-(WView+20);
    TransitionStep      = 0;
    TransitionRoom      = argument0;

    Transition          = consTransitionRibbon;