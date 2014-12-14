
// ==== FUNCTION ====================================================================
// scrWrapAngle(angle)
// ==================================================================================
//  Wraps angle within 0 to 359 range.

    var Var;
    Var = argument0
    while(Var < 0.0)     Var += 360;
    while(Var >= 360.0)  Var -= 360;
    return Var;