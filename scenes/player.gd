extends CharacterBody2D

var SPEED = 100
var SPRINT_SPEED = 170

@onready var animated_sprite = $AnimatedSprite2D
@onready var camera = $Camera2D


func _physics_process(delta: float) -> void:
	# Get input direction
	var direction = Input.get_vector("left", "right", "up", "down")
	# Apply movement if there's input
	if direction != Vector2.ZERO:
		velocity = direction.normalized() * SPEED
		if direction.x < 0:
			animated_sprite.play("walk_left")
			if Input.is_action_pressed("sprint"):
				velocity = velocity * 2
			move_and_slide()
		elif direction.x > 0:
			animated_sprite.play("walk_right")
			if Input.is_action_pressed("sprint"):
				velocity = velocity * 2
			move_and_slide()
		elif direction.y < 0:
			animated_sprite.play("walk_up")
			if Input.is_action_pressed("sprint"):
				velocity = velocity * 2
			move_and_slide()
		elif direction.y > 0:
			animated_sprite.play("walk_down")
			if Input.is_action_pressed("sprint"):
				velocity = velocity * 2
			move_and_slide()
	else:
		# Stop animation when there's no input
		animated_sprite.stop()
		
	# Move the character using move_and_slide() for collision support
