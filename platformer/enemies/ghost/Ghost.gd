extends Area2D

class_name Ghost

var damageable = Damageable.new()

@onready var sprite = $AnimatedSprite2D
@onready var flicker = $FlickerTimer
@onready var audio = $AudioStreamPlayer2D

func _ready():
	sprite.flip_h = false
	sprite.play("float")
	damageable.initialise(self, 10)

func flip_sprite():
	sprite.flip_h = !sprite.flip_h
			

func _on_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(3)
		audio.play()
