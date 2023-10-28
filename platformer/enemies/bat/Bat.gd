extends CharacterBody2D

# Adjust these variables according to your game
var speed = 200
var detection_radius = 500
var attack_radius = 300
var separation_distance = 400  # distance to keep from player
var target
var start_position 
var attacking 
@onready var sprite = $AnimatedSprite2D
@onready var audio = $AudioStreamPlayer2D
@onready var player = get_parent().get_node("Luna")

func _ready():
	sprite.play("bat")
	start_position = self.global_position
	
	
func _physics_process(delta):	
	if (target):
		var direction_to_player = (target.global_position - self.global_position).normalized()
		flip_sprite(direction_to_player)
		
		if (attacking):
			if (self.global_position.distance_to(target.global_position) < attack_radius):
				velocity = -direction_to_player * speed
			else:
				attacking = false;
		else:	
			velocity = direction_to_player * speed
			
		if (move_and_slide()):
			attack_player()
			
	else:
		if (self.global_position.distance_to(start_position) < 5):
			velocity = Vector2()
		else:
			var direction_to_start_pos = (start_position - self.global_position).normalized()
			velocity = direction_to_start_pos *speed
		move_and_slide()
		
func attack_player():
	audio.play()
	var collision = get_last_slide_collision();
	if (collision.get_collider().is_in_group("character")):
		target.take_damage(2)
		attacking = true	
		
	
func flip_sprite(direction_to_player):
	if (direction_to_player.x > 0  ):
		sprite.flip_h = true
	else:
		sprite.flip_h = false
					

func start_attack(body):
	target = body

func stop_attack(body):
	target = null
