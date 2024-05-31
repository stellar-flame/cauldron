class_name AttackingCharacter
extends CharacterBody2D

var players : Array
var retreat 
var attack_radius = 300
var speed = 200
var damageable : Damageable = Damageable.new()

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

func attack(damage):
	var player = get_nearest_player()
	var direction_to_player = (player.global_position - self.global_position).normalized()
	if (retreat):
		velocity = -direction_to_player * speed
	else:	
		velocity = direction_to_player * speed
	
	flip_sprite(direction_to_player)
		
	if (move_and_slide()):
		damage_player(damage, player)
		
	if (self.global_position.distance_to(player.global_position) > attack_radius):
		retreat = false
		
func damage_player(damage, player):
	var collision = get_last_slide_collision();
	if (collision and collision.get_collider().is_in_group("player")):
		#player.take_damage(damage)
		retreat = true
		
func flip_sprite(direction_to_player):
	if (direction_to_player.x > 0  ):
		sprite.flip_h = true
	else:
		sprite.flip_h = false
					
func get_nearest_player():
	if !players.is_empty():
		var result = players[0]
		for p in players:
			var dist = self.global_position.distance_to(result.global_position)
			if self.global_position.distance_to(p.global_position) < dist:
				result = p 
		return result	
	return null
