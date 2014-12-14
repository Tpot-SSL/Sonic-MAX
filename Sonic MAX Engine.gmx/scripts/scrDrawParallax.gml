    

    Spr     = ds_grid_get(global.Parallax, argument0, 0);
    Layers  = ds_grid_get(global.Parallax, argument0, 1);
    Speed   = ds_grid_get(global.Parallax, argument0, 3);
    i3 = 0;
    repeat(room_width/sprite_get_width(Spr)){
        i = 1;
        i2 = 0;
        repeat(Layers){
            draw_sprite_part(Spr, argument2, 0, i2, sprite_get_width(Spr), sprite_get_height(Spr)/Layers, ((view_xview[0]*Speed)*i)+i3, view_yview[0]+argument1+(i2));
            i2 += sprite_get_height(Spr)/Layers;
            i -= ds_grid_get(global.Parallax, argument0, 2);
        }
        i3 += sprite_get_width(Spr);
    }