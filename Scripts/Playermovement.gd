extends KinematicBody2D

const UP_DIRECTION := Vector2.UP

export var speed := 300.0

export var jumpstrength := 1400.0
export var maximum_jumps := 2
export var double_jump_strength := 1000.0
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
	
	var is_falling := _velocity.y > 0.0 and not is_on_floor()
	var is_jumping := Input.is_action_just_pressed("up") and is_on_floor()
	var is_idling := is_on_floor() and is_zero_approx(_velocity.x)
	var is_running := is_on_floor() and not is_zero_approx(_velocity.x)
	
	if is_jumping:
		_jumps_made += 0
		_velocity.y = -jumpstrength
	_velocity = move_and_slide(_velocity, UP_DIRECTION) 

func _ready():
	time = timeTillNextInput

func _process(_delta):
	if(Input.is_action_pressed("LP")):
		if(currentAttack == 0):
			animatedSprite.play("Light punch") 
	if(Input.is_action_just_released("LP")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("right")):
		if(currentAttack == 0):
			animatedSprite.play("WalkForward")
	if(Input.is_action_just_released("right")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("left")):
		if(currentAttack == 0):
			animatedSprite.play("WalkBackward")
	if(Input.is_action_just_released("left")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("MP")):
		if(currentAttack == 0):
			animatedSprite.play("Medium punch")
	if Input.is_action_just_released("MP"):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("LK")):
		if(currentAttack == 0):
			animatedSprite.play("Light kick")
	if(Input.is_action_just_released("LK")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("up")):
		if(currentAttack == 0):
			animatedSprite.play("Jump")
	if(Input.is_action_just_released("up")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("down")):
		if(currentAttack ==0 ):
			animatedSprite.play("Ken Crouch")
	if (Input.is_action_just_released("down")):
		if(currentAttack == 0 ):
			animatedSprite.play("Idle")
