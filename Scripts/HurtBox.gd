class_name HurtBoxes
extends Area2D

# DODO REWORK ON THIS - CHECK THE HITBOXES AND HURTBOXES TOO

func _init() -> void:
	collision_layer = 0
	collision_mask = 2
	
	
func _ready() -> void: 
	connect("area_entered", self, "_on_are_entered")


func _on_area_entered(hitbox: HitBox) -> void:
	if HitBox == null:
		return
	
	if owner.has_method("take_damage"):
		owner.take_damage(HitBox.damage)
