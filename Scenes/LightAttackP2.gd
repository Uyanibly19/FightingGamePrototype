extends State

onready var attack = $"../../../HitBoxes/P2Attack"
onready var animated_sprite = $"../../../AnimatedSprite"
var isAttacking = false

func _unhandled_input(event):
	if Input.is_action_pressed("p2LP"):
		animated_sprite.play("Red Light Attack")
		attack.disabled = false
		isAttacking = true
	else:
	#if Input.is_action_just_released("p2LP"):
		attack.disabled = true
		state_machine.transition_to("Red Idle")
# This part tells us that if the player pressed p2LP the character attacks and play the animation for attack.

func _on_AnimatedSprite_animation_finished():
	if animated_sprite.play("Red Light Attack"):
		$AttackArea/CollisionShape2D.disabled;
		isAttacking = false;
# This part is where the box (Collision shape 2D) activates the attack it's also the same for P1.
