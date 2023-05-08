extends Area2D

var speed = 600	
var direction

func _ready():
	$AnimatedSprite2D.play("shoot")

func _process(delta):
	if (direction.x == -1):
		$AnimatedSprite2D.flip_h = true
	position += direction * delta * speed


func _on_body_entered(body):
	queue_free()
