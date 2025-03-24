extends CharacterBody2D


@export var walk_speed : float = 58.0
@export var jump_velocity = -220.0
@export_range(0,1) var deceleration =0.1
@export_range(0,1) var acceleration =0.1
@export_range(0,1) var decelerate_on_jump_release = 0.4

@export var dash_speed = 400.0
@export var dash_max_distance = 21.0
@export var dash_curve: Curve
@export var dash_cooldown = 1.0
@onready var animated_sprite_2d = $AnimatedSprite2D


#gravity from  project settings synced with RigidBody nodes
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var is_dashing = false
var dash_start_position = 0
var dash_direction = 0
var dash_timer = 0


func _physics_process(delta):
	
	var _animated_sprite = $AnimatedSprite2D
	if Input.is_action_pressed("right") or Input.is_action_pressed("left"):
		_animated_sprite.play("walk")
	else:
		_animated_sprite.play("idle")
	
	#gravityyy
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y *= decelerate_on_jump_release

	var direction = Input.get_axis("left", "right")
	
	if direction:
		velocity.x = move_toward(velocity.x, direction * walk_speed, walk_speed * deceleration)
	else:
		velocity.x = move_toward(velocity.x, 0, walk_speed * deceleration)
		
	#activate dash
	if Input.is_action_just_pressed("dash") and direction and not is_dashing and dash_timer <= 0:
		is_dashing = true
		dash_start_position = position.x
		dash_direction = direction
		dash_timer = dash_cooldown
 
	#actual dash
	if is_dashing:
		var current_distance = abs(position.x - dash_start_position)
		if current_distance >= dash_max_distance or is_on_wall():
			is_dashing = false
		else:
			velocity.x = dash_direction * dash_speed * dash_curve.sample(current_distance / dash_max_distance)
			velocity.y = 0
 
	#reduces dash timer
	if dash_timer > 0:
		dash_timer -= delta

	move_and_slide()
	
	var isLeft = velocity.x < 0
	animated_sprite_2d.flip_h = isLeft
