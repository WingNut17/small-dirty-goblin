extends Node2D

@onready var interaction_area = $InteractionArea
@onready var player = $"../../Player"
@onready var step_sis_doorto_hallway = $"../../StepSis_Bedroom/StepSisDoortoHallway"


# Called when the node enters the scene tree for the first time.
func _ready():
	if interaction_area != null:
		interaction_area.interact = Callable(self, "_on_interact")

# Changes the level when the door are is interacted with
func _on_interact():
	var dialogue_box_scene = preload("res://scenes/dialogue_box.tscn")

	# Check if the dialogue box scene loaded successfully
	if dialogue_box_scene != null:
		# Instance the dialogue box scene
		var dialogue_box_instance = dialogue_box_scene.instantiate()

		# Find the Player node in the scene
		var player_node = get_tree().get_first_node_in_group("player") # Adjust tahe path as per your scene structure

		# Check if the Player node is found
		if player_node != null:
			# Add the dialogue box as a child to the Player node
			player_node.add_child(dialogue_box_instance)

			# Alter the label text in the dialogue box scene
			var label = dialogue_box_instance.get_node("Label")  # Adjust the path as per your dialogue box scene structure
			if label != null:
				label.text = "(Knock Knock)"
				
				await get_tree().create_timer(1).timeout
				
				label.text = "She probably already left for school"
					
				await get_tree().create_timer(2).timeout
				
				dialogue_box_instance.queue_free()
