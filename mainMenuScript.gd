extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/buttonStart.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_button_start_pressed():
	get_tree().change_scene_to_file("res://menus/game.tscn")


#func _on_button_options_pressed():
	#var options = load("").instance()
	#get_tree().current_scene.add_child(options)


func _on_button_quit_pressed():
	get_tree().quit()
