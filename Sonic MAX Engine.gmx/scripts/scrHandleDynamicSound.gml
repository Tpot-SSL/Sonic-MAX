///scrHandleDynamicSound(sndid, cutoff)

    CutOff = argument1;

    Distance = point_distance(x, y, global.Player[0].x, global.Player[0].y)
    if(Distance < CutOff)
        Level = 1-(Distance/CutOff)
    else
        Level = 0;

    audio_sound_gain(argument0, Level, 0)
    