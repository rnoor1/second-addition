extends Area2D

func _on_body_entered(body):
	if body.name == "player" \
	and TaskManager.current_task == TaskManager.TaskState.SWEEP:
		TaskManager.finish_task()
		queue_free()
