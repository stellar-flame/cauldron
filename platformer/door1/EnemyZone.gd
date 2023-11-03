extends Area2D

@export var enemy: CharacterBody2D

func _ready():
	enemy.damageable.died.connect(_on_enemy_died)
	
func _on_body_entered(body):
	if (body.is_in_group("player")):
		enemy.start_attack(body)


func _on_body_exited(body):
	if (body.is_in_group("player")):
		enemy.stop_attack(body)


func _on_enemy_died():
	queue_free()
