extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide() 

func _input(event):
	if event.is_action_pressed("ui_cancel"): 
		toggle_pause()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta):
	pass

func toggle_pause():
	var is_paused = !get_tree().paused
	get_tree().paused = is_paused 
	visible = is_paused 


func _on_continue_button_pressed():
	toggle_pause()
	


func _on_quit_pressed():
	get_tree().quit()
