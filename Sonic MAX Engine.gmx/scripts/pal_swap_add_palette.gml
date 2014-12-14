///pal_swap_add_palette(palette sprite index)
//adds a new palette to the system.  This keys off of the given palette sprite.
//
//palette sprites should be a 1 by X (x being how many colors you want to support) sprite
//with the first sub-image being the base sprite's palette, and any number of subsequent
//sub images that represent the alternate palettes.  
//OR it can be one large sprite with each palette being a column.
//The colors found in position Y in sub-image 1 will be replaced by the color in the same position
//for the assigned palette.
     
if(ds_map_exists(Pal_Map, argument[0]) == false)
{
    var _spr = argument[0];
    var _colors = sprite_get_height(_spr);
    var _palettes = ds_list_create();
    ds_map_add(Pal_Map,_spr,_palettes);
    //Draw the palette to a surface for reading.
    if(sprite_get_width(_spr)>1)
    {
        var _num = sprite_get_width(_spr);
        var _surface = surface_create(_num,_colors);
        surface_set_target(_surface)
        draw_sprite(_spr,0,0,0);
    }
    else
    {
        var _num = sprite_get_number(_spr);
        var _surface = surface_create(_num,_colors);
        surface_set_target(_surface)
        {
            for(var i=0; i<_num;i++)
                draw_sprite(_spr,i,i,0);
        }
    }
    //Get the Palettes
    for(var i=0; i<_num;i++)
    {
        var _pal = ds_list_create();
        for(var ii=0; ii<_colors;ii++)
        {
            ds_list_add(_pal,surface_getpixel(_surface,i,ii));
        }
        ds_list_add(_palettes,_pal);
    }    
    show_debug_message(string(_num)+" palettes added to the system from sprite: "+sprite_get_name(_spr));
    surface_reset_target();
    surface_free(_surface);
}
else
{
    show_debug_message("That palette has already been added to the system.");
}