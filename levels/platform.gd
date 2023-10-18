extends Node2D

@onready var timeout_timer = $TimeoutTimer
@onready var drop_timer = $DropTimer
@onready var despawn_timer = $DespawnTimer
@onready var platform_body = $PlatformBody

func drop_platform():
	platform_body.gravity_scale = .05

func _on_collision_detection_body_entered(body):
	drop_timer.start()
	timeout_timer.stop()

func _on_timeout_timer_timeout():
	drop_platform()
	despawn_timer.start()

func _on_drop_timer_timeout():
	drop_platform()
	despawn_timer.start()

func _on_despawn_timer_timeout():
	queue_free()
