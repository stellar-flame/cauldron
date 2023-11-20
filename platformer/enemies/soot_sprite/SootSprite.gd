class_name SootSprite
extends AttackingCharacter

var light

func _ready():
	sprite.rotate(randf_range(-360, 360))
	sprite.set_frame(randf_range(0, 2))
	sprite.play("idle")
	damageable.initialise(self, 2)

	
func _physics_process(delta):
	if light:
		var direction_to_light = (light.global_position - global_position).normalized()
		var escape_vector = Vector2(direction_to_light.x * -1, abs(direction_to_light.y) * -1)
		velocity = escape_vector * 700
		move_and_slide()
	elif player:
		if (self.global_position.distance_to(player.global_position) < attack_radius):
			attack()
			
	else:
		velocity = Vector2.ZERO
		move_and_slide()
		
func _on_timer_timeout():
	light = null
	
func set_player(player: Player):
	self.player = player

func clear_player():
	self.player = null
