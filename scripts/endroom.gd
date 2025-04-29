extends Node2D
var resource = load("res://dia/dialogue.dialogue")
@onready var endtext = $Label
@onready var player = $player
var seen = false

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.dialogue_ended.connect(_on_dialogue_ended)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_2d_body_entered(body):
	if not seen:
		DialogueManager.show_dialogue_balloon(resource, "ending")
		seen = true
		await get_tree().create_timer(1.0).timeout 
		$player.get_node("AnimatedSprite2D").play("idle")
		$player.set_physics_process(false)
	
func _on_dialogue_ended(resource):
	await get_tree().create_timer(1.0).timeout 
	$stab.play()
	$player.visible = false
	await get_tree().create_timer(2.0).timeout 
	endtext.visible = true
	await get_tree().create_timer(5.0).timeout 
	get_tree().quit()
