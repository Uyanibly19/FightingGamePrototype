extends Node

class_name State

# load state machine - itself - _get_state_machine() is in this script
onready var state_machine = _get_state_machine(self)
onready var parent = get_parent()

func _init():
	# make sure the node is always in the "state" group
	add_to_group("state")

# Executed when entering the state
func enter():
	if parent.is_in_group("state"):
		parent.enter()

# Executed when entering the state
func exit():
	if parent.is_in_group("state"):
		parent.exit()

# Wrapper method for the _input handler.
# Make sure to use this method instead of the original one to prevent the code from being executed
# unintentionally (e.g. when in another state) - input() not _input()!!!
func input(event):
	if parent.is_in_group("state"):
		parent.input(event)

# Wrapper method for the _input handler.
# Make sure to use this method instead of the original one to prevent the code from being executed
# unintentionally (e.g. when in another state) - unhandled_input() not _unhandled_input()!!!
func unhandled_input(event):
	if parent.is_in_group("state"):
		parent.process(event)

# Wrapper method for the _input handler.
# Make sure to use this method instead of the original one to prevent the code from being executed
# unintentionally (e.g. when in another state) - process() not _process()!!!
func process(delta):
	if parent.is_in_group("state"):
		parent.process(delta)

# Wrapper method for the _input handler.
# Make sure to use this method instead of the original one to prevent the code from being executed
# unintentionally (e.g. when in another state) - physics_process() not _physics_process()!!!
func physics_process(delta):
	if parent.is_in_group("state"):
		parent.physics_process(delta)

# Traverse the scene tree upwards to find the state machine that contains this state
func _get_state_machine(node):
	if !node:
		return null
	
	if node.is_in_group("state_machine"):
		return node
	
	return _get_state_machine(node.get_parent())
