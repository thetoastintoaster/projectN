extends State
@export var returnState : State
@export var returnAnimationNode : String = "move"
@export var attack1Name : String = "attack1"
@export var attack2Name : String = "attack2"
@export var attack2Node : String = "attack2"

@onready var timer: Timer = $Timer


func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		timer.start()
		

func _on_animation_tree_animation_finished(animName):
	if (animName == attack1Name):
		if(timer.is_stopped()):
			nextState = returnState
			playback.travel(returnAnimationNode)
		else:
			playback.travel(attack2Node)
		
	if (animName == attack2Name):
		nextState = returnState
		playback.travel(returnAnimationNode)
