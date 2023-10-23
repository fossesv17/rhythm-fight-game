extends Area2D

var good = false
var perfect = false
var curr_note = null


signal movebybeat(input)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event is InputEventKey and event.is_pressed():
		$AnimatedSprite2D.frame = 1
		$AnimatedSprite2D.self_modulate = Color(0.9, 0.77 ,0)
		if perfect:
			curr_note.queue_free()
			emit_signal("movebybeat")
		elif good:
			emit_signal("movebybeat")
			curr_note.queue_free()
		else:
			print("BRO U SUCK")
	else:
		$AnimatedSprite2D.frame = 0
		$AnimatedSprite2D.self_modulate = Color(1, 1, 1)
		print("BUH")

func _on_enter_good_zone(area):
	if area.is_in_group("beatbar"):
		good = true
		curr_note = area
		
func _on_enter_perfect_zone(area):
	if area.is_in_group("beatbar"):
		perfect = true

func _on_exit_perfect_zone(area):
	if area.is_in_group("beatbar"):
		perfect = false

func _on_exit_good_zone(area):
	if area.is_in_group("beatbar"):
		good = false
		curr_note = null

