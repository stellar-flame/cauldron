extends Area2D

@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.flip_h = false

func flip_sprite():
	sprite.flip_h = !sprite.flip_h
		

func _on_body_entered(body):
	print("Hit")

func _on_area_entered(area):
	print("Hit")
	if (area.is_in_group("spells")):
		print("Hit by spells")
		queue_free()
