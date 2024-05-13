extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D

var input_vector = Vector2()
var motion = Vector2()
const SPEED = 450


func _ready():
	animated_sprite.play("run_back")

func _process(delta):
	input_vector = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"), Input.get_action_strength("down") - Input.get_action_strength("up"))

	# if theyre going diagonally, normalize
	if input_vector.length() > 1:
		input_vector = input_vector.normalized()

	# motion based on input	
	motion = input_vector * SPEED * delta

	# if a button is pressed
	if input_vector:
		velocity.x = motion[0] * SPEED * delta
		velocity.y = motion[1] * SPEED * delta

	else:
		velocity.x = move_toward(motion[0], 0, SPEED * delta)
		velocity.y = move_toward(motion[1], 0, SPEED * delta)


	move_and_slide()
