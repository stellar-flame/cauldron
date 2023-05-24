extends Node2D

@export var scene_id = 3
@onready var exit_control_top = $Exit_Control


# Called when the node enters the scene tree for the first time.
func _ready():
	exit_control_top.scene_id = scene_id
	exit_control_top.next_scene = "res://platformer/door_1/scene_2.tscn"
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
