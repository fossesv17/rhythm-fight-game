extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#Set animation player
@onready var animation = $AnimationPlayer

func _physics_process(delta):
#	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if velocity.x > 0:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
	elif velocity.x < 0:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
	else:
		velocity.x = 0
		
	move_and_slide()

func input_proc():
	# Handle Jump.
	if Input.is_action_just_pressed("p1_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionx = Input.get_axis("p1_left", "p1_right")
	var directiony = Input.get_axis("p1_up", "p1_down")
	if directionx:
		velocity.x = directionx * SPEED
	elif directiony:
		velocity.y = directiony * SPEED

func _process(_delta):
	var right = Input.is_action_pressed("p1_right")
	var left = Input.is_action_pressed("p1_left")
	var atack = Input.is_action_just_pressed("p1_atack")
	var jump = Input.is_action_just_pressed("p1_jump")
	if atack:
		animation.play("punch")
	elif !is_on_floor():
		animation.play("jump")
		if right:
			$BeeSprite2.flip_h = false
		if left:
			$BeeSprite2.flip_h = true
	elif right:
		$BeeSprite2.flip_h = false
		if jump: 
			animation.play("jump")
		if is_on_floor():
			animation.play("walk")
	elif left: 	
		$BeeSprite2.flip_h = true
		if jump: 
			animation.play("jump")
		if is_on_floor():
			animation.play("walk")
	else:
		if !animation.is_playing():
			animation.play("idle")	
