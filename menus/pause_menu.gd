extends Control

@export var gameManager : GameManager

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	gameManager.connect("toggle_game_paused", _onGameManagerToggleGamePaused)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _onGameManagerToggleGamePaused(isPaused : bool):
	if(isPaused):
		show()
	else:
		hide()


func _on_button_quit_save_pressed():
	gameManager.gamePaused = false
	get_tree().change_scene_to_file("res://menus/main_menu.tscn")

func _on_button_continue_pressed():
	gameManager.gamePaused = false



