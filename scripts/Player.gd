extends CharacterBody2D

@onready var sprite = $AnimatedSprite2D

const SPEED = 300.0

func _physics_process(delta):
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = direction * SPEED
		sprite.play("run_side")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		sprite.play("idle")
	
	
	
	
	move_and_slide()
