extends Control

@onready var how_to_play_panel = $HowToPlayPanel
@onready var background_music = $BackgroundMusic
@onready var start_button = $StartButton
@onready var how_to_play_button = $HowToPlayButton
@onready var quit_button = $QuitButton

func _ready():
	print("Checking nodes...")
	print("Panel exists: ", how_to_play_panel != null)
	print("Start button exists: ", start_button != null)
	print("How to Play button exists: ", how_to_play_button != null)
	print("Quit button exists: ", quit_button != null)
	
	if how_to_play_panel:
		how_to_play_panel.visible = false
	else:
		print("ERROR: HowToPlayPanel node not found!")
	
	connect_buttons()
	
	if background_music and not background_music.playing:
		background_music.play()

func connect_buttons():
	if start_button:
		start_button.pressed.connect(_on_start_button_pressed)
	else:
		print("ERROR: StartButton not found!")
		
	if how_to_play_button:
		how_to_play_button.pressed.connect(_on_how_to_play_pressed)
	else:
		print("ERROR: HowToPlayButton not found!")
		
	if quit_button:
		quit_button.pressed.connect(_on_quit_button_pressed)
	else:
		print("ERROR: QuitButton not found!")
	
	if how_to_play_panel and how_to_play_panel.has_node("BackButton"):
		how_to_play_panel.get_node("BackButton").pressed.connect(_on_back_button_pressed)
	else:
		print("ERROR: BackButton not found in panel!")


func _on_start_button_pressed():
	print("Start button pressed!")
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_how_to_play_pressed():
	print("How to Play button pressed!")
	if how_to_play_panel:
		how_to_play_panel.visible = true

func _on_quit_button_pressed():
	print("Quit button pressed!")
	get_tree().quit()

func _on_back_button_pressed():
	print("Back button pressed!")
	if how_to_play_panel:
		how_to_play_panel.visible = false

func _input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			if how_to_play_panel and how_to_play_panel.visible:
				how_to_play_panel.visible = false
