extends Node2D
@onready var SceneTransitionAnimation = $SceneTransitionAnimation/AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	SceneTransitionAnimation.get_parent().get_node("ColorRect").color.a = 255
	SceneTransitionAnimation.play("fade_out")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
func _on_area_2d_body_entered(body):
	SceneTransitionAnimation.play("fade_in")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_leavehall_body_entered(body):
	SceneTransitionAnimation.play("fade_in")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/game_level.tscn")
