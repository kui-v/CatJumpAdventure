extends RigidBody2D

@onready var hold_timer : Timer = get_node("Timer")
@onready var label_text : Label = get_node("UILayer/Label")
@onready var label_text_2 : Label = get_node("UILayer/Label2")
@onready var timer_label : Label = get_node("UILayer/TimerLabel")

var hold_time : float = 0
var hold_force : float = 75

# hold button and release - force
# 1. on button press
# 2. on button release
# mouse position - direction 


# process should only handle the timer; all physics should be done when action released
func _process(_delta):
	timer_label.text = str(hold_timer.time_left).pad_decimals(2)
	calculate_trajectory(_delta)


# using mouse and moving at the same time will make timer not work as expected
func _input(event):
	if Input.is_action_just_pressed("action_hold"):
		hold_timer.start()
	elif Input.is_action_just_released("action_hold"):
		get_hold_velocity()
		hold_timer.stop()
		apply_movement()


func get_hold_velocity():
	hold_time = (hold_timer.wait_time - hold_timer.time_left)


func apply_movement():
	var force = hold_force * hold_time
	var direction = global_position.direction_to(get_global_mouse_position())
	apply_impulse(direction * force)
	label_text.text = str(force)
	label_text_2.text = str(direction)


func calculate_trajectory(delta):
	var position = global_position
	print(position)
