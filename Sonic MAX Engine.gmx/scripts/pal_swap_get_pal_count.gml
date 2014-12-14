///pal_swap_get_pal_count(palette sprite)
//returns the number of palettes for the given sprite.
//Useful for clamping palette selection.
return(ds_list_size(ds_map_find_value(Pal_Map,argument[0])));