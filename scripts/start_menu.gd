extends Node2D

var menu_size = 0
var menu_pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_settings_btn_pressed():
	print("KIE PERO COMO")
