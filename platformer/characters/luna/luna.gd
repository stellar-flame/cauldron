extends CharacterBody2D

@export  var spell: PackedScene

const SPEED = 500.0
const JUMP_VELOCITY = -680.0
@onready var direction = 0
@onready var sprite = $AnimatedSprite2D
@onready var animation_blocked = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")	
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("luna_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("luna_left", "luna_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	update_animation()
	update_facing_direction()

func update_animation():
	if (not animation_blocked):
		if (is_on_floor()):
			if Input.is_action_just_pressed("luna_attack"):
				sprite.play("attack")
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


func cast_spell():
	var s = spell.instantiate()
	var spawn_offset = Vector2(-80, -50) if sprite.flip_h else Vector2(60, -50) 
	var spawn_position = self.position + spawn_offset

	s.position = spawn_position
	s.direction = Vector2(-1, 0) if sprite.flip_h else Vector2(1, 0)
	
	#s.velocity =  shot_direction * 600
	get_parent().add_child(s)	
	

func _on_animated_sprite_2d_animation_finished():
	animation_blocked = false


func _on_animated_sprite_2d_frame_changed():
	if (sprite.animation == "attack" and sprite.frame == 3):
		cast_spell()
