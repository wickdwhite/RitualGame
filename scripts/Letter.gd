extends Sprite2D

var bounce_height = 4.0 
var bounce_speed = 4.0
var original_position = Vector2()
var time_passed = 0.0

func _ready():
	original_position = position

func _process(delta):
	time_passed += delta
	
	var new_y = original_position.y + sin(time_passed * bounce_speed) * bounce_height
	
	position.y = new_y

func hide_letter():
	visible = false
