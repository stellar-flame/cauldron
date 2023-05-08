extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var flicker = $FlickerTimer


func _ready():
	sprite.flip_h = false


func flip_sprite():
	sprite.flip_h = !sprite.flip_h
		
func _on_body_entered(body):
	print("Hit")

func _on_area_entered(area):		
	if (area.is_in_group("spells")):
		flicker.start(1)
		sprite.modulate.a = 0.3
		area.queue_free()


func _on_flicker_timer_timeout():
	queue_free()
