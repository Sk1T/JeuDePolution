extends Node2D

@onready var play_button: Button = $Play
@onready var quit_button: Button = $Quit

var instructions_button: Button
var instructions_panel: Node
var back_button: Button

func _ready() -> void:
	instructions_button = find_child("Instructions", true, false) as Button
	instructions_panel = find_child("InstructionsPanel", true, false)
	back_button = find_child("Back", true, false) as Button

	if instructions_panel:
		instructions_panel.hide()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_play_pressed() -> void:
	Transition.change_scene("res://scene/Level/level_1.tscn")

func _on_instructions_pressed() -> void:
	play_button.hide()
	if instructions_button:
		instructions_button.hide()
	quit_button.hide()

	if instructions_panel:
		instructions_panel.show()

func _on_back_pressed() -> void:
	if instructions_panel:
		instructions_panel.hide()

	play_button.show()
	if instructions_button:
		instructions_button.show()
	quit_button.show()
