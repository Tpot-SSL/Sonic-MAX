
    if(KeyUp == false)
        Action = consActionNormal;

    if(KeyAPressed && UsePeelout == true && CharacterId == consCharacterSonic && SuperForm == false){
        SpindashFrame = global.Frame;
        audio_play_sound(sndPeelout, 1, false);
        Action = consActionPeelout;
    }else if(KeyAPressed && Ground == true)
        scrPlayerJump();