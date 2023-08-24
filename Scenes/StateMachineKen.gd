extends StateMachine
export(int) var id = 1

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
	call_deferred("set_state", states.Idle)

func state_logic(delta):
	parent.updateframes(delta)
	parent._physics_process(delta)

# HEY DODO = STOP WORKING ON THIS!!! IT WORKED BEFORE SO DON'T TOUCH IT!!!
# (╯°□°）╯︵ ┻━┻

func get_transition(delta):
	parent.move_and_slide(parent._velocity, parent.UP_DIRECTION) 
	match state:
		states.Idle:
			if Input.is_action_pressed("right"):
				parent._velocity.x = parent.speed
				parent.frame()
				return states.WalkForward
			if Input.is_action_pressed("left"):
				parent._velocity.x = parent.speed
				parent.frame()
				return states.WalkBackward
			if parent._velocity.x > 0 and state == states.Idle:
				parent._velocity.x += -parent.TRACTION*1
				parent._velocity.x = clamp(parent._velocity.x,parent._velocity.x,0)
			elif parent._velocity.x > 0 and state == states.Idle:
				parent._velocity.x += -parent.TRACTION*1
				parent._velocity.x = clamp(parent._velocity.x,parent._velocity.x,0)
		states.Jump:
			pass
		states.JumpB:
			pass
		states.JumpF:
			pass
		states.WalkForward:
			if Input.is_action_pressed("left"):
				if parent._velocity.x > 0:
					parent.frame()
				parent._velocity.x = -parent.speed
			elif Input.is_action_pressed("right"):
				if parent._velocity.x < 0:
					parent.frame()
				parent._velocity.x = parent.speed 
			else:
				#if parent.frame >= parent.dash_duration-1:
				return states.Idle
					
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
