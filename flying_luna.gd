extends CharacterBody2D

const SPEED = 2000.0
const JUMP_VELOCITY = -400.0
var viewport_size


# Get the gravity from the project settings to be synced with RigidBody nodes.S
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	viewport_size = get_viewport().get_visible_rect().size
	position.x = viewport_size.x / 2
	position.y = viewport_size.y / 2 

func _physics_process(delta):
	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if ((direction < 0) and (position.x >0)) or ((direction > 0) and (position.x < viewport_size.x - 50)):
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var y_direction = Input.get_axis("ui_up", "ui_down")
	if ((y_direction < 0) and (position.y > 0)) or ((y_direction > 0) and (position.y < viewport_size.y)):
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)



	move_and_slide()
