extends StaticBody2D

@onready var interaction_area: InteractionArea = $TrashCan

func _ready():
	pass
	# interaction_area.interact = Callable(self, "_on_interact")


func _on_interact():
	print("yo")


func _on_door_body_entered(body):
	get_tree().change_scene_to_file("res://scenes/next_room.tscn")
