class_name Scene1
extends BaseScene

		
func _ready():
	super()
	players_node.player_entered_scene($Section1.camera_limits)
	
