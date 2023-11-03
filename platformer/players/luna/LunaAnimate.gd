extends "res://platformer/players/CharacterAnimation.gd"

signal cast_spell

func update_animation(direction = 0, on_floor = true):
	if (not animation_blocked):
		if Input.is_action_just_pressed("luna_attack"):
				play("attack")
				animation_blocked = true
		elif (on_floor):	
			if direction != 0:
				play("run")
			else:
				play("idle")
		else:
			play("jump")
		

func take_damage():
	play("hurt")
	animation_blocked = true;

func _on_frame_changed():
	if (animation == "attack" and frame == 3):
		emit_signal("cast_spell")
