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
		return luna.global_position
	if (stella and not luna):
		return stella.global_position
	var midpoint_of_players = (luna.global_position + stella.global_position)/2
	return Vector2(midpoint_of_players.x, midpoint_of_players.y )
		
func player_entered_scene(camera_limits ):
	if (camera_limits.has("left")):
		camera.limit_left = camera_limits["left"]
	else:
		camera.limit_left = -100000
		
	if (camera_limits.has("right")):
		camera.limit_right = camera_limits["right"]
	else:
		camera.limit_right = 100000
		
	if (camera_limits.has("top")):
		camera.limit_top =camera_limits["top"]
	else:
		camera.limit_top = -100000
		
	if (camera_limits.has("bottom")):
		camera.limit_bottom = camera_limits["bottom"]
	else:
		camera.limit_bottom = 100000
		
