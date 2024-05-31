class_name Scene4
extends BaseScene

var camera_limits = {"left" = 0, "top" = 0, "right" = 5000, "bottom" = 3000 }


func _ready():
	super()	
	players_node.player_entered_scene(camera_limits)
	
	var luna_light =luna.add_light(100, 2)
	var color = Color(0.01, 0.01, 0.01, 1)
	
	generate_soot_sprites(luna_light)
	modulate_children(self, color)
	
func generate_soot_sprites(luna_light):
	var generator = SootSpriteGenerator.new()
	var area = AreaDimensions._new(0, 5000, 0, 3000)
	var soots = generator.generate(area, 500)
	for s in soots:
		add_child(s)
	
func modulate_children(node, color):
	for child in node.get_children():
		if not (child.is_in_group("light") or child is CanvasLayer):
			if child is CanvasItem:
				child.modulate = color
			else: 
				modulate_children(child, color)
			
	
