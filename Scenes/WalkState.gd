extends State

var isAttacking = false
onready var animated_sprite = $"../../AnimatedSprite"


func _ready():
	pass 

func _process(delta):
	if Input.is_action_pressed("right"):
		animated_sprite.play("Blue Walking")
	elif Input.is_action_pressed("left"):
		animated_sprite.play("Blue Walking")
# This is how the characters going to move left and right, It's also the same for P2.
