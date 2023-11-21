extends Node2D

@onready var luna : Luna= $Luna
@onready var stella : Stella = $Stella
@onready var camera = $Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	luna.stella = stella
	stella.luna = luna

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var midpoint = (luna.position + stella.position) * 0.5
	camera.position = Vector2(midpoint.x, midpoint.y - 500)
	
