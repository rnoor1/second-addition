extends CanvasLayer

@onready var task_label: Label = $Label

func _ready():
	update_task_text()

func _process(_delta):
	update_task_text()


func update_task_text():
	# Completed task
	if "sell_apple" in TaskManager.completed_tasks:
		task_label.text = "✅ Task completed!"
		return

	# Near vendor (before accepting)
	if TaskManager.near_vendor and TaskManager.active_task == "":
		task_label.text = "📜 Task:\nSell 1 apple\nReward: 10 coins\nPress E to accept"
		return

	# Active task (after accepting)
	if TaskManager.active_task == "sell_apple":
		task_label.text = "📜 Task:\nSell 1 apple\nReward: 10 coins\nPress E again to sell it"
		return

	# Default welcome
	task_label.text = "WELCOME! I'm Mochi.\nExplore the world to find a task!"
