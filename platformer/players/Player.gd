class_name Player

extends CharacterBody2D

var health : Health
 
@onready var sprite = $AnimatedSprite2D

func _ready():
	self.tree_exited.connect(_on_tree_exited)
	
func _on_tree_exited():
	Global.players_health[self.NAME] = health

func set_health(health : Health):
	self.health = health
	health.health_died.connect(_on_health_died)
	
func _on_health_died():
	sprite.die()

func distance_between_players_too_far(other_player, direction):
	if (other_player == null):
		return false
	var direction_to_player = position.direction_to(other_player.position).x
	var distance_to_player = position.distance_to(other_player.position)
	var limit = get_viewport().size.x - 500
	return  distance_to_player > limit and ((direction_to_player > 0 and direction < 0) or (direction_to_player < 0 and direction > 0))

