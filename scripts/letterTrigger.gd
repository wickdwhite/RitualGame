extends Area2D

var player_inside = false
var resource = load("res://dia/dialogue.dialogue")
@onready var label = $Label
@onready var letter_sprite = $Letter
var interact_tutorial_seen=false

func _ready():
	label.hide()
	
	
func _on_body_entered(body):
	if body.name == "player":  #making sure it detects correct object
		player_inside = true
		if !interact_tutorial_seen:
			label.show()

func _on_body_exited(body):
	if body.name == "player":
		player_inside = false
		label.hide()
		
func _process(_delta):
	if player_inside and Input.is_action_just_pressed("interact"):
		letter_sprite.hide_letter()
		label.hide()
		interact_tutorial_seen=true;
		$PaperSound.play()
		DialogueManager.show_dialogue_balloon(resource, "start")
		


