extends StateMachine


func _ready():
	add_state('Idle')
	add_state('Light_Punch')
	add_state('Medium_Punch')
	add_state('Light_Kick')
	add_state('WalkForward')
	add_state('WalkBackward')
	add_state('JumpB')
	add_state('JumpF')
	add_state('Jump')
	add_state('Ken_Crouch')
	call_deferred("set_state", states.STAND)

func state_logic(delta):
	parent.updatedframes(delta)
	parent._physics_process(delta)

func get_transition(delta):
	match state:
		states.Idle:
			pass
		states.Jump:
			pass
		states.JumpB:
			pass
		states.JumpF:
			pass
		states.WalkForward:
			pass
		states.WalkBackward:
			pass
		states.Ken_Crouch:
			pass

func enter_state(new_state, old_state):
	pass

func exit_state(old_state, new_state):
	pass

func state_includes(state_array):
	for each_state in state_array:
		if state == each_state:
			return true
	return false
