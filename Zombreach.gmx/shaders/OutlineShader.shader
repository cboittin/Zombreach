//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec4 outlineColor;
uniform float outlineSize;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Sprite outline shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float outlineSize;
uniform float texelWidth;
uniform float texelHeight;
uniform vec4 outlineColor; 

void main()
{
  vec2 offsetx = vec2(outlineSize * texelWidth, 0.0);
  vec2 offsety = vec2(0.0, outlineSize * texelHeight);
  
  float blend = 0.0;
  float alpha = texture2D( gm_BaseTexture, v_vTexcoord ).a;
  if(alpha < .001) {
      alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsetx).a);
      alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord + offsety).a);
      alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsetx).a);
      alpha += ceil(texture2D( gm_BaseTexture, v_vTexcoord - offsety).a);
      if(alpha > .001)
          blend = 1.0;
  }
  
  gl_FragColor = (1.0 - blend) * v_vColour * texture2D( gm_BaseTexture, v_vTexcoord )
                + blend * outlineColor;
                /*
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    gl_FragColor.a = alpha;*/
}
