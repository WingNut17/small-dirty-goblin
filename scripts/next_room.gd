extends Node2D

@onready var player = $Player
const TRUCK = preload("res://scenes/truck.tscn")

var truck_instance1 = TRUCK.instantiate()
var truck_instance2 = TRUCK.instantiate()
var truck_spawn1 = false
var truck_spawn2 = false


func _process(delta):
	# Moves the truck after its spawned
	if truck_spawn1:
		truck_instance1.global_position += Vector2(-500 * delta, 0)
	if truck_spawn2:
		truck_instance2.global_position += Vector2(500 * delta, 0)

func _on_area_2d_area_entered(area):
	if truck_spawn1:
		await get_tree().create_timer(2).timeout
		truck_spawn1 = false
		
	truck_spawn1 = true
	
	self.add_child(truck_instance1)
	truck_instance1.global_position = Vector2(player.global_position.x + 200, 40)
	
	await get_tree().create_timer(2).timeout
	
	truck_spawn1 = false

func _on_road_2_area_entered(area):
	truck_spawn2 = true
	
	self.add_child(truck_instance2)
	truck_instance2.get_node("Sprite2D").flip_h = true
	truck_instance2.global_position = Vector2(player.global_position.x - 200, 80)
	
	await get_tree().create_timer(2).timeout
	
	truck_spawn2 = false
