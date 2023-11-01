extends Node

# Health properties
@onready var max_health: float = 20
@onready var current_health: float = max_health

signal health_changed(health)
signal died

func set_health(value: int) -> void:
	current_health = value
	var percent = current_health/max_health * 100
	emit_signal("health_changed", percent)
	print("Health ", current_health)
	print(current_health/max_health)
	print("Bar Health ", (current_health/max_health) * 100 )
	if current_health <= 0:
		die()

func reduce_health(amount: int) -> void:
	set_health(current_health - amount)

func increase_health(amount: int) -> void:
	set_health(current_health +  amount)

func die() -> void:
	emit_signal("died")
	
