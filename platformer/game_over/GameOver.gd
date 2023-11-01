extends CanvasLayer

signal key_pressed

func _ready():
	var screen_size = Global.base_window_size
	print(screen_size)
	var screen_center_x = screen_size.x / 2
	var screen_center_y = screen_size.y / 2
	var panel = $Panel

	# Position the panel's center to the screen's center
	panel.position = Vector2(screen_center_x - panel.size.x / 2, screen_center_y - panel.size.y / 2)

func _input(event):
	if event is InputEventKey and event.pressed:
		emit_signal("key_pressed")
