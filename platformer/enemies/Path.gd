extends Path2D

# Customize the speed of the movement
@export var base_speed = 100.0
@onready var speed = base_speed

# Direction: 1 for right, -1 for left
@export var direction = -1
@onready var path_follow : PathFollow2D = $PathFollow2D
signal direction_changed

func  _ready():
	path_follow.progress = get_curve().get_baked_length()/2

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):				
	# Calculate the new offset based on speed, direction, and delta time
	var new_offset = path_follow.progress + (speed * direction * delta)

	# Check if the new_offset is beyond the path limits
	if new_offset < 0 or new_offset > get_curve().get_baked_length():
		# Reverse direction
		reverse_direction()
	else:
		# Update the offset
		path_follow.progress = new_offset
		
func reverse_direction():
	direction *= -1
	emit_signal("direction_changed")
	

func _on_dash(direction):
	if (self.direction != direction):
		reverse_direction()
	speed *= 10


func _on_stop_dash():
	speed = base_speed
