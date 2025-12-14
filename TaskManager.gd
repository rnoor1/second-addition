extends Node
var near_vendor := false
var active_task: String = ""
var completed_tasks: Array[String] = []

func start_task(task_id: String) -> void:
	active_task = task_id
	print(" Task started:", task_id)

func complete_task() -> void:
	if active_task != "":
		print(" Task completed:", active_task)
		completed_tasks.append(active_task)
		active_task = ""
