extends CharacterBody2D

const SPEED = 500.0
const JUMP_VELOCITY = -650.0
@onready var sprite = $AnimatedSprite2D
@onready var direction = 0
@onready var block_animation = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	sprite.play("idle")
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	if (not block_animation):
		if direction !=0 and is_on_floor():
			sprite.play("run") 
		elif Input.is_action_just_pressed("ui_accept"):
			sprite.play("jump")
			block_animation = true
		else:
			sprite.play("idle")
		
func update_facing_direction():
	if direction > 0:
		sprite.flip_h = false
	elif direction < 0:
		sprite.flip_h = true


func _on_animated_sprite_2d_animation_finished():
	block_animation = false
