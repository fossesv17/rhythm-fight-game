extends MarginContainer


@onready var menu_button: Button = %Menu_button
@onready var exit_button: Button = %Exit_button

@export var main_menu: PackedScene

func _ready() -> void:

	menu_button.pressed.connect(_on_menu_button_pressed)
	exit_button.pressed.connect(_on_exit_button_pressed)
	
	hide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		visible = !visible
		get_tree().paused = visible
	
	
func _on_menu_button_pressed():
	if not main_menu:
		return
	get_tree().change_scene_to_packed(main_menu)
	
func _on_exit_button_pressed():
	get_tree().quit()
