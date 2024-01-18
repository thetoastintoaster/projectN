extends Area2D

@export var damage : int = 10
@export var player : Player
@export var facingShape : FacingCollisionShape2D
func _ready():
	monitoring = false
	player.connect("facingDirectionChanged", _onPlayerFacingDirectionChanged)
func _on_body_entered(body):
	for child in body.get_children():
		if child is Damageable:
			
			#Get direction from sword to the body
			var directionToDamageable = (body.global_position - get_parent(). global_position)
			var directionSign = sign(directionToDamageable.x)
			
			if(directionSign > 0):
				child.hit(damage, Vector2.RIGHT)
			elif(directionSign < 0):
				child.hit(damage, Vector2.LEFT)
			else:
				child.hit(damage, Vector2.ZERO)
			
		#child.hit(damage)
		#print_debug(body.name + " took " + str(damage) + ".")
func _onPlayerFacingDirectionChanged(facingRight : bool):
	if(facingRight):
		facingShape.position = facingShape.facingRightPosition
	else:
		facingShape.position = facingShape.facingLeftPosition
