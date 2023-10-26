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
	if (area.is_in_group("enemy")):
		area.take_damage()
