extends Area2D

var damageable  = Damageable.new()
var amplitude = 100  # The range of the movement
var frequency = 1  # The speed of the movement
var time_passed = 0 # To track the time passed
var start_position

@onready var audio = $AudioStreamPlayer2D
@onready var sprite = $AnimatedSprite2D

func _ready():
	damageable.initialise(self, 5)
	sprite.play("moving")
	start_position = position
	
func _physics_process(delta):
	if (sprite.is_playing()):
		time_passed += delta
		var y_movement = amplitude * sin(time_passed * frequency)	
		self.position.y = start_position.y + y_movement
	

func _on_body_entered(body):
	if (body.is_in_group("player")):
		body.take_damage(1)
		audio.play()


func _on_body_exited(body):
	if (body.is_in_group("player")):
		audio.stop()
