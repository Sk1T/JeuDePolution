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
	if player:
		player.health_changed.connect(_update_health)
		_update_health(player.health)

func _update_health(new_health: int) -> void:
	var hearts = hearts_container.get_children()
	var max_hearts = len(hearts)
	
	for i in range(max_hearts):
		var heart_hp = new_health - (i * HEART_SIZE)
		
		if heart_hp >= HEART_SIZE:
			hearts[i].texture = HEART_FULL
		elif heart_hp >= 15:
			hearts[i].texture = HEART_75
		elif heart_hp >=10:
			hearts[i].texture = HEART_50
		elif heart_hp >=5:
			hearts[i].texture = HEART_25
		else:
			hearts[i].texture = HEART_0
			
func update_weight(current: float, max_w: float) -> void:
	$WeightUI.update_weight(current, max_w)
