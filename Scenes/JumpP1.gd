extends State


var isAttacking = false
onready var animated_sprite = $"../../AnimatedSprite"

func _ready():
	pass 



func _process(delta):
	if Input.is_action_pressed("up") && isAttacking == false:
		#animated_sprite.play("KenJump")
		pass
# This script is showing that if they press "up" the character jumps and plays the animation jump.
