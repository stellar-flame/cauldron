extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -400.0
var state

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	state = "idle"
	$AnimatedSprite2D.animation = state
	$AnimatedSprite2D.play()
		
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		if (state != "run_right"):
			state = "run_right"
	elif state != "idle":
		state = "idle"
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


	
