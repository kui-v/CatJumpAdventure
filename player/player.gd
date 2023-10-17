extends RigidBody2D

# amount of force to apply to character on click
var hit_force : float = 50
@onready var label_text : Label = get_node("UILayer/Label")

var button_press : Vector2
var button_release : Vector2

# hold button and release - force
# 1. on button press
# 2. on button release
# mouse position - direction 

func _process(_delta):
#	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
#		var direction = global_position.direction_to(get_global_mouse_position())
#		apply_impulse(direction * hit_force)
#		label_text.text = str("Diection: ", direction)

	if Input.is_action_just_pressed("action_hold"):
		print("hey")
		MouseHold()

func MouseHold():
	var time : int = 0
	if Input.is_action_pressed("action_hold"):
		await(get_tree().create_timer(10))
		time += 1
	if !Input.is_action_pressed("action_hold"):
		return
	print(time)
