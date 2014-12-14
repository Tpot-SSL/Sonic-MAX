///scrAnimationSystemAddSimple(name, speed, sprite_index)
    ds_grid_set(Animations, consAnimationsName,   ds_grid_height(Animations)-1, argument0);
    ds_grid_set(Animations, consAnimationsSpeed,  ds_grid_height(Animations)-1, argument1);
    ds_grid_set(Animations, consAnimationsSprite, ds_grid_height(Animations)-1, argument2);
    ds_grid_set(Animations, consAnimationsLoop,   ds_grid_height(Animations)-1, 0);
    ds_grid_set(Animations, consAnimationsRepeat,   ds_grid_height(Animations)-1, 1);
    ds_grid_set(Animations, consAnimationsEndAnim,   ds_grid_height(Animations)-1, argument0);
    ds_grid_set(Animations, consAnimationsTime,   ds_grid_height(Animations)-1,    -1); 
    
    ds_grid_resize(Animations, ds_grid_width(Animations), ds_grid_height(Animations)+1)