extends Label

@export var floatSpeed : Vector2 = Vector2(0, -60)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += floatSpeed * delta

func _on_timer_timeout():
	queue_free()
