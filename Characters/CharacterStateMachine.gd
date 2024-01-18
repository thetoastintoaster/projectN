extends Node

class_name CharacterStateMachine

@export var character : CharacterBody2D
@export var animationTree :  AnimationTree
@export var currentState : State

var states : Array[State]

func _ready():
	for child in get_children():
		if(child is State):
			states.append(child)
			
			# Set the states up with what they need to function
			child.character = character
			child.playback = animationTree["parameters/playback"]
			
			#Connect to interrupt signal
			child.connect("interrupt_state", onStateInterruptState)
			
		else:
			push_warning("Child " + child.name + " is not a State for CharacterStateMachine")


func _physics_process(delta):
	if(currentState.nextState != null):
		switchStates(currentState.nextState)
		
	currentState.state_process(delta)

func checkIfCanMove():
	return currentState.can_move

func switchStates(newState : State):
	if(currentState != null):
		currentState.onExit()
		currentState.nextState = null
	currentState = newState
	
	currentState.onEnter()
	
func _input(event : InputEvent):
	currentState.state_input(event)

func onStateInterruptState(newState : State):
	switchStates(newState)
