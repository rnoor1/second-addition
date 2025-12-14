extends Area2D

@export var item_id: String = "apple"
@export var amount: int = 1

var player_inside := false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		Inventory.add_item(item_id, amount)
		print("Picked up:", item_id)
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_inside = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_inside = false
