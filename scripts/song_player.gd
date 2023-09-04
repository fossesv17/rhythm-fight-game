extends AudioStreamPlayer2D

@export var bpm := 161
var sec_per_beat = 60.0 / 60
var song_pos = 0.0
var ref_beat = 0
var offset = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	ref_beat = 0
	sec_per_beat = 60.0 / bpm
	play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if playing:
		song_pos = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_pos -= AudioServer.get_output_latency()
