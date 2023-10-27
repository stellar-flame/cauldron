extends Node2D

@onready var hp = $TextureProgressBar

func _on_luna_health_changed(current_health):
	hp.value = current_health
