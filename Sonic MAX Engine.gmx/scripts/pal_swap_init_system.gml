///pal_swap_init_system(color support)
//Initiates the palette system.  To prevent slowdown, you are going to want to do this
//in some sort of controller object and add ALL of the palettes you are going to need
//right after this.  Trust me, you don't want to load palettes while your game is like...
//being played.  This is based on surface_getpixel() which is LUDICROUSLY slow.  So let's get it
//All done at once and never have to do it again.
//
//Oh, and pass the number of colors you want to support as an argument (if you need more than 16).
//And if you do, be sure to update the shader itself to add all the variables you need. (Instructions in the shader)
globalvar Pal_Map,Pal_Color_Count;
Pal_Map = ds_map_create();
if(argument_count>0)
    Pal_Color_Count=argument[0];
else
    Pal_Color_Count=16;