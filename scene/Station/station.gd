extends Node2D

signal progress_changed(current, goal)

@export var goal_price: int = 100 # Combien faut-il collecter pour gagner 
var current_total: int = 0      # Quelle quantité a déjà été traitée 
@onready var recycle_icon = $RecycleSymbol
@onready var recycle_sound = $RecycleSound
@onready var empty_warning = $Attention
var icon_start_y: float
var is_showing_warning: bool = false
var is_processing: bool = false

func _ready() -> void:
	if recycle_icon:
		icon_start_y = recycle_icon.position.y
		recycle_icon.modulate.a = 0
		
		var tween_float = create_tween().set_loops()
		tween_float.tween_property(recycle_icon, "position:y", icon_start_y - 10, 1.2).set_trans(Tween.TRANS_SINE)
		tween_float.tween_property(recycle_icon, "position:y", icon_start_y, 1.2).set_trans(Tween.TRANS_SINE)

func _process(_delta: float) -> void:
	var player = get_tree().get_first_node_in_group("player")
	if player and recycle_icon:
		if player.current_weight > 0:
			show_icon()
		else:
			hide_icon()

func show_icon():
	if recycle_icon.modulate.a < 1.0:
		var t = create_tween()
		t.tween_property(recycle_icon, "modulate:a", 1.0, 0.3)


func hide_icon():
	if recycle_icon.modulate.a > 0.0:
		var t = create_tween()
		t.tween_property(recycle_icon, "modulate:a", 0.0, 0.3)

func show_empty_warning():
	if is_showing_warning:
		return
	is_showing_warning = true
	
	empty_warning.visible = true
	empty_warning.modulate.a = 1.0
	
	var start_pos = empty_warning.position
	var tween = create_tween().set_parallel(true)
	
	tween.tween_property(empty_warning, "position:y", start_pos.y - 40, 2.5).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tween.tween_property(empty_warning, "modulate:a", 0.0, 2.0).set_delay(0.5)
	tween.chain().tween_callback(func():
		empty_warning.visible = false
		empty_warning.position = start_pos
		is_showing_warning = false
	)

func shake_station(duration: float):
	var tween = create_tween()
	var original_pos = position
	
	for i in range(15):
		var random_offset = Vector2(randf_range(-2, 2), randf_range(-2, 2))
		tween.tween_property(self, "position", original_pos + random_offset, duration / 30.0)
		tween.tween_property(self, "position", original_pos, duration / 30.0)
	tween.finished.connect(func(): position = original_pos)

func process_all_garbage(player):
	if is_processing: return
	
	if player.inventory.size() == 0:
		show_empty_warning()
		return
		
	is_processing = true

	var earned_points = 0
	for item in player.inventory:
		earned_points += item["price"]
	
	player.inventory.clear() 
	player.current_weight = 0.0
	player.update_speed()
	
	if player.ui_node:
		player.ui_node.update_weight(0.0, player.max_weight)
	
	if recycle_sound:
		recycle_sound.pitch_scale = randf_range(0.9, 1.1)
		recycle_sound.play()
	
	shake_station(3.0)
	
	await get_tree().create_timer(3.0).timeout
	
	if recycle_sound:
		recycle_sound.stop()
		
	current_total += earned_points
	progress_changed.emit(current_total, goal_price)
	
	is_processing = false
	
	check_win_condition()

func check_win_condition(): # Vérifie si le score atteint l'objectif
	if current_total >= goal_price:
		win_game()

func win_game():
	# Ici, vous pouvez changer de scène :
	MusicPlayer.stop_music()
	Transition.change_scene( "res://scene/WinScreen/win_screen.tscn")
	# Ou mettez simplement le jeu en pause :
	# get_tree().paused = true
