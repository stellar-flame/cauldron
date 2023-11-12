extends PlayerAnimation

func update_animation(direction = 0, on_floor = true):
	if (not animation_blocked):
		if (on_floor):	
			if direction != 0:
				play("run_with_torch")
			else:
				play("idle_with_torch")
		else:
			play("jump_with_torch")
