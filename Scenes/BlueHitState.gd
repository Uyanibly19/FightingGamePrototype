extends State


onready var animated_sprite = $"../../AnimatedSprite"
onready var particles_2d = $"../../Particles2D"


func _on_AnimatedSprite_animation_finished():
	if animated_sprite.play("Blue Hit"):
		state_machine.transition_to("Idle")

func _on_HurtBoxes_area_entered(hitbox):
	particles_2d.emitting = true

# Just like the P2Hit state script animation doesn't play so I used particles instead.
