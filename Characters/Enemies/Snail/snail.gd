extends CharacterBody2D

@onready var animationTree : AnimationTree = $AnimationTree


@export var startingMoveDirection :  Vector2 = Vector2.LEFT
@export var movementSpeed : float = 30.0
@export var hitState : State

@onready var stateMachine : CharacterStateMachine = $CharacterStateMachine

#const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animationTree.active = true
	
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction : Vector2 = startingMoveDirection
	if direction && stateMachine.checkIfCanMove():
		velocity.x = direction.x * movementSpeed
	elif stateMachine.currentState != hitState:
		velocity.x = move_toward(velocity.x, 0, movementSpeed)

	move_and_slide()
