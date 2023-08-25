extends State

var isAttacking = false
onready var animated_sprite = $"../../AnimatedSprite"


func _ready():
	pass 


func _process(delta):
	if Input.is_action_pressed("p2down") && isAttacking == false:
		animated_sprite.play("RyuCrouch")
#The animation for both P2 and P1 don't have a crouching animation.
