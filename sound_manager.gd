extends Node2D

@onready var hover_snd = $HoverSound
@onready var click_snd = $ClickSound

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	get_tree().node_added.connect(_on_node_added)
	
	for node in get_tree().get_nodes_in_group("buttons"):
		_setup_button(node)
	_scan_all_buttons(get_tree().root)

func _on_node_added(node: Node) -> void:
	if node is Button:
		_setup_button(node)

func _setup_button(button: Button) -> void:
	if not button.mouse_entered.is_connected(_play_hover):
		button.mouse_entered.connect(_play_hover)
	
	if not button.pressed.is_connected(_play_click):
		button.pressed.connect(_play_click)

func _play_hover() -> void:
	if hover_snd:
		hover_snd.pitch_scale = randf_range(0.9, 1.1)
		hover_snd.play()

func _play_click() -> void:
	if click_snd:
		click_snd.play()

func _scan_all_buttons(node: Node) -> void:
	if node is Button:
		_setup_button(node)
	for child in node.get_children():
		_scan_all_buttons(child)
