extends Node2D

@onready var platform_scene : Resource = load("res:///platforms/skinny_platform.tscn")
@onready var generation_timer : Timer = $GenerationTimer

const SCREEN_SIZE_X : int = 287
const SCREEN_SIZE_Y : int = 158


func _ready():
	var scene_instance = platform_scene.instantiate()
	scene_instance.set_name("scene")
	scene_instance.transform.origin = Vector2(0, 25)
	add_child(scene_instance)
	generation_timer.start()


func generate_platform():
	var rand_pos : Vector2 = get_random_position()
	var new_scene_instance = platform_scene.instantiate()
	new_scene_instance.set_name(str("scene", rand_pos.x))
	new_scene_instance.transform.origin = rand_pos
	add_child(new_scene_instance)


func get_random_position():
	var rand_x = randi_range(-SCREEN_SIZE_X, SCREEN_SIZE_X)
	var rand_y = randi_range(-SCREEN_SIZE_Y, SCREEN_SIZE_Y)
	return Vector2(rand_x, rand_y)


func _on_generation_timer_timeout():
	pass
#	generate_platform()

# to do: create a parabolic line that shows where player will launch to 
