extends Node

@onready var luna = $Luna
@onready var stella = $Stella
@onready var game_over_scene_class = preload("res://platformer/game_over/GameOver.tscn")

var game_over_scene 		
		
func _process(delta):
	if (!game_over_scene and !luna and !stella):
		game_over_scene = game_over_scene_class.instantiate()
		game_over_scene.key_pressed.connect(_restart)
		get_tree().current_scene.add_child(game_over_scene)
		
		

func _restart():
	get_tree().change_scene_to_file("res://platformer/door1/Scene1.tscn")
