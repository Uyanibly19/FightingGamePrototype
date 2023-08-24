extends State

var isAttacking = false
onready var animated_sprite = $"../../AnimatedSprite"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("p2right") && isAttacking == false:
		state_machine.transition_to("Walk")
	elif Input.is_action_pressed("p2left") && isAttacking == false:
		state_machine.transition_to("Walk")
	else:
		if isAttacking == false:
			animated_sprite.play("Red Idle")


func _on_HurtBoxes_area_entered(hitbox):
	print("P2 Hit!")
	state_machine.transition_to("Hit")
	
