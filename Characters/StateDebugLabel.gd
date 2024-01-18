extends Label

@export var stateMachine : CharacterStateMachine

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "State: " + stateMachine.currentState.name
