extends Section


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	screen_id = 2
	camera_limits = { "right" = Global.base_window_size.x + self.position.x, 
						"left" = Global.base_window_size.x}
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	
	
