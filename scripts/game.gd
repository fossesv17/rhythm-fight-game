extends Node2D

var beatbar = load("res://scenes/beat_bar.tscn")
var instance
@onready var midi_bar = $MidiBar
@onready var midi_player = $MidiPlayer
@onready var pause_menu = $Background/Pause_menu

var delta_sum = 0

func _ready():
	midi_bar.play_speed = 0.7
	midi_bar.play()
	midi_bar.volume_db = 0
	$ProgressBarL.value = 100
	$ProgressBarR.value = 100
	
func _physics_process(delta):
	delta_sum += delta
	if 1.4 <= delta_sum and not midi_player.playing:
		midi_player.play()
		midi_player.play_speed = 0.7
		
	$ProgressBarL.value = $Bee.health
	$ProgressBarR.value = $Bee2.health
	
	if Input.is_action_just_pressed("pause"):
		get_tree().paused = not get_tree().paused
		pause_menu.visible = not pause_menu.visible
			
	if $Bee.health == 0:
		get_tree().change_scene_to_file("res://scenes/victoryPlayer2.tscn")
	if $Bee2.health == 0:
		get_tree().change_scene_to_file("res://scenes/victoryPlayer1.tscn")
	
func _on_midi_player_midi_event(channel, event):
	if channel.number == 0 and event.type == 144:
		_spawn_beatbar()
	elif midi_bar.position > 61205 and channel.number == 1 and event.type == 128:
		_spawn_beatbar()
		
func _spawn_beatbar():
	instance = beatbar.instantiate()
	add_child(instance)
