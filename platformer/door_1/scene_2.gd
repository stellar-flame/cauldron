extends Node2D

@export var scene_id = 2
@onready var exit_control_top = $Exit_Control_Top
@onready var exit_control_bottom = $Exit_Control_Bottom


func _ready():
	exit_control_top.scene_id = scene_id
	exit_control_top.next_scene = "res://platformer/door_1/scene_1.tscn"
	
	exit_control_bottom.scene_id = scene_id
	exit_control_bottom.next_scene = "res://platformer/door_1/scene_1.tscn"
	
