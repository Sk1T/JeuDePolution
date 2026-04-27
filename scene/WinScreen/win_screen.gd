extends Node2D

var popup_scene = preload("res://scene/pop_up_window.tscn")

func _ready() -> void:
	get_tree().paused = true
	show_my_dialog()

func show_my_dialog() -> void:
	var popup = popup_scene.instantiate()
	var canvas = CanvasLayer.new()
	add_child(canvas)
	canvas.add_child(popup)
	popup.setup(
		"Victory! \n You have cleaned the planet and saved the environment!",
		"Ok"
	)

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	Transition.change_scene("res://scene/menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_accept_dialog_confirmed() -> void:
	get_tree().paused = false

func _on_replay_button_pressed() -> void:
	get_tree().paused = false
	Transition.change_scene("res://scene/Level/level_1.tscn")
