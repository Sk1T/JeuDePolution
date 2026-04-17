extends Node2D


func _on_quit_pressed():#Exit the game
	get_tree().quit()


func _on_play_pressed():#change scene
	Transition.change_scene("res://scene/Level/level_1.tscn")
