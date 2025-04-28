extends Area2D

@onready var timer: Timer = $Timer
#@onready var player = $".../player"



func _on_body_entered(body: Node2D) -> void:
	#player.visible = false
	if body.name == "player":
		print("You died")
		timer.start()
	



func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
