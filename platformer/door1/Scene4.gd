extends BaseScene

func _ready():
	super()
	luna.add_light()
	
	var color = Color(0.1, 0.1, 0.1, 1)
	modulate_children(self, color)
	
	var candle_stick = $Scene/CandleStick
	candle_stick.modulate = Color(0.3, 0.3, 0.3, 1)
	for f in candle_stick.get_children():
		if f.is_in_group("flame"):
			var light: PointLight2D = f.get_node("Light")
			light.set_energy(5)
			light.set_radius(1)		

func modulate_children(node, color):
	for child in node.get_children():
		if not (child.is_in_group("light") or child is CanvasLayer):
			if child is CanvasItem:
				child.modulate = color
			else: 
				modulate_children(child, color)
			
	
