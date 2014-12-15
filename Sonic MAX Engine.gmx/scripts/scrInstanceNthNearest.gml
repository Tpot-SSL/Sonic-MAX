///instance_nth_nearest(x,y,obj,n);
/*
**  Usage:
**      inst = instance_nth_nearest(x,y,obj,n);
**
**  Arguments:
**      x,y       a point
**      obj       an object_index, or keyword "all"
**      n         proximity
**
**  Return:
**      inst      (n)th nearest instance id of type
**                (object) to the given point (x,y),
**                or keyword "noone" if none found.
**
**  GMLscripts.com
*/

    var pointx, pointy, object, n, list, nearest;
    pointx   = argument0;
    pointy   = argument1;
    object   = argument2;
    n        = argument3;
    
    n        = min(max(1 ,n),instance_number(object));
    list     = ds_priority_create();
    nearest  = noone;
    
    with (object) 
        ds_priority_add(list,id,distance_to_point(pointx,pointy));
        
    repeat (n) 
        nearest = ds_priority_delete_min(list);
        
    ds_priority_destroy(list);
    return nearest;
