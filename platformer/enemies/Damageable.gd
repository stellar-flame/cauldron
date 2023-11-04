extends Node

class_name Damageable

var health = Health.new()
var enemy
var sprite_transparency
var Blood_scene = preload("res://platformer/enemies/particles/Blood.tscn")
var blood_scene
signal died
	
func initialise(enemy, health_value):
	self.enemy = enemy
	health = Health.new()
	health.init_health(health_value)
	health.health_died.connect(_died)
	sprite_transparency = 1

func _died():
	enemy.sprite.stop()
	
	for i in 4:
		enemy.visible = !enemy.visible
		await enemy.get_tree().create_timer(0.2).timeout
 
	emit_signal("died")
	enemy.queue_free()

func take_damage(damage):
	if (health.current_health > 0):
		enemy.sprite.modulate = Color(1, 0, 0, 1) # R, G, B, A
		await enemy.get_tree().create_timer(0.2).timeout
		enemy.sprite.modulate = Color(1, 1, 1, 1) # R, G, B, A
					
		if (sprite_transparency > 0.2):
			sprite_transparency =  enemy.sprite.modulate.a - 0.2
			enemy.sprite.modulate.a = sprite_transparency
		health.reduce_health(damage)
		
		
