extends KinematicBody2D

const UP_DIRECTION := Vector2.UP

export var speed := 600.0

export var jumpstrength := 1500.0
export var maximum_jumps := 2
export var double_jump_strength := 1200.0
export var gravity := 4500.0

onready var animatedSprite = $AnimatedSprite

var isInCombo = false

var timeTillNextInput = 0.5
var time = 0

var currentAttack = 0
var previousAttack = 0

var _jumps_made := 0
var _velocity := Vector2.ZERO

func _physics_process(delta: float) -> void:
	var _horizontal_direction = (
		Input.get_action_strength("right")
		- Input.get_action_strength("left")
	)
	
	_velocity.x = _horizontal_direction * speed
	_velocity.y += gravity * delta
	
	_velocity = move_and_slide(_velocity, UP_DIRECTION) 

func _ready():
	time = timeTillNextInput

func _process(_delta):
	if(Input.is_action_just_pressed("LP")):
		if(currentAttack == 0):
			animatedSprite.play("Light punch") 
	if(Input.is_action_just_released("LP")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_just_pressed("right")):
		if(currentAttack == 0):
			animatedSprite.play("WalkForward")
	if(Input.is_action_just_pressed("left")):
		if(currentAttack == 0):
			animatedSprite.play("WalkBackward")
	if(Input.is_action_pressed("MP")):
		if(currentAttack == 0):
			animatedSprite.play("Medium punch")
	if Input.is_action_just_pressed("MP"):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_just_pressed("LK")):
		if(currentAttack == 0):
			animatedSprite.play("Light kick")
	if(Input.is_action_just_released("LK")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
