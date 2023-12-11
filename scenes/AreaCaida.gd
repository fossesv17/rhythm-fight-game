extends Area2D


func _on_body_entered(body):
	if "Bee2" in body.name:
		get_tree().change_scene_to_file("res://scenes/victoryPlayer1.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/victoryPlayer2.tscn")
