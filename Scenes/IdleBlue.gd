extends State


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var isAttacking = false
var isHurt = false
onready var animated_sprite = $"../../AnimatedSprite"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#animated_sprite.play("Blue Idle")
	
	if Input.is_action_pressed("right") && isAttacking == false:
		state_machine.transition_to("Walk")
	elif Input.is_action_pressed("left") && isAttacking == false:
		state_machine.transition_to("Walk")
	else:
		if isAttacking == false:
			animated_sprite.play("Blue Idle")


func _on_HurtBoxes_area_entered(hitbox):
	print("P1 Hit!")
	isHurt = true
	if isHurt == true:
		state_machine.transition_to("Hit")
	else:
		animated_sprite.play("Blue Idle")
