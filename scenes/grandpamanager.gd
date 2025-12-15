extends Node2D

var player_in_range := false

func give_task():
	if TaskManager.current_task == TaskManager.TaskState.NONE:
		TaskManager.start_task()
		print("Grandpa gave task")

func _on_interact_area_body_entered(body):
	if body.name == "player":
		player_in_range = true

func _on_interact_area_body_exited(body):
	if body.name == "player":
		player_in_range = false
