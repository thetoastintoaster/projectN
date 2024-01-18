extends State

class_name GroundState

@export var jumpVelocity : float = -250.0
@export var airState : State
@export var jumpAnimation : String = "jump"
@export var attackState : State
@export var attackAnimation : String = "attack1"
@export var attackNode : String = "attack1"

# To prevent the Player from transitioning into Air -> Landing -> Ground state on spawn
# aka, to keep the Player in Ground state
@onready var bufferTimer : Timer = $BufferTimer

func state_process(delta):
	if(!character.is_on_floor() && bufferTimer.is_stopped()):
		nextState = airState
		
func state_input(event : InputEvent):
	if(event.is_action_pressed("jump")):
		jump()
	if(event.is_action_pressed("attack")):
		attack()
		

func jump():
	character.velocity.y = jumpVelocity
	nextState = airState
	playback.travel(jumpAnimation)
	

func attack():
	nextState = attackState
	playback.travel(attackAnimation)
	playback.travel(attackNode)
