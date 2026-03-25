extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func update_weight(current: float, max_w: float):
	text = "Вес инвентаря: " + str(current) + " / " + str(max_w)
