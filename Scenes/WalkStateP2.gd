extends State


var isAttacking = false
onready var animated_sprite = $"../../AnimatedSprite"


func _ready():
	pass 



func _process(delta):
	if Input.is_action_pressed("p2right") && isAttacking == false:
		animated_sprite.play("Red Walking")
	elif Input.is_action_pressed("p2left") && isAttacking == false:
		animated_sprite.play("Red Walking")

# When I press left or right the character moves and plays the animation.
