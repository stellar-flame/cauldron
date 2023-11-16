extends AttackingCharacter

# Adjust these variables according to your game
var start_position 

@onready var audio = $AudioStreamPlayer2D


func _ready():
	sprite.play("bat")
	start_position = self.global_position
	damageable.initialise(self, 5)

	
func _physics_process(delta):	
	if (player):
		attack()
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
	if (collision.get_collider().is_in_group("player")):
		player.take_damage(2)
		retreat = true	
		
						

func start_attack(body):
	player = body

func stop_attack(body):
	player = null


