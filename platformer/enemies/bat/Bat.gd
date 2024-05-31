class_name Bat
extends AttackingCharacter

# Adjust these variables according to your game
var start_position 
var damage =  2

@onready var audio = $AudioStreamPlayer2D


func _ready():
	sprite.play("bat")
	start_position = self.global_position
	damageable.initialise(self, 5)

	
func _physics_process(delta):	
	if !players.is_empty():
		attack(damage)
	else:
		if (self.global_position.distance_to(start_position) < 5):
			velocity = Vector2()
		else:
			var direction_to_start_pos = (start_position - self.global_position).normalized()
			velocity = direction_to_start_pos *speed
		move_and_slide()
						
						

func start_attack(body):
	if body.is_in_group("player"):
		players.append(body)

func stop_attack(body):
	if body.is_in_group("player"):
		players.erase(body)


