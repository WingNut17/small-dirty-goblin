extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D
@onready var health = 100
@onready var animation_player = $AnimationPlayer


# character speed
const SPEED = 450

var motion = Vector2()
var last_direction = Vector2()
var input_vector = Vector2()

func _ready():
	animation_player.play("fade_in")

func _process(delta):
	if health > 0:
		# Get the left/right up/down input directions
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
			last_direction = input_vector
		
		else:
			velocity.x = move_toward(motion[0], 0, SPEED * delta)
			velocity.y = move_toward(motion[1], 0, SPEED * delta)
		
		
		move_and_slide()
		handle_animations()
	else:
		await get_tree().create_timer(2).timeout
		get_tree().reload_current_scene()
		health = 100
		
	if animation_player.is_playing():
		velocity.x = 0
		velocity.y = 0
		move_and_slide()
	

func handle_animations():
	var animation = "idle"
	
	# if not moving:
	if not input_vector:
		if last_direction.y > 0:
			animation = "idle"
		elif last_direction.y < 0:
			animation = "idle_back"
		elif last_direction.x != 0:
			animation = "idle_side"
	
	if input_vector.y > 0:
		animation = "run_forward"
	elif input_vector.y < 0:
		animation = "run_back"

	if input_vector.x != 0:
		animation = "run_side"
		sprite.flip_h = input_vector.x < 0
	elif input_vector.y != 0:
		sprite.flip_h = false  
	
	sprite.play(animation)

