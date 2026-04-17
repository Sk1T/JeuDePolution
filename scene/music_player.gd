extends Node2D
@onready var player = $AudioStreamPlayer
func play_music(music_path: String):
	if player.stream and player.stream.resource_path == music_path:
		return
		
	var track = load(music_path)
	player.stream = track
	player.play()
	
func stop_music():
	player.stop()
