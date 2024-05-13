extends Node2D

@onready var interaction_area = $InteractionArea
@onready var player = $"../../Player"
@onready var hallway_doorto_main_room = $"../../Hallway/HallwayDoortoMainRoom"


# Called when the node enters the scene tree for the first time.
func _ready():
	if interaction_area != null:
		interaction_area.interact = Callable(self, "_on_interact")

# Changes the level when the door are is interacted with
func _on_interact():
	player.global_position = hallway_doorto_main_room.global_position
