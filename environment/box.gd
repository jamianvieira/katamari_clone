extends RigidBody3D
signal stick_to

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_body_entered(body):
	if body.name == "Ball":                                   
		print("collided")
		#emit_signal("stick_to")
		var new_parent = get_node("../Ball")
		get_parent().remove_child(self)
		new_parent.add_child(self)
		#queue_free()
