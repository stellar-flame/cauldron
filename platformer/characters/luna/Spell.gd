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


func _on_area_entered(area):
	if (area.is_in_group("enemy")):
		area.take_damage()
		queue_free()
