
// ==== FUNCTION ====================================================================
// scrRotateTowardsAngle(Origin, Destiny, Step)
// ==================================================================================

    var _AngleDifference;
    _AngleDifference = argument1-argument0;

    // -------------------------------------------------------------------------------------
    if (_AngleDifference == 0) return argument0;
    
    if (abs(_AngleDifference) < 180)
        if ((_AngleDifference) < 0) {
            argument0 -= argument2;
            if (argument0 <= argument1) argument0 = argument1;
        } else {
            argument0 += argument2;
            if (argument0 >= argument1) argument0 = argument1;
        }
    else
        if (_AngleDifference < 0) argument0 += argument2;
        else                      argument0 -= argument2;    
    
    return scrWrapAngle(argument0);