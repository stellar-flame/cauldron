extends CharacterBody2D

class_name Player

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
