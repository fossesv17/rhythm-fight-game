extends StaticBody2D

var INIT_Y = -390
var INIT_X = 72
var TARGET_Y = -220
var dist_to_target_area = abs(TARGET_Y - INIT_Y)


var speed = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(INIT_X, INIT_Y)
	speed = dist_to_target_area / 2.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if position.y > TARGET_Y:
		position.y = INIT_Y
	else:
		position.y += speed * delta
		#print(position.y)
