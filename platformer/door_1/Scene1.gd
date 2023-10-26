extends Node2D

@export var scene_id = 1
@onready var exit_control = $Exit_Control
@onready var luna = $Luna
@onready var stella = $Stella

func _ready():
	luna.health = $LunaHealth
	exit_control.scene_id = scene_id
	exit_control.next_scene = "res://platformer/door_1/scene_2.tscn"
	if (Global.previous_scene_id and Global.previous_scene_id > scene_id):
		init_position(luna, Vector2(2340, 1280))
		init_position(stella, Vector2(2340, 1280))
		

func init_position(character :CharacterBody2D, vector: Vector2):
	character.position = vector
	character.get_node("AnimatedSprite2D").flip_h = true
		
func _on_luna_health_died():
	luna.die()
