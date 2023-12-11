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


func _spawn_beatbar():
	instance = beatbar.instantiate()
	add_child(instance)

func _on_measure_sig(_pos):
	_spawn_beatbar()
	
#muerte de uno de los jugadores
func _process(_delta):
	if $Bee.maxHealth == 0:
		get_tree().change_scene_to_file("res://scenes/victoryPlayer2.tscn")
	if $Bee2.maxHealth == 0:
		get_tree().change_scene_to_file("res://scenes/victoryPlayer1.tscn")
		
