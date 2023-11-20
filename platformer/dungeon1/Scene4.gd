extends BaseScene

func _ready():
	super()
	var luna_light = luna.add_light(100, 2)
	
	var color = Color(0.01, 0.01, 0.01, 1)
	modulate_children(self, color)
	
#	for s in $SootSprites.get_children():
#		if (s is SootSprite):
#			luna_light.player_exited.connect(s.set_player)
#			luna_light.player_entered.connect(s.clear_player)
#
func modulate_children(node, color):
	for child in node.get_children():
		if not (child.is_in_group("light") or child is CanvasLayer):
			if child is CanvasItem:
				child.modulate = color
			else: 
				modulate_children(child, color)
			
	
