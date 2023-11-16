extends Node2D

@onready var light: Light_Area = $Light
# Called when the node enters the scene tree for the first time.
func _ready():
	light.set_radius(2)
	for s in $Sprites.get_children():
		if (s is SootSprite):
			light.player_exited.connect(s._player_exited)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
