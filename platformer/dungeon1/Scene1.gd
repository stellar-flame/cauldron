extends BaseScene

# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	screen_id = 1
	camera_limits = {"left" = 0, "top" = 0, "bottom" = Global.base_window_size.y }

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

