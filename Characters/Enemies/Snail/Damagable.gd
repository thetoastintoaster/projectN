extends Node

class_name Damageable

signal on_hit(node: Node, damageTaken : int, knockbackDirection : Vector2)


@export var health: float = 20 :
	get:
		return health
	set(value):
		SignalBus.emit_signal("onHealthChanged", get_parent(), value - health)
		health = value

@export var deadAnimationName : String = "dead"

func hit(damage : int, knockbackDirection : Vector2):
	health -= damage
	
	emit_signal("on_hit", get_parent(), damage, knockbackDirection)
	
	#if(health <= 0):
		#get_parent().queue_free()


func _on_animation_tree_animation_finished(animName):
	if(animName == deadAnimationName):
		
		# Once the death animation is finished playing, remove the entity from the game
		get_parent().queue_free()
