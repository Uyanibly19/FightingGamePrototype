class_name Player2 
extends KinematicBody2D

# DODO MAKE THIS A CLASS LIKE "PLAYER2" CLASS

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
		Input.get_action_strength("p2right")
		- Input.get_action_strength("p2left")
	)
	
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

func _ready():
	time = timeTillNextInput

func _process(delta):
	
	# DODO IF YOU SEE THIS, THIS IS GOOD BUT MAKE A STATE MACHINE AND A STATE CLASS TO PUT YOUR ANIMATION AND MECHNANICS
	
	if(Input.is_action_pressed("p2LP")):
		if(currentAttack == 0):
			animatedSprite.play("Light Punch") 
			#isAttack == true
	if(Input.is_action_just_released("p2LP")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("p2right")):
		if(currentAttack == 0):
			animatedSprite.play("Walk Backward")
	if(Input.is_action_just_released("p2right")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("p2left")):
		if(currentAttack == 0):
			animatedSprite.play("Walk Forward")
	if(Input.is_action_just_released("p2left")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("p2MP")):
		if(currentAttack == 0):
			animatedSprite.play("Medium Punch")
	if Input.is_action_just_released("p2MP"):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("p2LK")):
		if(currentAttack == 0):
			animatedSprite.play("Light Kick")
	if(Input.is_action_just_released("p2LK")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("p2up")):
		if(currentAttack == 0):
			animatedSprite.play("Jump")
	if(Input.is_action_just_released("p2up")):
		if(currentAttack == 0):
			animatedSprite.play("Idle")
	if(Input.is_action_pressed("p2down")):
		if(currentAttack == 0):
			animatedSprite.play("Ryu Crouch")
	if(Input.is_action_just_released("p2down")):
		if(currentAttack == 0 ):
			animatedSprite.play("Idle")

func take_damage(amount: int) -> void:
	animatedSprite.play("Ryu LightHit")
	print("Damage: ", amount)
