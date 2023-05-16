extends CharacterBody2D 

var hit_area

const SPEED = 500.0
const JUMP_VELOCITY = -900.0
@onready var direction = 0
@onready var sprite = $AnimatedSprite2D
@onready var animation_blocked = false
@onready var hit_area_right = $Hit_Area_Right
@onready var hit_area_left = $Hit_Area_Left

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
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	update_animation_parameters()
	update_facing_direction()

func update_animation_parameters():
	if (not animation_blocked):
		if (is_on_floor()):
			if Input.is_action_just_pressed("stella_paw_attack"):
					sprite.play("paw_attack")
					animation_blocked = true
			elif direction != 0:
				sprite.play("run")
			else:
				sprite.play("idle")
		else:
			sprite.play("jump")
		
		
func update_facing_direction():
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true



func _on_animated_sprite_2d_animation_finished():
	animation_blocked = false
	hit_area_left.set_hit_area_disabled(true)
	hit_area_right.set_hit_area_disabled(true)
	
	

func _on_animated_sprite_2d_animation_changed():
	if (sprite.animation == "paw_attack"):
		if sprite.flip_h:
			hit_area_left.set_hit_area_disabled(false)
		else:
			hit_area_right.set_hit_area_disabled(false)

func take_damage():
	sprite.play("get_hit")
	animation_blocked = true

