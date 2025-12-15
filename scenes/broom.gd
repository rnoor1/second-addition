extends Area2D

var player_inside := false

func _ready():
	print("🧹 Broom spawned at ", global_position)

func _on_body_entered(body):
	if body.name == "player":
		player_inside = true
		print("Player near broom (press E)")

func _on_body_exited(body):
	if body.name == "player":
		player_inside = false

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		print("Broom picked up!")
		TaskManager.pick_up_broom()
		queue_free()
