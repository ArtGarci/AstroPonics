shader_type canvas_item;
render_mode blend_mix;
uniform sampler2D SCREEN_TEXTURE : hint_default_black;
//, filter_linear_mipmap;
// hint_black
uniform float blur_amount : hint_range(0, 5) = 0.0;

void fragment() {
    COLOR = textureLod(SCREEN_TEXTURE, SCREEN_UV, blur_amount);
}