extends CanvasLayer

@onready var luna_hp = $Panel/LunaHUD/TextureProgressBar
@onready var stella_hp = $Panel/StellaHud/TextureProgressBar

func _on_luna_health_changed(current_health):
	luna_hp.value = current_health

func _on_stella_health_changed(health):
	stella_hp.value = health
