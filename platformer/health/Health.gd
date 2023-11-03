extends Node
class_name Health

var max_health: float = 20
var current_health: float = max_health

signal health_changed(health)
signal health_died

func init_health(health):
	max_health = health
	current_health = health
func set_health(value: int) -> void:
	current_health = value
	var percent = current_health/max_health * 100
	emit_signal("health_changed", percent)
	if current_health <= 0:
		die()

func reduce_health(amount: int) -> void:
	set_health(current_health - amount)

func increase_health(amount: int) -> void:
	set_health(current_health +  amount)

func die() -> void:
	emit_signal("health_died")
	
