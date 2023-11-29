class_name Light_Area
extends PointLight2D

@export var detection_radius = 75

signal player_exited(player)
signal player_entered(player)

func set_radius(texture_scale):
	set_texture_scale(texture_scale)
	var shape = CircleShape2D.new()
	shape.radius = detection_radius * texture_scale - 10
	get_node("Area2D/CollisionShape2D").set_shape(shape)
	
func get_radius():
	return get_node("Area2D/CollisionShape2D").get_shape().radius
		

func _on_light_area_body_exited(body):
	if (body.is_in_group("light_sensitive")):
		body.light = null
	if (body.is_in_group("player")):
		emit_signal("player_exited", body)

func _on_light_area_body_entered(body):
	if (body.is_in_group("light_sensitive")):
		body.light = self
	if (body.is_in_group("player")):
		emit_signal("player_entered", body)
