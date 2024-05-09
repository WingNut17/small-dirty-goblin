extends Node2D

@onready var player = $Player
const TRUCK = preload("res://scenes/truck.tscn")
var truck_instance = TRUCK.instantiate()
var truck_spawn = false


func _process(delta):
	# Moves the truck after its spawned
	if truck_spawn:
		truck_instance.global_position += Vector2(-1000 * delta, 0)


func _on_area_2d_area_entered(area):
	truck_spawn = true
	
	self.add_child(truck_instance)
	truck_instance.global_position = Vector2(player.global_position.x + 200, 40)
	
	await get_tree().create_timer(2).timeout
	
	truck_spawn = false
	
