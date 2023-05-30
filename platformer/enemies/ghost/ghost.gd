extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var flicker = $FlickerTimer


func _ready():
	sprite.flip_h = false
	sprite.play("float")


func flip_sprite():
	sprite.flip_h = !sprite.flip_h
			

func _on_flicker_timer_timeout():
	queue_free()

func take_damage():
	flicker.start(1)
	sprite.modulate.a = 0.3


func _on_body_entered(body):
	if body.is_in_group("character"):
		body.take_damage()
