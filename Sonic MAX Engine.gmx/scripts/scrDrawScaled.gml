///scrDrawScaled(sprite, image, x, y, scale, flip, rot, color, alpha);

    Scale   = argument4;
    Width   = objGlobal.Scale;
    Height  = objGlobal.Scale;
    X = (argument2-view_xview[0])*Width;
    Y = (argument3-view_yview[0])*Height;
    draw_sprite_ext(argument0, argument1, X, Y, (Width/Scale)*argument5, Height/Scale, argument6, argument7, argument8)