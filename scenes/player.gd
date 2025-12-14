extends CharacterBody2D
@onready var animatedsprite: AnimatedSprite2D = $animatedsprite2d

const SPEED = 150.0
const JUMP_VELOCITY = -200.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	#input direction: -1,0,1
	var direction := Input.get_axis("moveLeft", "moveRight")
	
	#flips the sprite
	if direction > 0:
		animatedsprite.flip_h = false
	elif direction < 0:
		animatedsprite.flip_h = true
	#play animations: 
	if is_on_floor():
		if direction == 0: 
			animatedsprite.play("idle")
		else: 
			animatedsprite.play("move")
	else: 
		animatedsprite.play("jump")
		
	if direction == 0: 
		animatedsprite.play("idle")
	else: 
		animatedsprite.play("move")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		print("E PRESSED")

	move_and_slide()
