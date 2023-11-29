extends Node2D

@onready var luna : Luna= $Luna
@onready var stella : Stella = $Stella
@onready var camera = $Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	luna.stella = stella
	stella.luna = luna
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (not luna and not stella):
		pass
	camera.global_position = get_mid_point()	

func get_mid_point():	
	if (luna and not stella):
		return luna.position
	if (stella and not luna):
		return stella.position
	var midpoint_of_players = (luna.position + stella.position)/2
	return Vector2(midpoint_of_players.x, midpoint_of_players.y )
		
func player_entered_scene(scene: BaseScene ):
	if (scene.camera_limits.has("left")):
		camera.limit_left = scene.camera_limits["left"]
	else:
		camera.limit_left = -100000
		
	if (scene.camera_limits.has("right")):
		camera.limit_right = scene.camera_limits["right"]
	else:
		camera.limit_right = 100000
		
	if (scene.camera_limits.has("top")):
		camera.limit_top = scene.camera_limits["top"]
	else:
		camera.limit_top = -100000
		
	if (scene.camera_limits.has("bottom")):
		camera.limit_bottom = scene.camera_limits["bottom"]
	else:
		camera.limit_bottom = 100000
		
