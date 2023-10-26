extends Area2D

var y_pos 
var down = true
@onready var timer = $SpikeTexture/Timer
@onready var spikes = $SpikeTexture
@onready var collision_shape = $CollisionShape2D
var moving = true

# Called when the node enters the scene tree for the first time.
func _ready():
	y_pos = spikes.position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (moving):
		if (down):
			if (spikes.position.y >= (y_pos + 50)):
				down = false
				timer.start(1)
				moving = false
			else:
				spikes.position.y += 2
				collision_shape.position.y += 2
		elif (!down):
			if (spikes.position.y <= y_pos):
				down = true
				timer.start(2)
				moving = false
			else:
				spikes.position.y -= 2
				collision_shape.position.y -= 2
		


func _on_timer_timeout():
	moving = true


func _on_body_entered(body):
	if body.is_in_group("character"):
a		body.take_damage(5) 
