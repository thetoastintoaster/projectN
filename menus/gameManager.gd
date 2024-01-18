extends Node

class_name GameManager

signal toggle_game_paused(isPaused : bool)

var gamePaused : bool = false:
	get:
		return gamePaused
	set(value):
		gamePaused = value
		get_tree().paused = gamePaused
		emit_signal("toggle_game_paused", gamePaused)
		
func _input(event : InputEvent):
	if(event.is_action_pressed("pause")):
		gamePaused = !gamePaused
		var currentValue : bool = get_tree().paused
