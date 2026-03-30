extends Node2D

var target_in_area: bool = false
var player_ref: Node2D = null

@onready var hit_timer: Timer = $HitTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hit_timer.wait_time = 2.0 #how often the polzone hits the player
	hit_timer.one_shot = false #automatic repetition

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		target_in_area = true
		player_ref = body
		hit_timer.start() #starts timer countdown

func _on_hitbox_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		target_in_area = false
		player_ref = body
		hit_timer.stop() #stops damage upon exit



func _on_hit_timer_timeout() -> void:
	if target_in_area and player_ref != null:
		player_ref.take_damage(5) #damage func when player is inside
		
