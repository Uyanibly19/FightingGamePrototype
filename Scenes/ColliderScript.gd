extends Node2D

var p1FightColl = []
var disableColl = true

func _ready():
	_Handle_All_Collider_Disabling(disableColl)


func _process(_delta):
	if(Input.is_action_just_pressed("ui_left")):
		disableColl = !disableColl
		_Handle_All_Collider_Disabling(disableColl)
	
	if(Input.is_action_just_pressed("ui_down")):
		disableColl = !disableColl
		_Handle_Specific_Collider_Disabling(disableColl, 0)

func _on_Left_Hand_body_entered(_body):
	pass # Replace with function body.


func _on_Right_Hand_body_entered(_body):
	pass # Replace with function body.


func _on_Left_Feet_body_entered(_body):
	pass # Replace with function body.


func _on_Right_Feet_body_entered(_body):
	pass # Replace with function body.

func _Handle_All_Collider_Disabling(var isDisable):
	for colliders in get_tree().get_nodes_in_group("P1 Hand Feet Coll"):
		var h = 0
		
		p1FightColl.insert(h, colliders)
		p1FightColl[h].set_disabled(isDisable)
		
		print(p1FightColl[h].name)
		
		if(p1FightColl[h].is_disabled()):
			print(p1FightColl[h].name + " is disabled")
		elif(p1FightColl[h].is_disabled()):
			print(p1FightColl[h].name + " is NOT Disabled")
			
			print("")
			h += 1

func _Handle_Specific_Collider_Disabling(var isDisabled, var pickedColl):
	p1FightColl[pickedColl].set_disabled(isDisabled)
	
	if(p1FightColl[pickedColl].is_Disabled()):
		print(p1FightColl[pickedColl].name + " has been enabled")
	elif(!p1FightColl[pickedColl].is_Disabled()):
		print(p1FightColl[pickedColl].name + " hasd been DIS-abled")
