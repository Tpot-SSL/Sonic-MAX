///scrReloadAnimations(reload)




    if(argument0 == false)    
        scrAnimationSystemCreate();  
    else{
        ds_grid_destroy(Animations)
        scrAnimationSystemCreate();   
    }
    if(CharacterId == consCharacterSonic){
        if(SuperForm == false){
            scrAnimationSystemAddSimple("Idle", 0, sprS2SonicIdle);
            scrAnimationSystemAddSimple("Blink", 0, sprS2SonicBlink);
            scrAnimationSystemAddSimple("IdleWait0", 0, sprS2SonicIdleWait0);
            scrAnimationSystemAddSimple("IdleWait1", 0.055, sprS2SonicIdleWait1);
            scrAnimationSystemAddSimple("IdleWait2", 0, sprS2SonicIdleWait2); 
            scrAnimationSystemAdd("IdleWait3", 0.08, sprS2SonicIdleWait3, 1);
            scrAnimationSystemAdd("CrouchDown", 0.15, sprS2SonicCrouchDown, 1);
            scrAnimationSystemAdd("LookUp", 0.15, sprS2SonicLookUp, 1);
            scrAnimationSystemAddSimple("Pushing", 0.03125, sprS2SonicPush);
            scrAnimationSystemAddSimple("Dead", 0, sprS2SonicDead);
    
            scrAnimationSystemAddSimple("Walking", 0.125, sprS2SonicWalk);
            scrAnimationSystemAddSimple("Running", 0.125, sprS2SonicRun);

            scrAnimationSystemAddSimple("Fall", 0.125, sprS2SonicFall);
    
            scrAnimationSystemAddRepeat("Skidding", 0.125, sprS2SonicSkid, false, 1, "Walking");
            scrAnimationSystemAddSimple("Hurt", 0.1, sprS2SonicHurt);
    
            scrAnimationSystemAddSimple("BalanceIn",   0.05, sprS2SonicBalanceIn);
            scrAnimationSystemAddSimple("BalanceOut",  0.1, sprS2SonicBalanceOut);
            scrAnimationSystemAddSimple("BalanceOut2", 0.25, sprS2SonicBalanceOut2);
    
            scrAnimationSystemAddSimple("Rolling",  0.2,  sprS2SonicRoll);
            scrAnimationSystemAddSimple("Spindash", 1,  sprS2SonicSpindash);
    
            scrAnimationSystemAddSimple("Spring", 0, sprS2SonicSpring);
            scrAnimationSystemAdd("Peelout", 0.5, sprS2SonicPeelout, 11);
    
            scrAnimationSystemAddTime("Breath", sprS2SonicBreath, 24, "Idle");
            scrAnimationSystemAdd("Transform", 0.2, sprS2SonicTransform,  12);
            scrAnimationSystemAddSimple("Grab", 0.05, sprS2SonicGrab);
            scrAnimationSystemAddSimple("Corkscrew", 0, sprS2SonicCorkscrew);

            scrAnimationSystemAdd("OuttaHere", 0.1, sprS2SonicOuttaHere, 8);
        }else{
            scrAnimationSystemAddSimple("Idle", 0.1, sprS2SuperSonicIdle);
            scrAnimationSystemAdd("CrouchDown", 0.15, sprS2SuperSonicCrouch, 1);
            scrAnimationSystemAdd("LookUp", 0.15, sprS2SuperSonicLookUp, 1);
            scrAnimationSystemAddSimple("Pushing", 0.03125, sprS2SuperSonicPush);
            scrAnimationSystemAddSimple("Dead", 0, sprS2SonicDead);
    
            scrAnimationSystemAddSimple("Walking", 0.125, sprS2SuperSonicWalk);
            scrAnimationSystemAddSimple("Running", 0.125, sprS2SuperSonicRun);
    
            scrAnimationSystemAddRepeat("Skidding", 0.125, sprS2SuperSonicSkid, false, 1, "Walking");
            scrAnimationSystemAddSimple("Hurt", 0.1, sprS2SuperSonicHurt);
    
            scrAnimationSystemAddSimple("BalanceIn",   0.06, sprS2SuperSonicBalance);
            scrAnimationSystemAddSimple("BalanceOut",  0.06, sprS2SuperSonicBalance);
            scrAnimationSystemAddSimple("BalanceOut2", 0.06, sprS2SuperSonicBalance);
    
            scrAnimationSystemAddSimple("Rolling",  0.2,  sprS2SuperSonicRoll);
            scrAnimationSystemAddSimple("Spindash", 0.3,  sprS2SuperSonicSpindash);
    
            scrAnimationSystemAddSimple("Spring", 0, sprS2SuperSonicSpring);
    
            scrAnimationSystemAddTime("Breath", sprS2SuperSonicBreath, 24, "Idle");
            scrAnimationSystemAddSimple("Grab", 0.05, sprS2SuperSonicGrab);
            scrAnimationSystemAddSimple("Corkscrew", 0, sprS2SuperSonicCorkscrew);
        }
    }else if(CharacterId == consCharacterTails){
        scrAnimationSystemAddSimple("Idle", 0, sprS2TailsIdle);
        scrAnimationSystemAddSimple("Blink", 0.1, sprS2TailsBlink);
        scrAnimationSystemAddSimple("IdleWait0", 0, sprS2TailsWait1);
        scrAnimationSystemAddSimple("IdleWait1", 0.15, sprS2TailsWait2);
        scrAnimationSystemAdd("CrouchDown", 0.15, sprS2TailsCrouch, 0);
        scrAnimationSystemAdd("LookUp", 0.15, sprS2TailsLookUp, 0);
        scrAnimationSystemAddSimple("Pushing", 0.03125, sprS2TailsPush);
        scrAnimationSystemAddSimple("Dead", 0, sprS2TailsDead);
    
        scrAnimationSystemAddSimple("Walking", 0.125, sprS2TailsWalk);
        scrAnimationSystemAdd("Running", 0.125, sprS2TailsRun, 4);
    
        scrAnimationSystemAddRepeat("Skidding", 0.125, sprS2TailsSkid, false, 1, "Walking");
        scrAnimationSystemAddSimple("Hurt", 0.1, sprS2TailsHurt);
    
        scrAnimationSystemAddSimple("BalanceIn",   0.06, sprS2TailsBalance);
        scrAnimationSystemAddSimple("BalanceOut",  0.06, sprS2TailsBalance);
        scrAnimationSystemAddSimple("BalanceOut2", 0.06, sprS2TailsBalance);
    
        scrAnimationSystemAddSimple("Rolling",  0.5,  sprS2TailsRolling);
        scrAnimationSystemAddSimple("Spindash", 1,  sprS2TailsSpindash);
    
        scrAnimationSystemAddSimple("Spring", 0, sprS2TailsSpring);
    
        scrAnimationSystemAddTime("Breath", sprS2TailsBreath, 24, "Idle");
        
        scrAnimationSystemAddSimple("Fly", 0.5, sprS2TailsFly);
        scrAnimationSystemAddSimple("FlyTired", 0.083, sprS2TailsFlyTired);
    
        scrAnimationSystemAddSimple("Swim", 0.25, sprS2TailsSwim);
        scrAnimationSystemAddSimple("SwimTired", 0.083, sprS2TailsSwimTired);
        
        scrAnimationSystemAddSimple("Grab", 0.01, sprS2TailsGrab);
        
        scrAnimationSystemAddSimple("Corkscrew", 0, sprS2TailsCorkscrew);
        
    }else if(CharacterId == consCharacterKnuckles){
        scrAnimationSystemAddSimple("Idle", 0, sprKnucklesIdle);
        scrAnimationSystemAdd("CrouchDown", 0.125, sprKnucklesCrouch, 1);
        scrAnimationSystemAdd("LookUp", 0.15, sprKnucklesLookUp, 1);
        scrAnimationSystemAddSimple("Pushing", 0.03125, sprKnucklesPush);
        scrAnimationSystemAddSimple("Dead", 0, sprKnucklesDead);
    
        scrAnimationSystemAddSimple("Walking", 0.125, sprKnucklesWalk);
        scrAnimationSystemAddSimple("Running", 0.125, sprKnucklesRun);
    
        scrAnimationSystemAddRepeat("Skidding", 0.125, sprKnucklesSkid, false, 1, "Walking");
        scrAnimationSystemAddSimple("Hurt", 0.1, sprKnucklesHurt);
    
        scrAnimationSystemAddRepeat("Balance",   0.1, sprKnucklesBalance1, 5, 1, "Balance2");
        scrAnimationSystemAddRepeat("Balance2",  1, sprKnucklesBalance2, 0, 120, "Balance3");
        scrAnimationSystemAdd("Balance3",  0.1, sprKnucklesBalance3, 1);
        
        scrAnimationSystemAddSimple("Rolling",  0.2,  sprKnucklesRoll);
        scrAnimationSystemAddSimple("Spindash", 1,  sprKnucklesSpindash);
    
        scrAnimationSystemAddSimple("Spring", 0, sprKnucklesSpring);
    
        scrAnimationSystemAddTime("Breath", sprKnucklesBreath, 24, "Idle");
        
        scrAnimationSystemAddSimple("Grab", 0.05, sprKnucklesGrab);
        
        scrAnimationSystemAddSimple("Glide", 0, sprKnucklesGlide);
        scrAnimationSystemAdd("GlideFall", 0.1, sprKnucklesGlideFall, 1);
        scrAnimationSystemAddSimple("GlideSlide", 0, sprKnucklesGlideSlide);
        scrAnimationSystemAddRepeat("GlideSlide2", 0.1, sprKnucklesGlideSlide, 1, 1, "Idle");
        scrAnimationSystemAddSimple("Climb", 0, sprKnucklesClimb);
        scrAnimationSystemAddRepeat("ClimbRise", 0.1, sprKnucklesClimbRise, 2, 1, "Idle");
        
        scrAnimationSystemAddSimple("Corkscrew", 0, sprKnucklesCorkscrew);
    }
