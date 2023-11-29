class_name BaseScene

extends Node

var screen_id
var camera_limits
signal player_in_scene(scene) 

func _ready():
	$CameraLimitSetter.body_in_area.connect(_on_camera_limit_setter_body_in_area)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_camera_limit_setter_body_in_area(body):
	if (body is Player):
		emit_signal("player_in_scene", self)
