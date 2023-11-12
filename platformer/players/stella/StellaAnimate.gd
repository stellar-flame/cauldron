extends PlayerAnimation

signal paw_attack
	
func update_animation_parameters(direction = 0, on_floor = true):
	if (not animation_blocked):
	
		if Input.is_action_just_pressed("stella_paw_attack"):
					play("paw_attack")
					animation_blocked = true
		elif (on_floor):
			if direction != 0:
				play("run")
			else:
				play("idle")
		else:
			play("jump")

func take_damage():
	play("get_hit")
	animation_blocked = true


func _on_animation_changed():
	if (animation == "paw_attack"):
		emit_signal("paw_attack")

