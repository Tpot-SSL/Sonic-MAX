
    if(Underwater == true){
        Bubble = collision_rectangle(x-9, y-10, x+9, y+10, objBubble, true, true);
        if(Bubble != noone && Ground == false){
            if(Bubble.image_index == 5 && Animation != "Breath"){
                Bubble.image_speed = 0.2;
                UnderwaterTimer = 1200;
                Speed = 0;
                Gravity = 0;
                Animation = "Breath";
                Action = ActionNormal;
                audio_play_sound(sndPlayerGetAir, 1, false);
                
            }
        }
    }
