extends AnimatedSprite2D

signal cast_spell

@onready var animation_blocked = false
signal died
var state = "alive"

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
		
func update_facing_direction(direction = 0):
	if direction > 0:
		flip_h = false
	elif direction < 0:
		flip_h = true

func take_damage():
	play("hurt")
	animation_blocked = true;

func die():
	state = "dying"
	
func _on_animation_finished():
	if (state == "alive"):
		animation_blocked = false
	elif (state == "dying"):
		play("die")
		animation_blocked = true;
		state = "dead"
	elif (state == "dead"):
		for i in 4:
			self_modulate.a = 0.5
			await get_tree().create_timer(0.3).timeout

		emit_signal("died")
		

func _on_frame_changed():
	if (animation == "attack" and frame == 3):
		emit_signal("cast_spell")
