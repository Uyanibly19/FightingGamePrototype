extends State

var isAttacking = false
onready var animated_sprite = $"../../AnimatedSprite"


func _ready():
	pass 


func _process(delta):
	if Input.is_action_pressed("down") && isAttacking == false:
		animated_sprite.play("Ken_Crouch")
