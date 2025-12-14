extends Node

const scene_game = preload("res://scenes/game.tscn")
const scene_coffeeshop = preload("res://scenes/coffeeshop.tscn")
const scene_marketplace = preload("res://scenes/marketplace.tscn")

var spawn_door_tag: String = ""

func go_to_level(level_tag: String, destination_tag: String):
	print("\n--- NAVIGATION REQUEST ---")
	print("Level tag requested:", level_tag)
	print("Destination door tag:", destination_tag)

	var scene_to_load: PackedScene = null

	match level_tag:
		"game":
			scene_to_load = scene_game
		"coffeeshop":
			scene_to_load = scene_coffeeshop
		"marketplace":
			scene_to_load = scene_marketplace
		_:
			print("ERROR: Unknown level tag:", level_tag)

	if scene_to_load == null:
		print(" Scene load FAILED")
		return

	spawn_door_tag = destination_tag
	print("✔ Scene found. Loading scene...")
	get_tree().change_scene_to_packed(scene_to_load)


func _ready():
	print("✔ NavigationManager READY")
	call_deferred("move_player_to_spawn")

func move_player_to_spawn():
	var player = get_tree().get_first_node_in_group("player")
	if not player:
		# This is normal on start menu scenes
		print("No player yet — skipping spawn")
		return

	print("✓ Player found:", player.name)

	var doors = get_tree().get_nodes_in_group("doors")
	print("Doors found:", doors.size())

	for door in doors:
		print("Checking door:", door.name, "| tag:", door.door_tag)

		if door.door_tag == spawn_door_tag:
			print("✓ MATCH FOUND → Spawning player")
			player.global_position = door.global_position
			return

	print(" ERROR: No door matched tag:", spawn_door_tag)


	print("ERROR: No door matched tag:", spawn_door_tag)




	print("ERROR: No door matched tag:", spawn_door_tag)
