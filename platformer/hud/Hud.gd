extends CanvasLayer

class_name HUD

@onready var luna_hp = $Panel/LunaHUD/TextureProgressBar
@onready var stella_hp = $Panel/StellaHUD/TextureProgressBar


func setup(luna_health : Health, stella_health : Health):	
	luna_health.connect("health_changed", _on_luna_health_changed)
	stella_health.connect("health_changed", _on_stella_health_changed)

	_on_luna_health_changed(luna_health.get_percent())
	_on_stella_health_changed(stella_health.get_percent())
	
func _on_luna_health_changed(percent):
	luna_hp.value = percent

func _on_stella_health_changed(percent):
	stella_hp.value = percent
