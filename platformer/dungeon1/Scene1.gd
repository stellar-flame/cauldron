extends BaseScene

@export var scene_id = 1
@onready var exit_control = $ExitControl

func _ready():
	super()
	exit_control.scene_id = scene_id
	exit_control.next_scene = "res://platformer/dungeon1/Scene2.tscn"
	if (Global.previous_scene_id and Global.previous_scene_id > scene_id):
		init_position(luna, Vector2(2340, 1280))
		init_position(stella, Vector2(2340, 1280))
		

func init_position(player :CharacterBody2D, vector: Vector2):
	player.position = vector
	player.get_node("AnimatedSprite2D").flip_h = true
		



