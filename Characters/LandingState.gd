extends State

@export var landingAnimationName : String = "landing"
@export var groundState : State

func _on_animation_tree_animation_finished(animName):
	if(animName == landingAnimationName):
		nextState = groundState
