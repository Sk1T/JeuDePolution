extends Node2D

@export var item_name: String = "tire" # Nom de l'objet
@export var price: int = 30 #valeur conditionnelle des déshetes
@export var weight: float = 5.5
var hover_tween: Tween

#func _ready():
	#$Area2D.body_entered.connect(_on_area_2d_body_entered)
	#$Area2D.body_exited.connect(_on_area_2d_body_exited)
	
func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		start_hover()

func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		stop_hover()
		
func start_hover():
	if hover_tween:
		hover_tween.kill()
	
	hover_tween = create_tween().set_loops()
	hover_tween.tween_property($Sprite2D, "position:y", -8, 0.6).set_trans(Tween.TRANS_SINE)
	hover_tween.tween_property($Sprite2D, "position:y", 0, 0.6).set_trans(Tween.TRANS_SINE)

func stop_hover():
	if hover_tween:
		hover_tween.kill()
		
	var fall_tween = create_tween()
	fall_tween.tween_property($Sprite2D, "position:y", 0, 0.2).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
func collect():# Désactive les collisions pour éviter de collecter l'objet deux fois
	$Area2D.set_deferred("monitoring", false)
	$Area2D.set_deferred("monitorable", false)
	
	# on peut ajouter ici le son de collection
	queue_free() # Supprime l'objet de la scène
