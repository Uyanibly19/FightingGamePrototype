extends State


var isAttacking = false
onready var animated_sprite = $"../../AnimatedSprite"

func _ready():
	pass 



func _process(delta):
	if Input.is_action_pressed("p2up") && isAttacking == false:
		#animated_sprite.play("Jump")
		pass
# This script is showing that if they press "p2up" the character jumps and plays the animation jump.
