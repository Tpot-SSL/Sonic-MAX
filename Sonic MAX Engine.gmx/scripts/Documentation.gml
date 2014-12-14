/*
 THIS IS A HUGE W.I.P.
 >> ----------- Constants/Macros ------------------
    Sonic MAX commonly uses a type of variable called a Constant, which can be edited under Macros in GameMaker: Studio.
    Various constants include:
      - Actions
      - Animation Values
      - Monitors
      - Characters

 >> ----------- VARIOUS NOTES ------------------
   - Anything called upon startup is called by objGlobal in the Game Start event. objGlobal is active in all rooms, and handles all the global data.


 >> ----------- PLAYER NOTES ------------------
   - Various values and flags such as collision modes, and animation data can be changed/accesed in the create event of objPlayer, all of the Player-based code is
   within this object(With minimal exceptions).
   - Animations are added by scripts, just call the script with the arguments given, and the animation will be added to the character.
   Animations are handled in the End Step event, but created in the Create event.
   All of the animations are created within scrReloadAnimations(), which is called in the create event.
   - Some Player values can be edited in the Create event, but others have to edited in the Begin Step event, where all the physics values are handled.
    

 >> ----------- PLAYER INPUT MANAGMENT ------------------
   The Input Management script in the Player's step event handles most of the basic movement based on key presses such as acceleration and deceleration when holding or 
   not holding left and right.

  Index
    1. Input Alarm
    

   >> 1. Input Alarm -------------

       The variable InputAlarm is used to disable movement from key presses after sliding down from lack of speed, or hitting a spring horizontally.

   >> ----------------------------
  >> ---------------------------------------------