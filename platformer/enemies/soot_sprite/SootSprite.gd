class_name SootSprite
extends AttackingCharacter

var light
var damage = 2
enum States { IDLE, CHASING, AVOIDING_LIGHT }
var state = States.IDLE
@onready var state_change_timer = $StateChangeTimer

func _ready():
	sprite.rotate(randf_range(-360, 360))
	sprite.set_frame(randf_range(0, 2))
	sprite.play("idle")
	damageable.initialise(self, 2)
	
func _physics_process(delta):
	print(state)
	match state:
		States.AVOIDING_LIGHT:
			move_away_from_light()
			if not light and state_change_timer.is_stopped():
				change_state(States.IDLE)
		States.CHASING:
			attack(damage)	
			if light and state_change_timer.is_stopped():
				change_state(States.AVOIDING_LIGHT)
		States.IDLE:
			if !players.is_empty() and !light:
				change_state(States.CHASING)
				
		
func change_state(new_state):
	state = new_state	
	state_change_timer.start()
	
func move_away_from_light():
	var direction_to_light = (light.global_position - global_position).normalized()
	var escape_vector = Vector2(direction_to_light.x * -1, abs(direction_to_light.y) * -1)
	velocity = escape_vector * 300
	move_and_slide()
	
func _on_enemy_zone_body_entered(body):
	if body.is_in_group("player"):
		players.append(body)


func _on_enemy_zone_body_exited(body):
	if body.is_in_group("player"):
		players.erase(body)
