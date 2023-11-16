class_name SootSprite
extends AttackingCharacter

var light

func _ready():
	sprite.rotate(randf_range(-360, 360))
	sprite.set_frame(randf_range(0, 2))
	sprite.play("idle")
	
func _physics_process(delta):
	if light:
		var direction_to_light = light.global_position - global_position
		var escape_vector = -direction_to_light.normalized()
		velocity = escape_vector * 300
		move_and_slide()
		if ($Timer.is_stopped()):
			$Timer.start()
		
	elif player:
		if (self.global_position.distance_to(player.global_position) < attack_radius):
			attack()
			
	else:
		velocity = Vector2.ZERO
		move_and_slide()
		
func _on_timer_timeout():
	light = null
	
func _player_exited(player: Player):
	self.player = player

