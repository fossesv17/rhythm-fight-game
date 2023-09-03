extends AudioStreamPlayer2D

var song = preload("res://sound/survival-epic.mp3")

# Called when the node enters the scene tree for the first time.
func _ready():
	var songPlayer = self
	songPlayer.stream = song
	songPlayer.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
