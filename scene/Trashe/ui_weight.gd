extends CanvasLayer

@onready var label = $WeightLabel
@onready var bar = $WeightBar
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func update_weight(current: float, max_w: float):
	var ratio = current/ max_w
	
	label.text = "Weight: " + str(snapped(current, 0.1)) + " / " + str(max_w)
	bar.max_value = max_w
	bar.value = current
	
	if ratio >= 0.85:
		bar.tint_progress = Color(1.0, 0.0, 0.0, 1.0) 
		label.add_theme_color_override("font_color",Color.WHITE) 
		
	elif ratio >= 0.5:
		bar.tint_progress = Color(1.0, 1.0, 0.0, 1.0) 
		label.add_theme_color_override("font_color", Color.WHITE) 
		
	else:
		bar.tint_progress = Color(0.0, 1.0, 0.0, 1.0)
		label.add_theme_color_override("font_color", Color.WHITE)
