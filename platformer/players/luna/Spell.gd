extends Area2D

var speed = 600	
var direction

func _ready():
	$AnimatedSprite2D.play("shoot")
	$AudioStreamPlayer2D.play()

func _process(delta):	
	if (direction.x == -1):
		$AnimatedSprite2D.flip_h = true
	position += direction * delta * speed

#This is when spells hits a wall
func _on_body_entered(body):
	if (body.is_in_group("enemy")):
		body.damageable.take_damage(5)
	queue_free()
	

func _on_area_entered(area):
	attack(area)
	
func attack(obj):
	if (obj.is_in_group("enemy")):
		obj.damageable.take_damage(5)
		queue_free()
	
	
