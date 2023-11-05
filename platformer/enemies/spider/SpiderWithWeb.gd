extends Node2D

@onready var web = $Web
@onready var spider = $Spider
@export var range_of_movement = 100


func _ready():
	spider.amplitude = range_of_movement 
	spider.damageable.died.connect(_died)
	web.add_point(Vector2(0, spider.position.y-range_of_movement - 80))
	web.add_point(Vector2(0, 100))
	
func _process(delta):
	web.points[1] = spider.position
	
func _died():
	queue_free()
