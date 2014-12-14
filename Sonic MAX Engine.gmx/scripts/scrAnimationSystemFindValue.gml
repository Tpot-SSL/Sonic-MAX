
    i = 0;
    repeat(ds_grid_height(Animations)+1){
        if(ds_grid_get(Animations, consAnimationsName, i) == argument0){
            return i;
            break;
        }
        i += 1;
    }
    return 0;