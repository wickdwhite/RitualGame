extends Area2D

@onready var letter_sprite = $"../Area2D/Letter"
@onready var player = $"../player"
@onready var SceneTransitionAnimation = $"../SceneTransitionAnimation/AnimationPlayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	SceneTransitionAnimation.get_parent().get_node("ColorRect").color.a = 255
	SceneTransitionAnimation.play("fade_out")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "player" and player.holding_letter == true:  #making sure it detects correct object
		#player.collect_letter()
		Global.letters_collected += 1
		print("collected")
		letter_sprite.hide_letter()
		player.holding_letter = false
		PaperUi.show_letter()
		
		
func change_scene():# Change scenes back to starting room
	print("here1")
	SceneTransitionAnimation.play("fade_in")
	print("here2")
	await get_tree().create_timer(1.5).timeout
	get_tree().change_scene_to_file("res://scenes/game_level.tscn")
