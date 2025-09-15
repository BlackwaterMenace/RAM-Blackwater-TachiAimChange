extends "res://Scripts/Menus/AccessibilityPanel.gd"

func _ready():
	var tachi_aim_invert_toggle_button_parent = $CenterContainer/VBoxContainer
	
	var tachi_aim_invert_toggle_button := CheckBox.new()
	tachi_aim_invert_toggle_button.set_script(load("res://Scripts/UI/AudioButton.gd"))
	tachi_aim_invert_toggle_button.text = "Invert Tachi aim"
	tachi_aim_invert_toggle_button.button_pressed = SaveManager.tachi_aim_invert
	tachi_aim_invert_toggle_button.toggled.connect(_on_tachi_aim_invert_toggled)
	tachi_aim_invert_toggle_button_parent.add_child(tachi_aim_invert_toggle_button)
	tachi_aim_invert_toggle_button_parent.move_child(tachi_aim_invert_toggle_button, -2)
	super()

func _on_tachi_aim_invert_toggled(state: bool):
	SaveManager.tachi_aim_invert = state
