extends Node2D

@onready var animation = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("cutscene")

func _process(delta):
	if not animation.is_playing() and Input.is_action_pressed("interact"):
		animation.play("RESET") 
