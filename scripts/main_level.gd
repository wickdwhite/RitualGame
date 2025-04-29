extends Node2D
var resource = load("res://dia/dialogue.dialogue")
@onready var SceneTransitionAnimation = $SceneTransitionAnimation/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayer.play_music_level()
	SceneTransitionAnimation.get_parent().get_node("ColorRect").color.a = 255
	SceneTransitionAnimation.play("fade_out")
	#if !Global.intro_seen:
		#await get_tree().create_timer(0.5).timeout
		#DialogueManager.show_dialogue_balloon(resource, "start")
		#Global.intro_seen=true
	match Global.letters_collected:
		0:
			await get_tree().create_timer(0.5).timeout
			DialogueManager.show_dialogue_balloon(resource, "start")
			Global.intro_seen=true
		1:
			DialogueManager.show_dialogue_balloon(resource, "letter1")
		2:
			DialogueManager.show_dialogue_balloon(resource, "letter2")
		3:
			DialogueManager.show_dialogue_balloon(resource, "letter3")
		4:
			DialogueManager.show_dialogue_balloon(resource, "letter4")
		5:
			DialogueManager.show_dialogue_balloon(resource, "letter5")
		6:
			DialogueManager.show_dialogue_balloon(resource, "letter6")
			DialogueManager.dialogue_ended.connect(_on_dialogue_ended)
		_:
			DialogueManager.show_dialogue_balloon(resource, "letter6")
			DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_leave_room_body_entered(body):
	if body.name == "player" and Global.letters_collected < 6:
		SceneTransitionAnimation.play("fade_in")
		await get_tree().create_timer(1.5).timeout
		Global.intro_seen = true
		get_tree().change_scene_to_file("res://scenes/hall.tscn") 
	
func _on_dialogue_ended(resource):
	SceneTransitionAnimation.play("fade_in")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/endroom.tscn") 
