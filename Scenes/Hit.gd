extends State


onready var animated_sprite = $"../../AnimatedSprite"
onready var particles_2d = $"../../Particles2D"



func _on_AnimatedSprite_animation_finished():
	if animated_sprite.play("Red Hit"):
		state_machine.transition_to("Idle")

func _on_HurtBoxes_area_entered(hitbox):
	particles_2d.emitting = true

# Animantion doesn't work so I used particles instead.
