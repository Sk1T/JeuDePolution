extends CanvasLayer
@onready var anim = $AnimationPlayer
@onready var rect = $ColorRect

func _ready():
	rect.modulate.a = 0
	rect.mouse_filter = Control.MOUSE_FILTER_IGNORE

func change_scene(target_path: String):
	rect.mouse_filter = Control.MOUSE_FILTER_STOP
	anim.play("fade")
	await anim.animation_finished
	
	get_tree().change_scene_to_file(target_path)
	await get_tree().process_frame
	
	anim.play_backwards("fade")
	await anim.animation_finished
	rect.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
