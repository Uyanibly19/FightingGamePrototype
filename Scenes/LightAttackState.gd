extends State

onready var attack = $"../../../HitBoxes/P1Attack"
onready var animated_sprite = $"../../../AnimatedSprite"
var isAttacking = false

func _unhandled_input(event):
	if Input.is_action_just_pressed("LP"):
		animated_sprite.play("Light Slash")
		attack.disabled = false
		isAttacking = true
	else:
	#if Input.is_action_just_released("LP"):
		attack.disabled = true
		state_machine.transition_to("Idle")


func _on_AnimatedSprite_animation_finished():
	if animated_sprite.play("Light Slash"):
		$AttackArea/CollisionShape2D.disabled = true;
		isAttacking = false;

#When I press the input = "U" the character plays an attack and the attack hitbox glows.
