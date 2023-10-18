# on timer timeout call function to generate new platform

extends Node2D

@onready var platform_scene : Resource = load("res://levels/platform_test.tscn")

const SCREEN_SIZE_X : int = 1280
const SCREEN_SIZE_Y : int = 720


func _ready():
	var scene_instance = platform_scene.instantiate()
	scene_instance.set_name("scene")
	scene_instance.transform.origin = Vector2(640, 360)
	add_child(scene_instance)


# get random int in screen size X and Y
# set new instnace at origin
func generate_platform():
	pass
