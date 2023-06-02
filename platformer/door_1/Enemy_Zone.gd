extends Area2D

@export var enemy: CharacterBody2D

func _on_body_entered(body):
	if (body.is_in_group("character")):
		enemy.start_attack(body)


func _on_body_exited(body):
	if (body.is_in_group("character")):
		enemy.stop_attack(body)
