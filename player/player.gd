extends RigidBody2D

# amount of force to apply to character on click
var hit_force : float = 50
@onready var label_text : Label = get_node("UILayer/Label")
@onready var timer : Timer = get_node("Timer")
@onready var timer_label : Label = get_node("UILayer/TimerLabel")

var button_press : Vector2
var button_release : Vector2
var hold_time : float


var held : bool = false

# hold button and release - force
# 1. on button press
# 2. on button release
# mouse position - direction 


# process should only handle the timer; all physics should be done when action released
func _process(_delta):
	timer_label.text = str(timer.time_left).pad_decimals(2)


func _input(event):
	if Input.is_action_just_pressed("action_hold"):
		timer.start()
	elif Input.is_action_just_released("action_hold"):
		get_hold_velocity()
		timer.stop()
		apply_movement()


func get_hold_velocity():
	hold_time = (timer.wait_time - timer.time_left) * 15


func apply_movement():
	var force = hit_force * hold_time
	print(force)
	var direction = global_position.direction_to(get_global_mouse_position())
	apply_impulse(direction * force)
