extends Node2D

@onready var sprite = $Sprite2D
@onready var killzone = $Killzone/CollisionShape2D

@export var cycle = false
@export var cycleSpeed = 0.1

var edge_fade = 0.311

var min_edge_fade = 0.2
var max_edge_fade = 0.7

var ef_increasing = false

func _process(delta):
	if cycle:
		# Change edge fade of sunlight
		if ef_increasing:
			edge_fade += cycleSpeed * delta
		else:
			edge_fade -= cycleSpeed * delta
			
		sprite.material.set_shader_parameter("edge_fade", edge_fade)
			
		# Handle killzone
		if edge_fade >= 0.5:
			killzone.disabled = true
		else:
			killzone.disabled = false
			
		# Change whether alpha should increase or decrease
		if edge_fade <= min_edge_fade:
			ef_increasing = true
		if edge_fade >= max_edge_fade:
			ef_increasing = false
			
