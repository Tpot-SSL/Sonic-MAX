///pal_swap_set(shader instance,palette sprite,palette index)
//Sets the palette swap shader for the given palette.  
//Anything drawn afterwards and until reset will draw using the given palette.
/*
    Usage: 
    pal_swap_set(spr_palette);
    { //I use brackets for code readability, but it is not necessary.
        draw_sprite(sprite,number,x,y);
    }
    pal_swap_reset();
*/
var _shader=argument[0];
var _spr = argument[1];
var _pal = argument[2];
var _pal =clamp(_pal,0,pal_swap_get_pal_count(_spr)-1);
if(shader_is_compiled(_shader) && _pal>0)
{
    //show_debug_message("Drawing with palette: "+string(_pal));
    shader_set(_shader);
    var _palettes = ds_map_find_value(Pal_Map,_spr); //Load the palettes list.
    var _colors = ds_list_find_value(_palettes,0); //get the list of colors for default palette.
    //Load the colors in the original palette.  These are our "Find" colors (thus the f)
    for(var i=0; i< ds_list_size(_colors); i++)
    {
        var _col = ds_list_find_value(_colors,i);
        var _r = color_get_red(_col)/255;
        var _g = color_get_green(_col)/255;
        var _b = color_get_blue(_col)/255;
        shader_set_uniform_f(shader_get_uniform(_shader,"f_Colour"+string(i)),_r,_g,_b);
    }
    //Now load the colors for the desired palette.  These are our "Set" colors (thus the s)
    var _colors = ds_list_find_value(_palettes,_pal); //get the list of colors for the alternate palette
    for(var i=0; i< ds_list_size(_colors); i++)
    {
        var _col = ds_list_find_value(_colors,i);
        var _r = color_get_red(_col)/255;
        var _g = color_get_green(_col)/255;
        var _b = color_get_blue(_col)/255;
        shader_set_uniform_f(shader_get_uniform(_shader,"s_Colour"+string(i)),_r,_g,_b);
    }
    //I might be able to optimize this further by storing the colors in a grid of rgb values rather than a list of colors.
    //Let me know if you find this to be slow and are too lazy to figure out how to optimize it for yourself (Says the guy who is too lazy to optimize it for himself)
}
else if (!shader_is_compiled(_shader))
    show_debug_message("Shader did not compile correctly. Crap.");
/*If you don't see the debug message and it doesn't seem to be working, it must be your palette or your sprite.
Remember, the first image in your palette should have all the colors of the sprite you are trying to draw.
I use those colors to find and replace them with the colors in your other palette sub images.  This is VITAL, and the only way
I could see to get something like this to work.