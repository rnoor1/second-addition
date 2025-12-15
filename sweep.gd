extends CanvasLayer

@onready var label: Label = $Label

func _process(_delta):
	match TaskManager.current_task:
		TaskManager.TaskState.NONE:
			label.text = "Talk to Grandpa"
		TaskManager.TaskState.GET_BROOM:
			label.text = "Get the broom"
		TaskManager.TaskState.SWEEP:
			label.text = "Sweep the mess"
		TaskManager.TaskState.DONE:
			label.text = "All clean!"
