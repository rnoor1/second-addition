extends Area2D

func _on_body_entered(body):
	if body.name == "player" \
	and TaskManager.current_task == TaskManager.TaskState.GET_BROOM:
		TaskManager.pick_up_broom()
		queue_free()
