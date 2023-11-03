extends Node

class_name Damageable

var health = Health.new()
var enemy

signal died
	
func initialise(enemy, health_value):
	self.enemy = enemy
	health = Health.new()
	health.init_health(health_value)
	health.health_died.connect(_died)

func _died():
	emit_signal("died")
	enemy.queue_free()

func take_damage(damage):
	if (health.current_health > 0):
		enemy.sprite.modulate.a = 0.6
		health.reduce_health(damage)
		
