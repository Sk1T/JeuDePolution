extends Node2D

var rules_scene = preload("res://scene/pop_up_window.tscn")

func _ready():
	show_rules()
	
func show_rules():
	var popup = rules_scene.instantiate()
	var canvas = CanvasLayer.new()
	add_child(canvas)
	canvas.add_child(popup)
	popup.setup("The goal of this game is to clean up the environment and pick up trash! You must pick up and recycle the trash.The game will end once you have recycled enough trash.", "START")
