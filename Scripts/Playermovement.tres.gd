extends KinematicBody2D

onready var AnimatedSprite = $AnimatedSprite

var isIncombo = false

var timeTillNextInput = 0.5
var time = 0

var currentAttack = 0
var previousAttack = 0

onready var ColliderScript = $Colliders

func _ready():
	time = timeTillNextInput


func _process(_delta):
	if(Input.is_action_just_pressed("ui_punch")):
		if(currentAttack == 0):
			_Reset_Previous_Attack(previousAttack)
			previousAttack = 3
			
			ColliderScript.p1FightColl[3].position += Vector2(25,0)
			ColliderScript._Handle_Specific_Collider_Disabling(false, 3)
			AnimatedSprite.play("Light punch")
		elif(currentAttack == 1):
			_Reset_Previous_Attack(previousAttack)
			previousAttack = 3
			
			ColliderScript.p1FightColl[3].position += Vector2(5,-27)
			ColliderScript._Handle_Specific_Collider_Disabling(false, 3)
			AnimatedSprite.play("Medium Punch")
		elif(currentAttack == 2):
			_Reset_Previous_Attack(previousAttack)
			previousAttack = 3
			
			ColliderScript.p1FightColl[3].position += Vector2(75, -13)
			ColliderScript._Handle_Specific_Collider_Disabling(false, 3)
			AnimatedSprite.play("Light Kick")

	if(Input.is_action_just_pressed("ui_left")):
		if(currentAttack == 0):
			_Reset_Previous_Attack(previousAttack)
			previousAttack = 3
			
			ColliderScript.p1FightColl[3].position += Vector2(25,0)
			ColliderScript._Handle_Specific_Collider_Disabling(false, 3)
			AnimatedSprite.play("WalkBackward")
	if(Input.is_action_just_pressed("ui_right")):
		if(currentAttack == 0):
			AnimatedSprite.play("WalkForward")

		isIncombo = true
		currentAttack += 1
		_Reset_Attack_Timer()

		if(isIncombo):
			time -= _delta
		
		if(time < 0):
			time = timeTillNextInput
			isIncombo = false
			currentAttack = 0
			_Reset_Previous_Attack(previousAttack)
			
			AnimatedSprite.play("Idle")

func _Reset_Attack_Timer():
	if(currentAttack < 4):
		time = timeTillNextInput

func _Reset_Previous_Attack(var previousAttackID):
	ColliderScript.p1FightColl[previousAttackID].position = Vector2(0,0)
	ColliderScript._Handle_Specific_Collider_Disabling(true, previousAttackID)
