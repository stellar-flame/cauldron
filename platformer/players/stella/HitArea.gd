extends Area2D

@onready var collision_body = $CollisionShape2D

func _ready():
	collision_body.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_hit_area_disabled(value: bool):
	collision_body.disabled = value

func _on_area_entered(area):
	attack_enemy(area)


func _on_body_entered(body):
	attack_enemy(body)

func attack_enemy(obj):
	if (obj.is_in_group("enemy")):
		obj.damageable.take_damage(3)
		


		
