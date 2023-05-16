extends Area2D

@onready var number_of_characters = 0
@onready var door = $Door
@onready var sprite = $Door/Sprite2D
@onready var door_collision = $Door/CollisionShape2D

@onready var exit= $Exit

var scene_id  
var next_scene

func _ready():
	set_collision_mask_for_node(exit, false)
	
	
func _on_body_entered(body):
	var nodes = get_overlapping_bodies()
	if (nodes.size() == 2):
		if (nodes[0].is_in_group("character") and  nodes[1].is_in_group("character")):
			set_collision_mask_for_node(exit, true)
			door.set_collision_layer_value(1, false)
			sprite.visible = false

func _on_body_exited(body):
	if (body.is_in_group("character")):
		door.set_collision_layer_value(1, true)
		sprite.visible = true
	
				
func _on_exit_body_entered(body):
	Global.previous_scene_id = scene_id
	get_tree().change_scene_to_file(next_scene)
	
func set_collision_mask_for_node(node, value):
	node.set_collision_mask_value(2, value)
	node.set_collision_mask_value(3, value)
	



