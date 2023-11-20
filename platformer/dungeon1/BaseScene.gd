extends Node

class_name BaseScene

@onready var luna : Luna = $Luna
@onready var stella : Stella = $Stella

var HUDScene = preload("res://platformer/hud/Hud.tscn")
@onready var hud : HUD =  HUDScene.instantiate() 

@onready var game_over_scene_class = preload("res://platformer/game_over/GameOver.tscn")
var game_over_scene 		
		
func _ready():
	add_child(hud)

	luna.set_health(Global.players_health[Luna.NAME])
	stella.set_health(Global.players_health[Stella.NAME])
	
	hud.setup(luna.health, stella.health)
	
func _process(delta):
	if (!game_over_scene and !luna and !stella):
		game_over_scene = game_over_scene_class.instantiate()
		game_over_scene.key_pressed.connect(_restart)
		get_tree().current_scene.add_child(game_over_scene)
		
	
func _restart():
	Global._init()
	get_tree().change_scene_to_file("res://platformer/dungeon1/Scene1.tscn")
