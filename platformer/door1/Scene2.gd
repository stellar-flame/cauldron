extends Node2D

@export var scene_id = 2
@onready var exit_control_top = $ExitControlTop
@onready var exit_control_bottom = $ExitControlBottom
@onready var luna = $Luna
@onready var stella = $Stella

func _ready():
	exit_control_top.scene_id = scene_id
	exit_control_top.next_scene = "res://platformer/door1/Scene1.tscn"
	
	exit_control_bottom.scene_id = scene_id
	exit_control_bottom.next_scene = "res://platformer/door1/Scene3.tscn"
	
	if (Global.previous_scene_id and Global.previous_scene_id > scene_id):
		var pos = exit_control_bottom.get_node("ExitCollisionArea").get_global_position()
		init_position(stella, pos)
		init_position(luna, pos)
		
	
func init_position(character :CharacterBody2D, vector: Vector2):
	character.position = vector
	character.get_node("AnimatedSprite2D").flip_h = true
