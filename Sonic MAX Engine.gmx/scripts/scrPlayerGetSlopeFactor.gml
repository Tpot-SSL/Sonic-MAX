
    if((Angle < 45 || Angle > 315) && round(Speed) == 0 && SlopeFactorMode == 0)
        return 0;

    if((Angle < 22 || Angle > 315) && round(Speed) == 0 && SlopeFactorMode == 1)
        return 0;

    if((Angle < 22 || Angle > 337) && round(Speed) == 0 && SlopeFactorMode == 2)
        return 0;

         
    return 0.125*Sin[Angle];    