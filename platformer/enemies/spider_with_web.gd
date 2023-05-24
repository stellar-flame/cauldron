extends Node2D

@onready var web = $Web
@onready var spider = $Spider


func _ready():
	web.add_point(Vector2(0, spider.position.y-200))
	web.add_point(Vector2(0, 100))
	
func _process(delta):
	web.points[1] = spider.position
