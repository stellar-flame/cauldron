extends PathFollow2D

# Customize the speed of the movement
@onready var speed = 100.0

# Direction: 1 for forward, -1 for backward
@onready var direction = -1
@onready var ghost = $Ghost

func  _ready():
	set_progress(get_parent().get_curve().get_baked_length()/2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	# Calculate the new offset based on speed, direction, and delta time
	var new_offset = get_progress() + (speed * direction * delta)

	# Check if the new_offset is beyond the path limits
	if new_offset < 0 or new_offset > get_parent().get_curve().get_baked_length():
		# Reverse direction
		direction *= -1
		if (ghost != null): ghost.flip_sprite()
	else:
		# Update the offset
		set_progress(new_offset)
	
