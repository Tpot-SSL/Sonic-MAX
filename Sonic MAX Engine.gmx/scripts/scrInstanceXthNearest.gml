//scrInstanceXthNearest(x, y, Ins, Var, Value, Symbol, MaxDist)

  
   var X, Y, Ins, Val, Sym, Dist, FinalIns, Instance, i, i2, Dir;
  
    X           = argument0;
    Y           = argument1;
    Ins         = argument2;
    Var         = argument3;
    Val         = argument4;
    Sym         = argument5;
    Dist        = argument6;
    FinalIns    = noone;

    i = 1;
    repeat(instance_number(Ins)){
        Instance = scrInstanceNthNearest(X, Y, Ins, i);
        if(point_distance(X, Y, Instance.x, Instance.y) > Dist || Instance == noone)
            break;
        Variable = Instance.x;
        i2 = -6;
        Dir = point_direction(X, Y, Instance.x, Instance.y);
       // Continue = false;

        if(Instance.mask_index == sprMaskNull){
            i += 1;
            continue;
        }
            
        switch(Sym){
            case "=":
            case "==":
                if(Variable == Val){
                    return Instance;  
                    exit;
                }
                break;
            case ">":
                if(Variable > Val)
                    return Instance;  
                break;
            case "<":
                if(Variable < Val)
                    return Instance;  
                break;
            case ">=":
                if(Variable >= Val)
                    return Instance;  
                break;
            case "<=":
                if(Variable <= Val)
                    return Instance;                
                break;
            case "!=":
            case "<>":
                if(Variable != Val)
                    return Instance;             
                break;
        }
        i += 1;
           
    }
    return noone;