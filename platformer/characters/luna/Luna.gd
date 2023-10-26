extends CharacterBody2D 

var health

@export  var spell: PackedScene

const SPEED = 500.0
const JUMP_VELOCITY = -625.0
@onready var direction = 0
@onready var sprite = $AnimatedSprite2D

var max_jumps = 2
var jump_count = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")	
			
func _physics_process(delta):
	# Add the gravity.
		
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		jump_count = 0

	if Input.is_action_just_pressed("luna_attack"):
		velocity = Vector2()
	else:
		if Input.is_action_just_pressed("luna_jump") and jump_count < max_jumps:
			velocity.y = JUMP_VELOCITY
			jump_count += 1

		if (sprite.animation_blocked):
			velocity.x = 0
		else:
			direction = Input.get_axis("luna_left", "luna_right")
			if direction:
				velocity.x = direction * SPEED
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
			
	move_and_slide()
	sprite.update_animation(direction, is_on_floor())
	sprite.update_facing_direction(direction)

func take_damage(damage):
	if (health.current_health > 0):
		sprite.take_damage()
		health.reduce_health(damage)
	
func die():
	sprite.die()

func _cast_spell():
	var s = spell.instantiate()
	if (sprite.flip_h):
		s.position = self.position + Vector2(-80, -50)
		s.direction = Vector2(-1, 0)
	else:
		s.position =  self.position + Vector2(60, -50)
		s.direction = Vector2(1, 0)
	get_tree().current_scene.add_child(s)


func _on_animated_sprite_2d_died():
	queue_free()
