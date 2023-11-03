extends Node2D

@onready var web = $Web
@onready var spider = $Spider


func _ready():
	spider.damageable.died.connect(_died)
	web.add_point(Vector2(0, spider.position.y-180))
	web.add_point(Vector2(0, 100))
	
func _process(delta):
	web.points[1] = spider.position
	
func _died():
	queue_free()
