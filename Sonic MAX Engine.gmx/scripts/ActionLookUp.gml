
    if(KeyUp == false)
        Action = ActionNormal;

    if(KeyAPressed && UsePeelout == true && CharacterId == consCharacterSonic && SuperForm == false){
        SpindashFrame = global.Frame;
        audio_play_sound(sndPeelout, 1, false);
        Action = ActionPeelout;
    }else if(KeyAPressed && Ground == true)
        scrPlayerJump();
