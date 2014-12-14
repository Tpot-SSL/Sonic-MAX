///scrParallaxAddBG(sprite_index, layers, layer_speed, speed, id)
Spr = argument0;
Layers = argument1;
LayerSpeed = argument2;
Speed = argument3;
Id  = argument4;

ds_grid_add(global.Parallax, Id, 0, Spr);
ds_grid_add(global.Parallax, Id, 1, Layers);
ds_grid_add(global.Parallax, Id, 2, LayerSpeed);
ds_grid_add(global.Parallax, Id, 3, Speed);