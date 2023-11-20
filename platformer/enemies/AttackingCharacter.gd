class_name AttackingCharacter
extends CharacterBody2D

var player
var retreat 
var attack_radius = 300
var speed = 200
var damageable : Damageable = Damageable.new()

@onready var sprite : AnimatedSprite2D = $AnimatedSprite2D

func attack():
	var direction_to_player = (player.global_position - self.global_position).normalized()
	if (retreat):
		velocity = -direction_to_player * speed
	else:	
		velocity = direction_to_player * speed
	
	flip_sprite(direction_to_player)
		
	if (move_and_slide()):
		attack_player()
		
	if (self.global_position.distance_to(player.global_position) > attack_radius):
		retreat = false
		
func attack_player():
	var collision = get_last_slide_collision();
	if (collision and collision.get_collider().is_in_group("player")):
		#player.take_damage(2)
		retreat = true
		
func flip_sprite(direction_to_player):
	if (direction_to_player.x > 0  ):
		sprite.flip_h = true
	else:
		sprite.flip_h = false
					
