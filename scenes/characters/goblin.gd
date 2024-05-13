extends Node2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var player = $"../../Player"
@onready var interaction_area = $InteractionArea
@onready var dialogue_box = $"../../Player/Control/DialogueBox"
const GOBLIN = preload("res://tres/goblin.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	if interaction_area != null:
		interaction_area.interact = Callable(self, "_on_interact")


func _process(delta):
	if get_angle_to(player.global_position) <= 0.75 and get_angle_to(player.global_position) >= -0.75:
		animated_sprite.play("idle_side")
		if (animated_sprite.flip_h):
			animated_sprite.flip_h = false
		
	elif get_angle_to(player.global_position) >= 0.75 and get_angle_to(player.global_position) <= 2.25:
		animated_sprite.play("idle")
		
	elif get_angle_to(player.global_position) >= 2.25 or get_angle_to(player.global_position) <= -2.25:
		animated_sprite.play("idle_side")
		animated_sprite.flip_h = true
	
	elif get_angle_to(player.global_position) <= -0.75 or get_angle_to(player.global_position) >= -2.25:
		animated_sprite.play("idle_back")


func _on_interact():
	dialogue_box.data = GOBLIN
	dialogue_box.start("START")
