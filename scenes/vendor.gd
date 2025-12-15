extends Area2D

var player_inside := false

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		handle_task()

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_inside = true
		TaskManager.near_vendor = true
		print("👋 Vendor: Press E")

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_inside = false
		TaskManager.near_vendor = false

func handle_task():
	# If task already completed, don't repeat it
	if "sell_apple" in TaskManager.completed_tasks:
		print("Vendor: You already sold an apple!")
		return

	# ▶ Start task if not started
	if TaskManager.active_task == "":
		TaskManager.start_task()

		print("Task: Sell 1 apple for 10 coins")
		return

	# ✔ Complete task if player has apple
	if TaskManager.active_task == "sell_apple":
		if Inventory.has_item("apple"):
			Inventory.remove_item("apple", 1)
			Inventory.add_coins(10)

			# 🔊 Play sell sound
			$AudioStreamPlayer2D.play()

			# 🗑 Remove apple from world
			remove_apple_from_world()

			TaskManager.complete_task()
		else:
			print("You don't have an apple yet!")

func remove_apple_from_world():
	var items = get_tree().get_nodes_in_group("world_items")
	for item in items:
		if item.item_id == "apple":
			item.queue_free()
			print("🍎 Apple removed from world")
			return
