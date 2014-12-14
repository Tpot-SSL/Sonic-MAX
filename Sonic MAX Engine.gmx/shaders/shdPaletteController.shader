//
// Simple passthrough vertex shader
// Don't need to do ANYTHING in here.  Go to the fragment shader.
attribute vec3 in_Position;                  // (x,y,z)
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~// Okay, So obviously we have a whole bunch of variables for the different colors.
// Right now this only supports 16 colors, which is enough for most SNES style, 16-bit
// Sprites.  If you want to support sprites with more colors, just look below for the
// Instructions in the comments.

uniform vec3 f_Colour0;
uniform vec3 f_Colour1;
uniform vec3 f_Colour2;
uniform vec3 f_Colour3;
uniform vec3 f_Colour4;
uniform vec3 f_Colour5;
uniform vec3 f_Colour6;
//uniform vec3 f_Colour15;
//uniform vec3 f_Colour16...17...etc 

uniform vec3 s_Colour0;
uniform vec3 s_Colour1;
uniform vec3 s_Colour2;
uniform vec3 s_Colour3;
uniform vec3 s_Colour4;
uniform vec3 s_Colour5;
uniform vec3 s_Colour6;
//uniform vec3 s_Colour15;
//uniform vec3 s_Colour16...17...etc 

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float ColorDistance(vec3 c1, vec3 c2)
{
    return distance(c1.rgb, c2.rgb);
}

void main()
{
    float threshold = 0.00000005;
    vec4 col = texture2D( gm_BaseTexture, v_vTexcoord );

    if(ColorDistance(col.rgb, f_Colour0.rgb) <=threshold )
    {
        col.rgb = s_Colour0.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour1.rgb) <=threshold )
    {
        col.rgb = s_Colour1.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour2.rgb) <=threshold )
    {
        col.rgb = s_Colour2.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour3.rgb) <=threshold )
    {
        col.rgb = s_Colour3.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour4.rgb) <=threshold )
    {
        col.rgb = s_Colour4.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour5.rgb) <=threshold )
    {
        col.rgb = s_Colour5.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour6.rgb) <=threshold )
    {
        col.rgb = s_Colour6.rgb;
    }/*
    else if(ColorDistance(col.rgb, f_Colour7.rgb) <=threshold )
    {
        col.rgb = s_Colour7.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour8.rgb) <=threshold )
    {
        col.rgb = s_Colour8.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour9.rgb) <=threshold )
    {
        col.rgb = s_Colour9.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour10.rgb) <=threshold )
    {
        col.rgb = s_Colour10.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour11.rgb) <=threshold )
    {
        col.rgb = s_Colour11.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour12.rgb) <=threshold )
    {
        col.rgb = s_Colour12.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour13.rgb) <=threshold )
    {
        col.rgb = s_Colour13.rgb;
    }
    else if(ColorDistance(col.rgb, f_Colour14.rgb) <=threshold )
    {
        col.rgb = s_Colour14.rgb;
    }*/
    //Duplicate this block as many times as necessary below, just change the two f_Colour16 to the correct values.
    //else if(ColorDistance(col.rgb, f_Colour16.rgb) <=threshold )
    //{
    //    col.rgb = s_Colour16.rgb;
    //}
    
    gl_FragColor = v_vColour * col;
    
}

