extends Area2D

@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.flip_h = false

func flip_sprite():
	sprite.flip_h = !sprite.flip_h
		
