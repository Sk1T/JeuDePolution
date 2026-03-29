extends CanvasLayer

const HEART_SIZE: int = 20
var player

const HEART_FULL = preload("res://Assets/UI/heart 100.png")
const HEART_75 = preload("res://Assets/UI/heart 75.png")
const HEART_50 = preload("res://Assets/UI/heart 50.png")
const HEART_25 = preload("res://Assets/UI/heart 25.png")
const HEART_0 = preload("res://Assets/UI/heart 0.png")

@onready var hearts_container: HBoxContainer = $Hearts

func set_player(p) -> void:
	player = p

func _update_health(new_health: int) -> void:
	var hearts = hearts_container.get_children()
	var max_hearts = len(hearts)
	var full = int(new_health / HEART_SIZE)
	var threeq = 1 if (new_health % HEART_SIZE) == 75 else 0
	var half = 1 if(new_health % HEART_SIZE) == 5 else 0
	var oneq = 1 if(new_health % HEART_SIZE) == 25 else 0
	var empty = max_hearts - (full+half)
	
	for i in full:
		hearts[i].texture = HEART_FULL
	if half:
		hearts[full].texture = HEART_50
	for i in empty:
		hearts[len(hearts) - 1 - i].texture = HEART_0
func update_weight(current: float, max_w: float) -> void:
	$WeightUI.update_weight(current, max_w)
