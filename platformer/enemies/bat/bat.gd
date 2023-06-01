extends CharacterBody2D

# Adjust these variables according to your game
var speed = 200
var detection_radius = 500
var attack_radius = 300
var separation_distance = 400  # distance to keep from player
var start_position 
var attacked 
@onready var sprite = $AnimatedSprite2D
@onready var player = get_parent().get_node("Luna")

func _ready():
	sprite.play("brown")
	start_position = self.global_position
	
	
func _physics_process(delta):
	if (player):
	
		var in_zone = start_position.distance_to(player.global_position) < detection_radius
		if in_zone:
			var direction_to_player = (player.global_position - self.global_position).normalized()
			flip_sprite(direction_to_player)
			# Get the distance to the player
			if (attacked):
				if (self.global_position.distance_to(player.global_position) < attack_radius):
					velocity = -direction_to_player * speed
				else:
					attacked = false;
			else:	
				velocity = direction_to_player *speed
				
			if (move_and_slide()):
				var collision = get_last_slide_collision();
				attacked = true	
		else:
			if (self.global_position.distance_to(start_position) < 5):
				velocity = Vector2()
			else:
				var direction_to_start_pos = (start_position - self.global_position).normalized()
				velocity = direction_to_start_pos *speed
			move_and_slide()
		
func flip_sprite(direction_to_player):
	if (direction_to_player.x > 0  ):
		sprite.flip_h = true
	else:
		sprite.flip_h = false
				
func attack_player():
	print("Attacking player")  # replace this with your attack logic
