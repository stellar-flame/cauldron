extends Node

var previous_scene_id 
var players_health : Dictionary

@onready var base_window_size = Vector2(
		ProjectSettings.get_setting("display/window/size/viewport_width"),
		ProjectSettings.get_setting("display/window/size/viewport_height"))

func _init():
	players_health = {Luna.NAME : Health.new(), Stella.NAME : Health.new()}
	
