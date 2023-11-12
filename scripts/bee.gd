extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#Set animation player
@onready var animation = $AnimationPlayer

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var right = Input.is_action_pressed("p1_right")
	var left = Input.is_action_pressed("p1_left")
	if right:
		$BeeSprite.flip_h = false
		if is_on_floor():
			animation.play("walk")
	elif left: 	
		$BeeSprite.flip_h = true
		if is_on_floor():
			animation.play("walk")
	
	move_and_slide()

func _process_input():
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
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

