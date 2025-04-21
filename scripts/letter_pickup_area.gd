extends Area2D

@onready var letter_sprite = $"../Area2D/Letter"
@onready var player = $"../player"



		
#func _process(_delta):
	#if player_inside and Input.is_action_just_pressed("interact"):
		##letter_sprite.follow_player()
		#following = true
		#label.hide()
		#interact_tutorial_seen=true;
		#$PaperSound.play()
		#DialogueManager.show_dialogue_balloon(resource, "start")
		#
	#if following:
		#position.x = player.position.x - 270
		#position.y = player.position.y + 50


func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" and player.holding_letter == true:  #making sure it detects correct object
		player.collect_letter()
		print("collected")
		letter_sprite.hide_letter()
		player.holding_letter = false
