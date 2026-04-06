extends Node2D

var target_in_area: bool = false
var player_ref: Node2D = null

@onready var hit_timer: Timer = $HitTimer
@onready var rain_sound: AudioStreamPlayer2D = $RainSound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_timer.wait_time = 2.0 #how often the polzone hits the player
	hit_timer.one_shot = false #automatic repetition
	rain_sound.stop()

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		target_in_area = true
		player_ref = body
		hit_timer.start() #starts timer countdown
		
		if not rain_sound.playing:
			rain_sound.volume_db = -40
			rain_sound.play()
			var tween = create_tween()
			tween.tween_property(rain_sound, "volume_db", -5, 1.5)
		
func _on_hitbox_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		target_in_area = false
		player_ref = body
		hit_timer.stop() #stops damage upon exit
		
		var tween_out = create_tween()
		tween_out.tween_property(rain_sound, "volume_db", -40, 1.0)
		tween_out.finished.connect(func(): rain_sound.stop())



func _on_hit_timer_timeout() -> void:
	if target_in_area and player_ref != null:
		player_ref.take_damage(5) #damage func when player is inside
		
