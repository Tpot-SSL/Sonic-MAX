
    Angle      = 0;
    AngleMode  = 0;
    var Player;
    Player1   = global.Player[0];
    Dir       = point_direction(x, y, Player1.x, Player1.y);
    x        += lengthdir_x(3, Dir);
    y        += lengthdir_y(3, Dir);

    if(sign(lengthdir_x(3, Dir)) != 0)
        image_xscale = sign(lengthdir_x(3, Dir))

    Speed     = 0;
    Gravity   = 0;
    if(distance_to_object(Player1) < 5)
        Action      = consActionFly;
    