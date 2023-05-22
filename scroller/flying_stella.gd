### Stella ###
extends CharacterBody2D


const SPEED = 1500.0
const JUMP_VELOCITY = -400.0
const EDGE_WIDTH = 25
var viewport_size

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	viewport_size = get_viewport().get_visible_rect().size
	position.x = viewport_size.x * (2.0/ 3.0)
	position.y = viewport_size.y / 2 

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("p1_left", "p1_right")
	var go_left = (direction < 0) and (position.x >= EDGE_WIDTH)
	var go_right = (direction > 0) and (position.x <= (viewport_size.x - EDGE_WIDTH))
	if go_left or go_right:
		velocity.x = direction * SPEED
	else:
		velocity.x = stop_horizantal_movement()

	var y_direction = Input.get_axis("p1_up", "p1_down")
	var go_up = (y_direction < 0) and (position.y >= EDGE_WIDTH)
	var go_down = (y_direction > 0) and (position.y <= (viewport_size.y - EDGE_WIDTH))
	if go_up or go_down:
		velocity.y = y_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()

func stop_horizantal_movement():
	return move_toward(velocity.x, 0, SPEED)

func _input(event):
	if (event is InputEventJoypadButton) and false:
		if event.pressed:
			print("Controller", event.device, "pressed button", event.button_index)
