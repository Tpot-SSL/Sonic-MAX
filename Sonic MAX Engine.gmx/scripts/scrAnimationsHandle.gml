
    switch(Action){    
        case consActionNormal:
            //--- Running ----
            if(abs(Speed) >= 6 && (Animation != "Breath"|| Ground == true))
                Animation = "Running";
            //--- Walking -----
            else if(((abs(Speed) > 0 && abs(Speed) < 6) || KeyLeft || KeyRight) &&(Animation != "Breath"|| Ground == true))  
                Animation = "Walking";
            else if(Speed == 0 && Angle == 0 && Ground){
                if(CharacterId != consCharacterKnuckles){
                    //---- Balancing -----------
                    if((RightEdge > 4 && RightEdge < 10 && image_xscale == 1) || (LeftEdge > 4 && LeftEdge < 10 && image_xscale == -1))
                        Animation = "BalanceOut";
                    else if((RightEdge <= 4 && image_xscale == 1) || (LeftEdge <= 4 && image_xscale == -1))
                        Animation = "BalanceOut2";
                    else if((LeftEdge < 10 && image_xscale == 1)|| (RightEdge < 10 && image_xscale == -1))
                        Animation = "BalanceIn";
                    //--------------------------
                    else if(Animation != "Breath"){
                        if(CharacterId == consCharacterSonic && SuperForm == false){
                        //_________________________________\\
                        //____________SONIC________________\\
                        //_________________________________\\
                            AnimationTotalFrames += 1;
                            if(AnimationTotalFrames <= 180)
                                Animation = "Idle"; 
                            else if(AnimationTotalFrames > 180 && AnimationTotalFrames <= 186)
                                Animation = "Blink";
                            else if(AnimationTotalFrames > 186 && AnimationTotalFrames <= 216)
                                Animation = "IdleWait0";
                            else if((AnimationTotalFrames > 216 && AnimationTotalFrames <= 360) || (AnimationTotalFrames > 420 && AnimationTotalFrames <= 564)
                            || (AnimationTotalFrames > 624 && AnimationTotalFrames <= 768) || (AnimationTotalFrames > 828 && AnimationTotalFrames <= 972))
                                Animation = "IdleWait1";
                            else if((AnimationTotalFrames > 360 && AnimationTotalFrames <= 420) || (AnimationTotalFrames > 564 && AnimationTotalFrames <= 624) 
                            || (AnimationTotalFrames > 768 && AnimationTotalFrames <= 828) || (AnimationTotalFrames > 972 && AnimationTotalFrames <= 1032))
                                Animation = "IdleWait2";
                            else if(AnimationTotalFrames > 1032)
                                Animation = "IdleWait3";
                        }else if(CharacterId == consCharacterTails){
                        //_________________________________\\
                        //____________TAILS________________\\
                        //_________________________________\\
                            AnimationTotalFrames += 1;
                            if(AnimationTotalFrames <= 120 ||(AnimationTotalFrames > 140 && AnimationTotalFrames <= 240)||(AnimationTotalFrames > 260 && AnimationTotalFrames <= 300))
                                Animation = "Idle"; 
                            else if((AnimationTotalFrames > 120 && AnimationTotalFrames <= 140) || AnimationTotalFrames > 240 && AnimationTotalFrames <= 260)
                                Animation = "Blink";
                            else if(AnimationTotalFrames > 300 && AnimationTotalFrames <= 480)
                                Animation = "IdleWait0";
                            else if((AnimationTotalFrames > 480 && AnimationTotalFrames <= 560))
                                Animation = "IdleWait1";
                            else if((AnimationTotalFrames > 560)){
                                Animation = "IdleWait0";
                                AnimationTotalFrames = 301;
                            }
                        //_________________________________\\
                        //____________SUPER SONIC__________\\
                        //_________________________________\\
                        }else if(CharacterId == consCharacterSonic && SuperForm == true){
                            Animation = "Idle";  
                        //_________________________________\\
                        //____________OTHER_CHAR___________\\
                        //_________________________________\\ 
                        }else{
                            Animation = "Idle"; 
                        }
                    }else if(Ground){
                        Animation = "Idle";  
                    }
                }else{
                    //_________________________________\\
                    //____________KNUCKLES_____________\\
                    //_________________________________\\
                    if((RightEdge < 10 || LeftEdge < 10) && Animation != "Balance2" && Animation != "Balance3"){
                        Animation = "Balance";   
                    }else if((RightEdge >= 10 && LeftEdge >= 10)){
                        Animation = "Idle";     
                    }
                }
            }else if(Ground){
                Animation = "Idle";  
            }else if(Animation != "Breath"){
                if(Fan == false)
                    Animation = "Walking";
                else
                    Animation = "Corkscrew";
            }
            break;
        case consActionJumping:
        case consActionRolling:
        case consActionPipe:
            Animation = "Rolling";
            break;
        case consActionSpindash:
            if(Spindash == 2)
                Animation = "Rolling";
            else
                Animation = "Spindash";
            break;
        case consActionCrouchDown:
            Animation = "CrouchDown";
            break;
        case consActionQuicksand:
            Animation = "Rolling";
            break;
        case consActionSpring:
            if(Gravity <= 0 && Animation != "Corkscrew")
                Animation = "Spring";
            else if(Animation != "Corkscrew")
                Animation = "Walking";
            break;
        case consActionSkid:
            Animation = "Skidding";
            break;
        case consActionPush:
            Animation = "Pushing";
            break;
        case consActionHurt:
        case consActionSlide:
            Animation = "Hurt";
            break;
        case consActionDead:
            Animation = "Dead";
            break;
        case consActionLookUp:
            Animation = "LookUp";
            break;
        case consActionGlide:
            Animation = "Glide";
            break;
        case consActionGlideFall:
            Animation = "GlideFall";
            break;
        case consActionPeelout:
            Animation = "Peelout";
            break;
        case consActionClimb:
            Animation = "Climb";
            break;
        case consActionClimbRise:
            if(Animation != "Idle")
                Animation = "ClimbRise";
            break;
        case consActionGlideSlide:
            if(Animation != "GlideSlide2" && Animation != "Idle")
                Animation = "GlideSlide";
            break;
        case consActionTransform:
            if(Animation != "Transform")
                Animation = "Transform";
            break;
        case consActionOuttaHere:
            if(Animation != "OuttaHere")
                Animation = "OuttaHere";
            break;
        case consActionFly:
            if(Underwater == false){
                if(FlyTimer > 0)
                    Animation = "Fly";
                else
                    Animation = "FlyTired";
            }else{
                if(FlyTimer > 0)
                    Animation = "Swim";
                else
                    Animation = "SwimTired";
            }
            break;
        case consActionGrab:
            if(Animation != "Grab")
                Animation = "Grab";
            break;
        case consActionCPURespawn:
            if(CharacterId == consCharacterTails){
                if(Underwater == false)
                    Animation = "Fly";
                else
                    Animation = "Swim";         
            }else if(CharacterId == consCharacterKnuckles){
                Animation = "Glide";
                image_index = 1;                
            }else
                Animation = "Rolling";    
            break;
        case consActionCorkscrew:
            if(Animation != "Corkscrew" && Animation != "Rolling")
                Animation = "Corkscrew";
            break;
    }