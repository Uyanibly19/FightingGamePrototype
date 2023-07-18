extends KinematicBody2D

const UP_DIRECTION := Vector2.UP

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
	if Input.is_action_pressed("p2left") && isAttacking == false:
		$AnimatedSprite.play("Walk Forward")
	elif Input.is_action_pressed("p2right") && isAttacking == false:
		$AnimatedSprite.play("Walk Backward")
	else:
		if isAttacking == false:
			$AnimatedSprite.play("Idle")
	
	if Input.is_action_just_pressed("p2MP"):
		$AnimatedSprite.play("Medium Punch")
		isAttacking = true
		$HitBoxes/Attack.disabled = false
	

func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Medium Punch" && isAttacking:
		$HitBoxes/Attack.disabled = true
		isAttacking = false
	
	#if $AnimatedSprite.animation == "Medium Punch":
	#	$AnimatedSprite.play("Ryu LightHit")

func _on_HurtBoxes_area_entered(area):
	if area.is_in_group("P1Attack"):
		$AnimatedSprite.play("Ryu LightHit")
