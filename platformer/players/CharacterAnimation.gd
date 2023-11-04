extends AnimatedSprite2D

@onready var animation_blocked = false
signal died
signal animation_unblocked
var state = "alive"

func update_facing_direction(direction = 0):
	if direction > 0:
		flip_h = false
	elif direction < 0:
		flip_h = true
		
func die():
	state = "dying"
	
func _on_animation_finished():
	if (state == "alive"):
		animation_blocked = false
		emit_signal("animation_unblocked")
	elif (state == "dying"):
		play("die")
		animation_blocked = true;
		state = "dead"
	elif (state == "dead"):
		for i in 4:
			visible = !visible
			await get_tree().create_timer(0.2).timeout

		emit_signal("died")		
