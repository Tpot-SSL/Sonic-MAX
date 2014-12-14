// ==== FUNCTION ====================================================================
// scrPlayerRefreshStreamEffect()
// ==================================================================================
// 


    if(Animation == "Rolling")
        exit;
    // Call this whenever a trail is created
    ds_list_clear(VertexX1);
    ds_list_clear(VertexY1);
    ds_list_clear(VertexX2);
    ds_list_clear(VertexY2);
    repeat(20){ 
        ds_list_add(VertexX1, floor(x)); 
        ds_list_add(VertexY1, floor(y));
        ds_list_add(VertexX2, floor(x)); 
        ds_list_add(VertexY2, floor(y));
    }
    