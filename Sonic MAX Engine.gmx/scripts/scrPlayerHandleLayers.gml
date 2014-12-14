    if(place_meeting(x, y, objSwitchLayer0))
        Layer = 0;    
      
    if(place_meeting(x, y, objSwitchLayer1))
        Layer = 1;    
    
    if(place_meeting(x, y, objSwitchLayer01)){
        if(Ground && Speed > 0)
            Layer = 1;
        else if(Ground && Speed < 0)
            Layer = 0;        
    }   