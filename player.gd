extends CharacterBody2D

@onready var AS = $AnimatedSprite2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var GRAVITY: float = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	# Add gravity
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Movement left/right
	var direction := Input.get_axis("ui_left", "ui_right")

	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	handle_animation(direction)

func handle_animation(dir):
	handle_sprite_flip(dir)

	if is_on_floor():
		if abs(velocity.x) > 10:
			AS.play("run")
		else:
			AS.play("idle")
	else:
		AS.play("jump")

func handle_sprite_flip(dir):
	if dir > 0:
		AS.flip_h = false
	elif dir < 0:
		AS.flip_h = true
