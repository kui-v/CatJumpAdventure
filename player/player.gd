extends RigidBody2D

@onready var hold_timer : Timer = get_node("Timer")
@onready var label_text : Label = get_node("UILayer/Label")
@onready var label_text_2 : Label = get_node("UILayer/Label2")
@onready var timer_label : Label = get_node("UILayer/TimerLabel")
@onready var trajectory_line : Line2D = get_node("TrajectoryLine")

var hold_percentage : float = 0.0
var hold_force : float = 75
var force : float = 0

# hold button and release - force
# 1. on button press
# 2. on button release
# mouse position - direction 


# process should only handle the timer; all physics should be done when action released
func _process(_delta):
	if Input.is_action_just_pressed("action_hold"):
		hold_timer.start()
	elif Input.is_action_just_released("action_hold"):
		hold_timer.stop()
		apply_movement()
	else:
		trajectory_line.show()
		get_hold_velocity()
		update_trajectory(_delta)
	timer_label.text = str(hold_timer.time_left).pad_decimals(2)


func get_hold_velocity():
	var hold_time = (hold_timer.wait_time - hold_timer.time_left)
	hold_percentage = hold_time / hold_timer.wait_time
	force = hold_force * hold_percentage


func apply_movement():
	var player_position = global_position
	var direction = global_position.direction_to(get_global_mouse_position())
	apply_impulse(direction * force) #let's not use apply_impulse here
	label_text.text = str(force)
	label_text_2.text = str(direction)


func update_trajectory(delta):
	trajectory_line.clear_points()
	var max_points = 250
	var pos = global_position
	var vel = global_transform.x * force * global_position.direction_to(get_global_mouse_position())
	for i in max_points:
		trajectory_line.add_point(pos)
#		vel.y += gravity_scale * mass * i * delta
		pos += vel * delta
	print(vel)
	
#	var pos = global_position
#	var vel = global_transform.x * force
#	for i in max_points:
#		trajectory_line.add_point(pos)
#		vel.y += gravity_scale * delta
#		pos += vel * delta

#	var current_position = global_position
#	var trajectory_points = []
#	for i in max_points:
#		var impulse = force - gravity_scale * mass * i * delta
#		current_position.y -= impulse * delta
#		trajectory_points.append(current_position)
#	trajectory_line.points = trajectory_points
