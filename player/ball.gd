extends RigidBody3D

@export var rolling_force = 40

func _ready():
	$CameraRig.top_level = true
	#$FloorCheck.set_as_toplevel(true)

func _physics_process(delta):
	var old_camera_pos = $CameraRig.global_transform.origin
	var ball_pos = global_transform.origin
	var new_camera_pos = lerp(old_camera_pos, ball_pos, 0.1)
	$CameraRig.global_transform.origin = new_camera_pos
	#$CameraRig.global_transform.origin = global_transform.origin
	
	if Input.is_action_pressed("forward"):
		angular_velocity.x -= rolling_force*delta
	elif Input.is_action_pressed("back"):
		angular_velocity.x += rolling_force*delta
	if Input.is_action_pressed("left"):
		angular_velocity.z += rolling_force*delta
	elif Input.is_action_pressed("right"):
		angular_velocity.z -= rolling_force*delta

var scene = preload("res://player/box_stuck.tscn")
func _on_box_stick_to():
	var box_instance = scene.instantiate()
	add_child(box_instance)
	print("stick to it")
