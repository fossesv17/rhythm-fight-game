extends AudioStreamPlayer2D

var song = preload("res://sound/song.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	stream = song
	play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
