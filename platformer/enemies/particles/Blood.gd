extends CPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func splatter(dir = 1):
	direction.x = dir
	emitting = true
	await get_tree().create_timer(lifetime).timeout
	emitting = false
