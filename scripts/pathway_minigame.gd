extends Node2D

@onready var label = $UI/MarginContainer/Label
@onready var player = $LimitedPlayer
@onready var beep = $Beep
@onready var death = $Death
@onready var top_wall = $Walls/Top_Wall


const GOBLIN = preload("res://scenes/characters/goblin_minigame.tscn")
var hitpoints
var spawn_timer
var goblin_instance
var time = 0.1

func _ready():
	hitpoints = 5
	label.text = "Hitpoints: " + str(hitpoints)
	
	await get_tree().create_timer(2).timeout
	
	for i in range(200):
		spawn_goblins()
		time = randf_range(0.01, 0.3)
			
		await get_tree().create_timer(time).timeout
		
	
	top_wall.queue_free()


func spawn_goblins():
	var goblin_instance = GOBLIN.instantiate()
	add_child(goblin_instance)
	var random_x = randf_range(-45, 45)
	goblin_instance.position = Vector2(random_x, -100)


func _on_area_2d_area_entered(_area):
	hitpoints -= 1
	label.text = "Hitpoints: " + str(hitpoints)

	if hitpoints <= 0:
		death.play()
		player.queue_free()
		await get_tree().create_timer(2).timeout
		get_tree().reload_current_scene()
	else:
		beep.play()


func _on_next_screen_detector_area_entered(area):
	if area.name == "Player":
		get_tree().change_scene_to_file("res://scenes/inside_house.tscn")
