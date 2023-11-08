extends Area2D

@onready var sprite = $AnimatedSprite2D
signal dash(direction)
signal stop_dash
signal change_direction

func _ready():
	sprite.play("run")

func _on_body_entered(body):
	if (body.is_in_group("player")):
		emit_signal("stop_dash")
		var dir = calc_direction_to_target(body)
		if ((dir > 0 and sprite.flip_h) or (dir < 0 and !sprite.flip_h)):
			emit_signal("change_direction")
		attack_player(body)

func attack_player(body):
	body.take_damage(10)
	sprite.play("run")
		

func _on_enemy_detection_zone_body_entered(body):
	if (body.is_in_group("player")):
		start_dash(body)

func start_dash(target):
	emit_signal("dash", sign(calc_direction_to_target(target)))
	sprite.play("dash")
		
	var tween = get_tree().create_tween()
	tween.tween_property(sprite, "modulate:a",  0, 0.3)
	tween.tween_property(sprite, "modulate:a",  1, 0)
	
func calc_direction_to_target(target):
	return (target.global_position - self.global_position).normalized().x
		
func _on_path_2d_direction_changed():
	sprite.flip_h = !sprite.flip_h
