extends Node2D

@onready var animated_sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite.play("run_forward")


func _process(delta):
	position.y += 100 * delta


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
