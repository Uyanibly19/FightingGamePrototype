extends KinematicBody2D

onready var AnimatedSprite = $AnimatedSprite

var isIncombo = false

var timeTillNextInput = 0.5
var time = 0

var currentAttack = 0
var previousAttack = 0

func _ready():
	time = timeTillNextInput


func _process(delta):
	if(Input.is_action_just_pressed("ui_punch")):
		if(currentAttack == 0):
			AnimatedSprite.play("Light punch")
		elif(currentAttack == 1):
			AnimatedSprite.play("Medium Punch")
		elif(currentAttack == 2):
			AnimatedSprite.play("Light Kick")

		isIncombo = true
		currentAttack += 1
		_Reset_Attack_Timer()
		
		if(isIncombo):
			time -= delta
		
		if(time < 0):
			time = timeTillNextInput
			isIncombo = false
			currentAttack = 0
			AnimatedSprite.play("Idle")

func _Reset_Attack_Timer():
	if(currentAttack < 4):
		time = timeTillNextInput
