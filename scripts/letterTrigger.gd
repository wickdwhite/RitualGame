extends Area2D

var player_inside = false
var resource = load("res://dia/dialogue.dialogue")
@onready var label = $Label
@onready var letter_sprite = $Letter
@onready var player = $"../player"
var interact_tutorial_seen=false

var following = false
var follow_speed = 300.0
var follow_accel = 2.0

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
	if player_inside and Input.is_action_just_pressed("interact") and not interact_tutorial_seen:
		#letter_sprite.follow_player()
		following = true
		label.hide()
		interact_tutorial_seen=true;
		$PaperSound.play()
		DialogueManager.show_dialogue_balloon(resource, "letter1")
		print("grabbed")
		player.holding_letter = true
		
	if following:
		position.x = player.position.x - 270
		position.y = player.position.y + 50
