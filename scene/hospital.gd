extends Node2D

@export var heal_amount: int = 100 

@onready var heal_sound = $HealSound

func _ready():
	var tween = create_tween().set_loops()
	var start_y = $Label.position.y
	
	tween.tween_property($Label, "position:y", start_y - 10, 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Label, "position:y", start_y, 1.0).set_trans(Tween.TRANS_SINE)
func collect():
	var player = get_tree().get_first_node_in_group("player")
	
	if player:
		
		if player.health < player.max_health:
			player.heal(heal_amount)
			
			if heal_sound:
				heal_sound.play()
			
	
			
	
		
