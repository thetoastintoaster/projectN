extends State

class_name AirState

@export var landingState : State
@export var doubleJumpVelocity : float = -300
@export var doubleJumpAnimation : String = "jumpDouble"
@export var landingAnimation : String = "landing"
var hasDoubleJumped = false

func state_process(delta):
	if(character.is_on_floor()):
		nextState = landingState

func state_input(event : InputEvent):
	if(event.is_action_pressed("jump") && !hasDoubleJumped):
		doubleJump()
		
func onExit():
	if(nextState == landingState):
		playback.travel(landingAnimation)
		hasDoubleJumped = false

func doubleJump():
	character.velocity.y = doubleJumpVelocity
	playback.travel(doubleJumpAnimation)
	#animatedSprite.play("jumpDouble")
	#animationLocked = true
	hasDoubleJumped = true
