//==========================================
//==== scrFindHoming(Object); ==============
//==========================================
// --- Find Nearest Homing object.

    HomingEnemy = noone;
    
    if(KeyLeft == false && KeyRight == false){
        
        // --- If holding neither left or right, find nearest in facing direction ---    
        if(image_xscale == 1)
            HomingEnemy = scrInstanceXthNearest(x, y, argument0, "x", x, ">=", 200);
        
        else if(image_xscale == -1)
            HomingEnemy = scrInstanceXthNearest(x, y, argument0, "x", x, "<=", 200);
        
    }else if(KeyLeft){
        // --- If holding left, find nearest to the left ---
        HomingEnemy = scrInstanceXthNearest(x, y, argument0, "x", x, "<=", 200);
    }else if(KeyRight){
        // --- If holding right, find nearest to the right ---
        HomingEnemy = scrInstanceXthNearest(x, y, argument0, "x", x, ">=", 200);
    }

    return HomingEnemy;