shader_type canvas_item;

uniform float blur :hint_range(0.0,10.0);
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
	// Place fragment code here.
	COLOR = texture(SCREEN_TEXTURE, SCREEN_UV, blur);
}