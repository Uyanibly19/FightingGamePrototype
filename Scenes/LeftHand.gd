extends Area2D


onready var anim = $AnimatedSprite

func attack():
	anim.play("Light Punch")
	
