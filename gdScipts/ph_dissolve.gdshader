shader_type canvas_item;

const float SIZE = 0.02;
const float NOISE_SIZE = 0.05; 
uniform float onoff = 1.0; // 1 = ON, 0 = OFF 
uniform float weight : hint_range(0,1);
uniform sampler2D texture_2;
uniform float noise_spd = 0.0140;
uniform sampler2D noise : repeat_enable, filter_linear_mipmap; 
uniform vec4 edgeColor : source_color;

float easeInQuad(float x ) { return x * x; }

float circle_t (vec2 uv, vec2 pos, float radius) {
	float d = distance(pos, uv);
	return 1. - clamp(d / radius, 0. , 1.);
}

void fragment() {
	float radius = abs(2. * fract(TIME / 6.));
	radius = easeInQuad(radius);
	float shape = circle_t(UV, vec2(1.0), radius);
	float shape2 = shape + SIZE;
	
	vec4 color_a = texture(TEXTURE, UV);
	vec4 color_b = texture(texture_2, UV);
	
	float r = 0.1;
	vec2 st = UV;
	st.x = st.x - r * sin(TIME / noise_spd);
	st.y = st.y - r * cos(TIME / noise_spd); 
	vec4 dissolve_noise = texture(noise, UV);
	float n_1 = dissolve_noise.r * shape;
	float n_2 = dissolve_noise.r * shape2; 
	float s1 = step(n_1, NOISE_SIZE);
	float s2 = step(n_2, NOISE_SIZE);
	vec4 remapDissolve = vec4(1., 0., 0., 1.0);
	vec4 b1 = (1.0 - s1) * remapDissolve;
	vec4 b2 = (1. - s2) * vec4(1.0) - b1;
	
	vec4 step_a = mix(color_a, color_b, s1);
	vec4 step_b = mix (step_a, b2 * edgeColor, b2.r);
	COLOR = step_b * onoff;
}
