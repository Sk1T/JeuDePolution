extends CanvasLayer
@onready var bar = $TextureProgressBar

# Called when the node enters the scene tree for the first time.
func _ready():
	bar.value = 0.

func update_progress(current_total, goal_price):
	bar.max_value = goal_price
	var tween = create_tween()
	tween.tween_property(bar, "value", current_total, 0.8).set_trans(Tween.TRANS_SINE)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
