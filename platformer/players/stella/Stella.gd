class_name Stella

extends Player 

var hit_area

const SPEED = 500.0
const JUMP_VELOCITY = -850.0
@onready var direction = 0
@onready var animation_blocked = false
@onready var hit_area_right = $Hit_Area_Right
@onready var hit_area_left = $Hit_Area_Left

var luna

const NAME = "Stella"

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("stella_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	direction = Input.get_axis("stella_left", "stella_right")
	if direction == 0 or distance_between_players_too_far(luna, direction):
		velocity.x = move_toward(velocity.x, 0, SPEED)
	else:	
		velocity.x = direction * SPEED
			
	move_and_slide()
	sprite.update_animation_parameters(direction, is_on_floor())
	sprite.update_facing_direction(direction)

func take_damage(damage):
	if (health.current_health > 0):
		sprite.take_damage()
		health.reduce_health(damage)
		

func _on_health_died():
	sprite.die()
		
func _on_animated_sprite_2d_paw_attack():
	if sprite.flip_h:
		hit_area_left.set_hit_area_disabled(false)
	else:
		hit_area_right.set_hit_area_disabled(false)

func _on_animated_sprite_2d_animation_unblocked():
	hit_area_left.set_hit_area_disabled(true)
	hit_area_right.set_hit_area_disabled(true)	


func _on_animated_sprite_2d_died():
	queue_free()
