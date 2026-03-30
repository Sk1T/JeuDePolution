# level.gd
extends Node2D

var level: int = 1

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
