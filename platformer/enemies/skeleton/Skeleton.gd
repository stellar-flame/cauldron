extends Area2D

@onready var sprite = $AnimatedSprite2D

func _ready():
	sprite.play("run")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_path_2d_direction_changed():
	sprite.flip_h = !sprite.flip_h
