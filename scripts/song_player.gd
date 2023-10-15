extends AudioStreamPlayer2D

@export var bpm := 99
@export var measures := 4

# track song pos and beats
var sec_per_beat = 60.0 / bpm
var song_pos = 0.0
var song_pos_in_beats = 1
var ref_beat = 0
var offset = 0
var measure = 1

# track song offset by technical stuff
var closest = 0
var time_off_beat = 0.0

signal beatsig(pos)
signal measuresig(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	sec_per_beat = 60.0 / bpm
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if playing:
		song_pos = get_playback_position() + AudioServer.get_time_since_last_mix()
		song_pos -= AudioServer.get_output_latency()
		song_pos_in_beats = int(floor(song_pos / sec_per_beat)) + offset
		_report_beat()
		
func _report_beat():
	if ref_beat < song_pos_in_beats:
		if measures < measure:
			measure = 1
		emit_signal("beatsig", song_pos_in_beats)
		emit_signal("measuresig", measure)
		ref_beat = song_pos_in_beats
		measure += 1

func play_with_offset(num):
	offset = num
	$StartTimer.wait_time = sec_per_beat
	$StartTimer.start()
	
func closest_beat(nth):
	closest = int(round((song_pos / sec_per_beat) / nth) * nth)
	time_off_beat = abs(closest * sec_per_beat - song_pos)
	return Vector2(closest, time_off_beat)


func play_from_beat(beat, off):
	play()
	seek(beat * sec_per_beat)
	offset = off
	measure = beat % measures


func _on_StartTimer_timeout():
	song_pos_in_beats += 1
	if song_pos_in_beats < offset - 1:
		$StartTimer.start()
	elif song_pos_in_beats == offset - 1:
		$StartTimer.wait_time = $StartTimer.wait_time - (AudioServer.get_time_to_next_mix() + 
														AudioServer.get_output_latency())
		$StartTimer.start()
	else:
		play()
		$StartTimer.stop()
	_report_beat() 
