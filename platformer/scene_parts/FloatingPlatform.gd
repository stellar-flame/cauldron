extends StaticBody2D

@onready var text_rect = $TextureRect
@onready var right_edge = $TextureRect/RightEdge
@onready var left_edge = $TextureRect/LeftEdge
@onready var collision_shape = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var y_value = text_rect.size.y/2
	left_edge.position = Vector2(0,y_value)
	right_edge.position = Vector2(text_rect.size.x,y_value)
	
	var x = (text_rect.position.x) + text_rect.size.x/2
	var y = (text_rect.position.y) + text_rect.size.y/2
	collision_shape.position =  Vector2(x,y)
	collision_shape.shape =  RectangleShape2D.new()  
	collision_shape.shape.size = text_rect.size
	
