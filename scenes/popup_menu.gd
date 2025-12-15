extends MarginContainer

@export var base_menu: VBoxContainer 
@export var base_menuOpen: VBoxContainer 

func toggleVisbility(object): 
	if object.visible: 
		object.visible = false
	else: 
		object.visible = true



func _on_toggle_menu_button_pressed() -> void:
	toggleVisbility(base_menu)
	toggleVisbility(base_menuOpen)
