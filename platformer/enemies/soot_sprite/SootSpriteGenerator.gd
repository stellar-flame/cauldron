class_name SootSpriteGenerator

extends Object

var SootSpriteScene =  load("res://platformer/enemies/soot_sprite/SootSprite.tscn")
	

func generate(area : AreaDimensions, n):
	var soots = Array()
	randomize()
	for i in range(n):
		var x = randf_range(area.x1, area.x2)
		var y = randf_range(area.y1, area.y2)
		
		var sootSprite : SootSprite = SootSpriteScene.instantiate()
		sootSprite.position = Vector2(x, y)
		soots.append(sootSprite)
	return soots
