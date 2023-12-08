shader_type canvas_item;
render_mode unshaded;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

bool colorIsInValidRange(vec3 color) {
//	vec3 GRAY = vec3(0.745098, 0.745098, 0.745098);
	vec3 GRAY = vec3(0.5, 0.5, 0.5);
	vec3 WHITE = vec3(0.9, 0.9, 0.9);
	return (color.r > GRAY[0] && color.g > GRAY[1] && color.b > GRAY[2]) || // the color is greater than grey
			(color.r <= WHITE[0] && color.g <= WHITE[1] && color.b <= WHITE[2]); // the color is a shade of white
}

void fragment() {
	if(colorIsInValidRange(COLOR.rgb)) {
		// Get rgb values from screen.
		vec3 c = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgb;
		// Invert them.
		c.rgb = 1.0 - c.rgb;
		// Asign them to the cursor.
		COLOR.rgb = c;
		// Asign the original alpha value.
		COLOR.a = texture(TEXTURE, UV).a;
	}
}