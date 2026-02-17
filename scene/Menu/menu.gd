extends Node2D


func _on_quit_pressed():#Exit the game
	get_tree().quit()


func _on_play_pressed():#change scene
	get_tree().change_scene_to_file("res://scene/Level/level.tscn")
