extends Sprite2D

var bounce_height = 4.0 
var bounce_speed = 4.0
var original_position = Vector2()
var time_passed = 0.0

@onready var player = $"../../player"
@onready var area = $".."

var following = false
var follow_speed = 300.0
var follow_accel = 2.0

func _ready():
	original_position = position

func _process(delta):
	time_passed += delta
	
	var new_y = original_position.y + sin(time_passed * bounce_speed) * bounce_height
	position.y = new_y
	
func follow_player():
	following = true
	# position = lerp(player.position - position, follow_speed, delta * follow_accel)

func hide_letter():
	visible = false
