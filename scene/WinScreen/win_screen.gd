extends Node2D

func _ready():
	get_tree().paused = true  
	$AcceptDialog.popup_centered()
	

func show_my_dialog():
	get_tree().paused = true  
	$AcceptDialog.popup_centered()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scene/menu.tscn")
	



func _on_quit_pressed():
	get_tree().quit()


func _on_accept_dialog_confirmed():
	get_tree().paused = false
