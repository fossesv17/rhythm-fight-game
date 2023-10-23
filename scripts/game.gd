extends Node2D

var bpm = 200
var song_position = 0.0
var song_position_in_beats = 0
var last_spawned_beat = 0
var sec_per_beat = 60.0 / bpm

var beatbar = load("res://scenes/beat_bar.tscn")
var instance

# Called when the node enters the scene tree for the first time.
func _ready():
	$SongPlayer.play_with_offset(5) # Replace with function body.
	#var curr_scene = get_tree().get_current_scene()
	#print_scene_hierarchy(curr_scene, "")

func _spawn_beatbar():
	instance = beatbar.instantiate()
	add_child(instance)

func _on_measure_sig(_pos):
	_spawn_beatbar()
	
func print_scene_hierarchy(node, indent):
	# Print the node's name
	print(indent + node.get_name())

	# Recursively print child nodes
	for child in node.get_children():
		print_scene_hierarchy(child, indent + "  ")
