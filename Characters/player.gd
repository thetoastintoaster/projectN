extends CharacterBody2D

class_name Player

@export var speed : float = 200.0

@onready var sprite : Sprite2D = $Sprite2D
@onready var animationTree : AnimationTree = $AnimationTree
@onready var stateMachine : CharacterStateMachine = $CharacterStateMachine

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction : Vector2 = Vector2.ZERO

signal facingDirectionChanged(facing_right : bool)

func _ready():
	animationTree.active = true
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")
	if direction.x != 0:
	#if direction.x != 0 && state_machine.checkIfCanMove():
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	updateAnimationParameters()
	updateFacingDirection()
	
	
func updateAnimationParameters():
	animationTree.set("parameters/move/blend_position", direction.x)
			
func updateFacingDirection():
	if direction.x > 0:
		sprite.flip_h = false
	elif direction.x < 0:
		sprite.flip_h = true
	
	emit_signal("facingDirectionChanged", !sprite.flip_h)
	

	

	


