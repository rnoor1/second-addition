extends CharacterBody2D

@onready var animatedsprite: AnimatedSprite2D = $animatedsprite2d

const SPEED := 150.0

func _physics_process(_delta):
	var direction := Vector2.ZERO

	# Movement input (WASD + Arrow keys)
	if Input.is_action_pressed("moveRight"):
		direction.x += 1
	if Input.is_action_pressed("moveLeft"):
		direction.x -= 1
	if Input.is_action_pressed("moveDown"):
		direction.y += 1
	if Input.is_action_pressed("moveUp"):
		direction.y -= 1

	# Apply movement
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = direction * SPEED
	else:
		velocity = Vector2.ZERO

	move_and_slide()

	# Flip sprite
	if direction.x > 0:
		animatedsprite.flip_h = false
	elif direction.x < 0:
		animatedsprite.flip_h = true

	# Animations
	if direction == Vector2.ZERO:
		animatedsprite.play("idle")
	else:
		animatedsprite.play("move")

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		print("E PRESSED")
