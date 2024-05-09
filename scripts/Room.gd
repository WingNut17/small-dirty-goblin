extends StaticBody2D

var inside_area = false

func _process(_delta):
	if inside_area and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://scenes/next_room.tscn")


func _on_area_2d_area_entered(_area):
	inside_area = true

func _on_door_area_exited(_area):
	inside_area = false
