extends Area2D

var INIT_Y = -360
var INIT_X = 181
var TARGET_Y = -170
var dist_to_target_area = abs(TARGET_Y - INIT_Y)


var speed = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(INIT_X, INIT_Y)
	speed = dist_to_target_area / 2.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if position.y > TARGET_Y:
		destroy()
	else:
		position.y += speed * delta


func destroy():
	$Sprite2D.visible = false
	$Timer.start()
	
func _on_timer_timeout():
	queue_free()
