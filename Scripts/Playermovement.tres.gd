extends KinematicBody2D


# Float
var timeTillNextInput = 0.2
var time = timeTillNextInput

# Integer

# Boolean
var wasInputMade = false
var isCrouch = false

# Array
var usedKeys = []

# Vector

# Object
onready var playerAnimSprite = $AnimatedSprite.get("parameters/playback")

# Refrences
var generalMoveSetAnims = MoveSetManager.nameDictionary["General"]
var specificMoveSetAnims = MoveSetManager.nameDictionary

func _ready():
	pass

func _input(event):
# If there is an Input made, signal it only once
	if event is InputEventKey:
		if event.pressed and not event.echo:
			
			# Make a new tmep variable to store our input in
			var character = OS.get_scancode_string(event.scancode)
			
			# Check if the input made is also allowed to be used
			if "WASDLP".find(character) >= 0:
				wasInputMade = true
				time = timeTillNextInput
				usedKeys.append(character)

func _process(delta):
	pass

func _send_combo_attempt(var attempt = [])
	pass










