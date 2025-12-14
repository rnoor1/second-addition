extends Area2D
class_name Door

@export var destination_level_tag: String
@export var destination_door_tag: String

@onready var prompt: Label = $Prompt

var player_inside := false

func _ready() -> void:
	#  THIS IS REQUIRED
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

	if prompt:
		prompt.visible = false

func _on_body_entered(body: Node) -> void:
	print("BODY ENTERED:", body.name)
	if body.is_in_group("player"):
		print("PLAYER DETECTED")
		player_inside = true
		if prompt:
			prompt.visible = true

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		player_inside = false
		if prompt:
			prompt.visible = false

func _process(_delta):
	if player_inside and prompt:
		var player = get_tree().get_first_node_in_group("player")
		if player:
			prompt.global_position = player.global_position + Vector2(0, -40)

	if player_inside and Input.is_action_just_pressed("interact"):
		NavigationManager.go_to_level(
			destination_level_tag,
			destination_door_tag
		)
