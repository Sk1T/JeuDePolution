extends Node2D

var rules_scene = preload("res://scene/pop_up_window.tscn")

func _ready():
	var rules_instance = rules_scene.instantiate()
	
	var canvas = CanvasLayer.new()
	add_child(canvas)
	
	canvas.add_child(rules_instance)
