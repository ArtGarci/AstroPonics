shader_type canvas_item;

uniform float scale : hint_range(0.1, 10) = 2.0;

void fragment() {
	vec2 distortedUV = UV;
	distortedUV.x += distortedUV.y * scale;
	vec4 pixelColor = texture(TEXTURE, UV * scale);
	COLOR = pixelColor;
}
