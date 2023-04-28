extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -650.0
var state = "idle_right"
var direction_facing = "right"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$AnimatedSprite2D.animation = state
	$AnimatedSprite2D.play()
		
func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and is_on_floor():
		#if (state != "run_right"):
			state = "run_right" 
			direction_facing = "right"
	elif Input.is_action_pressed("ui_left") and is_on_floor():
		#if (state != "run_left"):
			state = "run_left"
			direction_facing = "left"
	elif Input.is_action_just_pressed("ui_accept") and direction_facing == "right":
		#if (state != "jump_right"):
			state = "jump_right"
	elif Input.is_action_just_pressed("ui_accept") and direction_facing == "left":
		if (state != "jump_left"):
			state = "jump_left"
	elif (state != "idle_right") and (state != "idle_left"):
		if (direction_facing == "left"):
			state = "idle_left"
		elif (direction_facing == "right"):
			state = "idle_right"
	
	$AnimatedSprite2D.animation = state
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

