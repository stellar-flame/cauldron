extends Line2D

var is_swaying = false
var sway_speed = 2.0
var sway_magnitude = 20.0
var time_passed = 0.0

func _process(delta):
	if is_swaying:
		time_passed += delta
		var new_points = points.duplicate()
		new_points[1].x = sway_magnitude * sin(time_passed * sway_speed)
		points = new_points
		

func sway():
	is_swaying = true
