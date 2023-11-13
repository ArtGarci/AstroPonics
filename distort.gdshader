shader_type canvas_item;

uniform float onoff = 1.0; // 1 = ON, 0 = OFF 
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture;
// SHADER PARAMETER FOR NOISE 
uniform sampler2D noise : repeat_enable, filter_linear_mipmap; 

void fragment() {
	vec2 uv_offset = SCREEN_UV + texture(noise, UV).r * cos(TIME) * 0.05; // script shifts scale. 
	vec4 screenColor = texture(SCREEN_TEXTURE, uv_offset);
	COLOR = screenColor * onoff;  
}