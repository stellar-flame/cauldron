extends Area2D

var amplitude = 100  # The range of the movement
var frequency = 2  # The speed of the movement
var time_passed = 0  # To track the time passed
@onready var sprite = $AnimatedSprite2D
@onready var audio = $AudioStreamPlayer2D

func _ready():
	sprite.play("moving")
	
func _physics_process(delta):
	time_passed += delta
	var y_movement = amplitude * sin(time_passed * frequency)	
	self.position.y = y_movement
	

func _on_body_entered(body):
	if (body.is_in_group("character")):
		body.take_damage(1)
		audio.play()


func _on_body_exited(body):
	if (body.is_in_group("character")):
		audio.stop()
