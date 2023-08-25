extends KinematicBody2D
#This is the final script for PLayer 2 

const UP_DIRECTION := Vector2.UP

#This is how fast the charcter should be.
export var speed := 300.0

export var jumpstrength := 1400.0
export var maximum_jumps := 2
export var double_jump_strength := 1000.0
export var gravity := 4500.0

onready var animatedSprite = $AnimatedSprite

var isInCombo = false
var isAttacking = false

var timeTillNextInput = 0.5
var time = 0

var currentAttack = 0
var previousAttack = 0

var _jumps_made := 0
var _velocity := Vector2.ZERO

var vitalityHP = 100

var frame = 0
func updateframes(delta):
	frame += 1

func _physics_process(delta: float) -> void:
	var _horizontal_direction = (
		Input.get_action_strength("p2right")
		- Input.get_action_strength("p2left")
	)
	# Pressing the input (left and right) make the character move left and right.
	
	_velocity.x = _horizontal_direction * speed
	_velocity.y += gravity * delta
	
	var is_falling := _velocity.y > 0.0 and not is_on_floor()
	var is_jumping := Input.is_action_just_pressed("p2up") and is_on_floor()
	var is_idling := is_on_floor() and is_zero_approx(_velocity.x)
	var is_running := is_on_floor() and not is_zero_approx(_velocity.x)
	
	if is_jumping:
		_jumps_made += 0
		_velocity.y = -jumpstrength
	_velocity = move_and_slide(_velocity, UP_DIRECTION) 

# Pressing the input (up) makes the character jump. 
func _ready():
	time = timeTillNextInput

