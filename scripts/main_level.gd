extends Node2D
var resource = load("res://dia/dialogue.dialogue")
@onready var SceneTransitionAnimation = $SceneTransitionAnimation/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayer.play_music_level()
	SceneTransitionAnimation.get_parent().get_node("ColorRect").color.a = 255
	SceneTransitionAnimation.play("fade_out")
	if !Global.intro_seen:
		await get_tree().create_timer(0.5).timeout
		DialogueManager.show_dialogue_balloon(resource, "start")
		Global.intro_seen=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_leave_room_body_entered(body):
	SceneTransitionAnimation.play("fade_in")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/hall.tscn") 
