extends Camera2D
@export var fixed_bottom: int = 126
@export var fixed_top: int = -232

# Called when the node enters the scene tree for the first time.
func _ready():
	limit_bottom = fixed_bottom
	limit_top = fixed_top

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
