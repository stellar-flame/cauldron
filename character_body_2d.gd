extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -500.0
var state = "idle_right"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	$AnimatedSprite2D.animation = state
	$AnimatedSprite2D.play()
		
func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		if (state != "run_right"):
			state = "run_right"
	elif Input.is_action_pressed("ui_left"):
		if (state != "run_left"):
			state = "run_left"
	elif state != "idle_right" and state != "idle_left":
		if (state == "run_left"):
			state = "idle_left"
		else:
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


	
