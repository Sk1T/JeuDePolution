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
		"Defeat! \n You have failed. Try again!", 
		"Ok"
	)

func _on_main_menu_pressed():
	Transition.change_scene("res://scene/menu.tscn")
	



func _on_quit_pressed():
	get_tree().quit()


func _on_accept_dialog_confirmed():
	get_tree().paused = false
