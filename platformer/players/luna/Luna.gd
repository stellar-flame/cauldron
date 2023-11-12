extends Player 

class_name Luna

@export var spell: PackedScene

const SPEED = 500.0
const JUMP_VELOCITY = -625.0
@onready var direction = 0

var max_jumps = 2
var jump_count = 0
const NAME = "Luna"

const STICK_POS_RIGHT = Vector2(-80, -50)
const STICK_POS_LEFT = Vector2(60, -50)


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
	
func _cast_spell():
	var s = spell.instantiate()
	if (sprite.flip_h):
		s.position = self.position + STICK_POS_RIGHT
		s.direction = Vector2(-1, 0)
	else:
		s.position =  self.position + STICK_POS_LEFT
		s.direction = Vector2(1, 0)
	get_tree().current_scene.add_child(s)


func _on_animated_sprite_2d_died():
	queue_free()

func add_light():
	var LightScene =  load("res://platformer/scene_parts/Light.tscn")
	var light : PointLight2D = LightScene.instantiate()
	light.energy = 10
	light.texture_scale = 1
	var change_pos_func = func(): 
		if (sprite.flip_h):
			light.position = STICK_POS_RIGHT
		else:
			light.position = STICK_POS_LEFT
	
	sprite.direction_changed.connect(change_pos_func)
	change_pos_func.call()
	add_child(light)
	
	
	
