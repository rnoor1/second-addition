extends Node

enum TaskState {
	NONE,
	GET_BROOM,
	SWEEP,
	DONE
}

var current_task: TaskState = TaskState.NONE

func start_task():
	current_task = TaskState.GET_BROOM
	print("Task started: Get the broom")

func pick_up_broom():
	if current_task == TaskState.GET_BROOM:
		current_task = TaskState.SWEEP
		print("Task updated: Sweep the mess")

func finish_task():
	if current_task == TaskState.SWEEP:
		current_task = TaskState.DONE
		print("Task completed!")
