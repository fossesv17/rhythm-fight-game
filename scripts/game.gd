extends Node2D

var beatbar = load("res://scenes/beat_bar.tscn")
var instance
@onready var midi_bar = $MidiBar
@onready var midi_player = $MidiPlayer

var delta_sum = 0

func _ready():
	midi_bar.play_speed = 0.7
	midi_bar.play()
	midi_bar.volume_db = 0
	
func _physics_process(delta):
	delta_sum += delta
	if 1.4 <= delta_sum and not midi_player.playing:
		midi_player.play()
		midi_player.play_speed = 0.7
	
func _on_midi_player_midi_event(channel, event):
	if channel.number == 0 and event.type == 144:
		_spawn_beatbar()
	elif midi_bar.position > 61205 and channel.number == 1 and event.type == 128:
		_spawn_beatbar()
		
func _spawn_beatbar():
	instance = beatbar.instantiate()
	add_child(instance)
