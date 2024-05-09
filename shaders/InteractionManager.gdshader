shader_type canvas_item;

uniform float amplitude : hint_range(-10, 10) = 10;
uniform float frequency : hint_range(0.1, 10.0) = 1.0;

void vertex() {
	vec2 offset = vec2(0.0, amplitude * sin(TIME * frequency));
	VERTEX += offset;
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
