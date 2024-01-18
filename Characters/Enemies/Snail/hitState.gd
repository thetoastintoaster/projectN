extends State

class_name HitState

@export var damageable : Damageable
@export var deadState : State
@export var deadAnimationNode : String = "dead"
@export var knockbackSpeed : float = 100.0
@export var returnState : State

@onready var timer : Timer = $Timer

func _ready():
	damageable.connect("on_hit", onDamageableHit)

func on_enter():
	timer.start()

func onDamageableHit(node: Node, damageAmount : int, knockbackDirection : Vector2):
	if(damageable.health > 0):
		on_enter()		
		character.velocity = knockbackSpeed * knockbackDirection	
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", deadState)
		playback.travel(deadAnimationNode)

func on_exit():
	character.velocity = Vector2.ZERO


func _on_timer_timeout():
	nextState = returnState
