shader_type canvas_item;

uniform float similarity_threshold : hint_range(0.0, 1.0) = 0.1;
uniform float overlay_strength : hint_range(0.0, 1.0) = 0.5;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec4 base_color = texture(TEXTURE, UV);
	vec4 modified_color = base_color;

	// Calculate the similarity to yellow
	float similarity = length(base_color.rgb - vec3(1.0, 1.0, 0.0));

	// If the similarity is within the threshold, change to red
	if (similarity <= similarity_threshold) {
		modified_color.rgb = vec3(1.0, 0.0, 0.0);
	}

	// Mix the modified color with the original color based on the overlay strength
	vec4 final_color = mix(base_color, modified_color, overlay_strength);

	// Output the final color
	COLOR = final_color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
