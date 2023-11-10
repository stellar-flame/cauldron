extends Area2D

@onready var sprite = $AnimatedSprite2D
signal dash(direction)
signal stop_dash
signal change_direction
var damageable = Damageable.new()

func _ready():
	damageable.initialise(self, 10)
	sprite.play("run")

func _on_body_entered(body):
	if (body.is_in_group("player")):
		var dir = calc_direction_to_target(body)
		if ((dir > 0 and sprite.flip_h) or (dir < 0 and !sprite.flip_h)):
			emit_signal("change_direction")
		attack_player(body)

func attack_player(body):
	body.take_damage(8)
	sprite.play("attack")
		

func _on_enemy_detection_zone_body_entered(body):
	if (body.is_in_group("player")):
		start_dash(body)
		attack_player(body)

func start_dash(target):
	emit_signal("dash", sign(calc_direction_to_target(target)))
	#sprite.play("dash")
#	tween.tween_property(sprite, "modulate:a",  0, 0.3)
#	tween.tween_property(sprite, "modulate:a",  1, 0)
	await get_tree().create_timer(0.2).timeout
	emit_signal("stop_dash")
	
func calc_direction_to_target(target):
	return (target.global_position - self.global_position).normalized().x
		
func _on_path_2d_direction_changed():
	sprite.flip_h = !sprite.flip_h


func _on_animated_sprite_2d_animation_finished():
	if (sprite.animation == "attack"):
		sprite.play("run")


func _on_animated_sprite_2d_animation_changed():
	if (sprite.animation == "attack"):
		sprite.offset.y = -80
	else:
		sprite.offset.y = 0
