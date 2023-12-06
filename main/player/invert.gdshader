shader_type canvas_item;
render_mode unshaded;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

void fragment() {
    	// Get rgb values from screen.
    	vec3 c = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgb;
    	// Invert them.
    	c.rgb = 1.0 - c.rgb;
    	// Asign them to the cursor.
    	COLOR.rgb = c;
    	// Asign the original alpha value.
    	COLOR.a = texture(TEXTURE, UV).a;
    }

//void fragment() {
//	vec4 color = textureLod(SCREEN_TEXTURE, SCREEN_UV, 0.0).rgba ;
//
//	if(color.a > 0.5) {
//		color.r = 1.0 - color.r;
//		color.g = 1.0 - color.g;
//		color.b = 1.0 - color.b;
//	}
//	COLOR.rgba = color;
//}