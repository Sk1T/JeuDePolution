# level.gd
extends Node2D

var level: int = 1

func _ready():
	show_rules()
	
func show_rules():
	var popup = rules_scene.instantiate()
	var canvas = CanvasLayer.new()
	add_child(canvas)
	canvas.add_child(popup)
	popup.setup("The goal of this game is to clean up the environment and pick up trash! You must pick up and recycle the trash.The game will end once you have recycled enough trash.", "START")
func _ready() -> void:
	_setup_level(self)

func _setup_level(level_root: Node) -> void:
	var player = level_root.get_node_or_null("Player")
	var exit = level_root.get_node_or_null("Exit")
	if player:
		$HUD.set_player(player)
		player.ui_node = $HUD
	if exit:
		exit.body_entered.connect(_on_exit_body_entered)

func _on_exit_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		call_deferred("_change_level")
func _change_level() -> void:
	PlayerStats.level +=1
	var path = "res://scene/Level/level_%s.tscn" % PlayerStats.level
	if ResourceLoader.exists(path):
		get_tree().change_scene_to_file(path)
	else:
		get_tree().change_scene_to_file("res://scene/menu.tscn")
