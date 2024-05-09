extends Node2D

@onready var interaction_area = $InteractionArea


# Called when the node enters the scene tree for the first time.
func _ready():
	if interaction_area != null:
		interaction_area.interact = Callable(self, "_on_interact")
	
func _on_interact():
	# Load the dialogue box scene
	var dialogue_box_scene = preload("res://scenes/dialogue_box.tscn")
	# Instance the dialogue box scene
	var dialogue_box_instance = dialogue_box_scene.instantiate()
	# Find the Player node in the scene
	var player_node = get_tree().get_first_node_in_group("player") # Adjust tahe path as per your scene structure
	# Add the dialogue box as a child to the Player node
	player_node.add_child(dialogue_box_instance)
	# Alter the label text in the dialogue box scene
	var label = dialogue_box_instance.get_node("Label")  # Adjust the path as per your dialogue box scene structure
	if label != null:
		label.text = "(I smashed this thing in a blind gamer rage)"
		
		# Delete the dialogue box after 2 seconds
		await get_tree().create_timer(2).timeout
		dialogue_box_instance.queue_free()
