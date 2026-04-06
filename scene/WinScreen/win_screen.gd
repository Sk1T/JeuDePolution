extends Node2D
var popup_scene = preload("res://scene/pop_up_window.tscn")

func _ready():
	get_tree().paused = true  
	show_my_dialog()
	

func show_my_dialog():
	var popup = popup_scene.instantiate()
	var canvas = CanvasLayer.new()
	add_child(canvas)
	canvas.add_child(popup)
	popup.setup(
		"Victory! \n You have cleaned the planet and saved the environment!", 
		"Ok"
	)

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scene/menu.tscn")
	



func _on_quit_pressed():
	get_tree().quit()


func _on_accept_dialog_confirmed():
	get_tree().paused = false
