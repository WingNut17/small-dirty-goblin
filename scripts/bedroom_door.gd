extends Node2D

@onready var interaction_area = $InteractionArea


# Called when the node enters the scene tree for the first time.
func _ready():
	if interaction_area != null:
		interaction_area.interact = Callable(self, "_on_interact")

# Changes the level when the door are is interacted with
func _on_interact():
	get_tree().change_scene_to_file("res://scenes/next_room.tscn")
