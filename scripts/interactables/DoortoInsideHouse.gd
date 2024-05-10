extends Node2D

@onready var interaction_area = $InteractionArea
@onready var player = $"../../Player"
const INSIDE_HOUSE = preload("res://scenes/inside_house.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	if interaction_area != null:
		interaction_area.interact = Callable(self, "_on_interact")

# Changes the level when the door are is interacted with
func _on_interact():
	var inside_house_instance = INSIDE_HOUSE.instantiate()
	inside_house_instance.global_position = Vector2(102, 427)
	get_tree().get_root().add_child(inside_house_instance)
